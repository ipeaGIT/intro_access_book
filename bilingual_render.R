# delete previous rendered book when running locally

if (fs::dir_exists("en_book")) fs::dir_delete("en_book")
if (fs::dir_exists("_book")) fs::dir_delete("_book")

# copy book content to auxiliary directory

fs::dir_copy(".", "en_book")
fs::dir_delete("en_book/renv")
if (fs::dir_exists("en_book/_freeze")) fs::dir_delete("en_book/_freeze")
if (fs::dir_exists("en_book/en_freeze")) {
  fs::dir_copy("en_book/en_freeze", "en_book/_freeze")
}

# render pt book

quarto::quarto_render(as_job = FALSE)
if (fs::dir_exists("pt")) fs::dir_delete("pt")
fs::file_move("_book", "pt")

# change some yml fields before rendering english book

en_yml <- yaml::read_yaml("_quarto.yml")
en_yml$lang <- "en"
en_yml$crossref <- NULL
en_yml$book$title <- "Introduction to urban accessibility"
en_yml$book$subtitle <- "a practical guide with R"
en_yml$book$language <- "en"
en_yml$book$`cover-image` <- "images/cover.en.png"
en_yml$book$`site-url` <- "https://ipeagit.github.io/intro_access_book"
en_yml$book$chapters <- lapply(
  en_yml$book$chapters,
  function(x) {
    if (is.character(x)) {
      gsub("\\.qmd", ".en.qmd", x)
    } else {
      list(
        part = gsub("\\.qmd", ".en.qmd", x$part),
        chapters = as.list(gsub("\\.qmd", ".en.qmd", x$chapters))
      )
    }
  }
)
en_yml$book$sidebar <- NULL
en_yml$citation$title <- "Introduction to urban accessibility: a practical guide with R"
en_yml$citation$publisher <- "Ipea - Institute for Applied Economic Research"
en_yml$citation$url <- "https://ipeagit.github.io/intro_access_book"

yaml::write_yaml(
  en_yml,
  "en_book/_quarto.yml",
  handlers = list(
    logical = function(x) {
      result <- ifelse(x, "true", "false")
      class(result) <- "verbatim"
      return(result)
    }
  )
)

quarto::quarto_render("en_book", as_job = FALSE)

# copy english book content to _book (to be the default book) and move
# portuguese book content to this directory as well

fs::dir_copy("en_book/_book", "_book")
fs::file_move("pt", "_book/pt")

# move english book cache to top level directory

if (fs::dir_exists("en_freeze")) fs::dir_delete("en_freeze")
fs::dir_copy("en_book/_freeze", "en_freeze")

# add link to english version in portuguese chapters

pt_html <- fs::dir_ls("_book/pt", glob = "*.html")

invisible(lapply(
  pt_html,
  function(html_page) {
    content <- xml2::read_html(html_page)
    sidebar <- xml2::xml_find_all(content, "//div[@id='quarto-margin-sidebar']")
    
    xml2::xml_add_child(
      sidebar,
      "a",
      "Read in English",
      href = paste0("../", sub("\\.html", ".en.html", basename(html_page)))
    )
    
    xml2::write_html(content, html_page)
  }
))

# add link to portuguese version in english chapters

en_html <- fs::dir_ls("_book", glob = "*.html")

invisible(lapply(
  en_html,
  function(html_page) {
    content <- xml2::read_html(html_page)
    sidebar <- xml2::xml_find_all(content, "//div[@id='quarto-margin-sidebar']")
    
    xml2::xml_add_child(
      sidebar,
      "a",
      "Leia em português",
      href = paste0("pt/", sub("\\.en\\.html", ".html", basename(html_page)))
    )
    
    xml2::write_html(content, html_page)
  }
))

# copy index.en.html to index.html in english book to tidy up "homepage"

fs::file_copy("_book/index.en.html", "_book/index.html", overwrite = TRUE)
