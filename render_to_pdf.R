render_to_pdf <- function(lang = c("pt", "en")) {
  lang <- lang[1]
  
  if (lang == "pt") {
    render_portuguese_pdf()
  } else {
    render_english_pdf()
  }
}

render_portuguese_pdf <- function() {
  tmpdir <- tempfile()
  dir.create(tmpdir)
  
  fs::dir_copy(".", tmpdir)
  
  fs::dir_delete(file.path(tmpdir, "renv"))
  if (fs::dir_exists(file.path(tmpdir, "_freeze"))) {
    fs::dir_delete(file.path(tmpdir, "_freeze"))
  }
  
  if (fs::dir_exists(file.path(tmpdir, "pdf_pt_freeze"))) {
    fs::dir_copy(
      file.path(tmpdir, "pdf_pt_freeze"),
      file.path(tmpdir, "_freeze")
    )
  }
  
  quarto::quarto_render(tmpdir, output_format = "pdf", as_job = FALSE)
  
  fs::file_move(
    file.path(tmpdir, "_book", "Introdução-à-acessibilidade-urbana.pdf"),
    "pt_book.pdf"
  )
  if (fs::dir_exists("pdf_pt_freeze")) fs::dir_delete("pdf_pt_freeze")
  fs::file_move(file.path(tmpdir, "_freeze"), "pdf_pt_freeze")
}

render_english_pdf <- function() {
  tmpdir <- tempfile()
  dir.create(tmpdir)
  
  fs::dir_copy(".", tmpdir)
  
  fs::dir_delete(file.path(tmpdir, "renv"))
  if (fs::dir_exists(file.path(tmpdir, "_freeze"))) {
    fs::dir_delete(file.path(tmpdir, "_freeze"))
  }
  
  if (fs::dir_exists(file.path(tmpdir, "pdf_en_freeze"))) {
    fs::dir_copy(
      file.path(tmpdir, "pdf_en_freeze"),
      file.path(tmpdir, "_freeze")
    )
  }
  
  en_yml <- yaml::read_yaml(file.path(tmpdir, "_quarto.yml"))
  en_yml$lang <- "en"
  en_yml$crossref <- NULL
  en_yml$book$title <- "Introduction to urban accessibility"
  en_yml$book$subtitle <- "a practical guide with R"
  en_yml$book$language <- "en"
  en_yml$book$`cover-image` <- "images/cover.en.png"
  en_yml$book$`site-url` <- "https://ipeagit.github.io/aop_curso/en"
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
  
  yaml::write_yaml(
    en_yml,
    file.path(tmpdir, "_quarto.yml"),
    handlers = list(
      logical = function(x) {
        result <- ifelse(x, "true", "false")
        class(result) <- "verbatim"
        return(result)
      }
    )
  )
  
  quarto::quarto_render(tmpdir, output_format = "pdf", as_job = FALSE)
  
  fs::file_move(
    file.path(tmpdir, "_book", "Introduction-to-urban-accessibility.pdf"),
    "en_book.pdf"
  )
  if (fs::dir_exists("pdf_en_freeze")) fs::dir_delete("pdf_en_freeze")
  fs::file_move(file.path(tmpdir, "_freeze"), "pdf_en_freeze")
}


render_to_docx <- function(lang = c("pt", "en")) {
  lang <- lang[1]
  
  if (lang == "pt") {
    render_portuguese_docx()
  } else {
    render_english_docx()
  }
}

render_portuguese_docx <- function() {
  tmpdir <- tempfile()
  dir.create(tmpdir)
  
  fs::dir_copy(".", tmpdir)
  
  fs::dir_delete(file.path(tmpdir, "renv"))
  if (fs::dir_exists(file.path(tmpdir, "_freeze"))) {
    fs::dir_delete(file.path(tmpdir, "_freeze"))
  }
  
  if (fs::dir_exists(file.path(tmpdir, "docx_pt_freeze"))) {
    fs::dir_copy(
      file.path(tmpdir, "docx_pt_freeze"),
      file.path(tmpdir, "_freeze")
    )
  }
  
  quarto::quarto_render(tmpdir, output_format = "docx", as_job = FALSE)
  
  fs::file_move(
    file.path(tmpdir, "_book", "Introdução-à-acessibilidade-urbana.docx"),
    "pt_docx_book.docx"
  )
  if (fs::dir_exists("docx_pt_freeze")) fs::dir_delete("docx_pt_freeze")
  fs::file_move(file.path(tmpdir, "_freeze"), "docx_pt_freeze")
}

render_english_docx <- function() {
  tmpdir <- tempfile()
  dir.create(tmpdir)
  
  fs::dir_copy(".", tmpdir)
  
  fs::dir_delete(file.path(tmpdir, "renv"))
  if (fs::dir_exists(file.path(tmpdir, "_freeze"))) {
    fs::dir_delete(file.path(tmpdir, "_freeze"))
  }
  
  if (fs::dir_exists(file.path(tmpdir, "docx_en_freeze"))) {
    fs::dir_copy(
      file.path(tmpdir, "docx_en_freeze"),
      file.path(tmpdir, "_freeze")
    )
  }
  
  en_yml <- yaml::read_yaml(file.path(tmpdir, "_quarto.yml"))
  en_yml$lang <- "en"
  en_yml$crossref <- NULL
  en_yml$book$title <- "Introduction to urban accessibility"
  en_yml$book$subtitle <- "a practical guide with R"
  en_yml$book$language <- "en"
  en_yml$book$`cover-image` <- "images/cover.en.png"
  en_yml$book$`site-url` <- "https://ipeagit.github.io/aop_curso/en"
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
  
  yaml::write_yaml(
    en_yml,
    file.path(tmpdir, "_quarto.yml"),
    handlers = list(
      logical = function(x) {
        result <- ifelse(x, "true", "false")
        class(result) <- "verbatim"
        return(result)
      }
    )
  )
  
  quarto::quarto_render(tmpdir, output_format = "docx", as_job = FALSE)
  
  fs::file_move(
    file.path(tmpdir, "_book", "Introduction-to-urban-accessibility.docx"),
    "en_docx_book.docx"
  )
  if (fs::dir_exists("docx_en_freeze")) fs::dir_delete("docx_en_freeze")
  fs::file_move(file.path(tmpdir, "_freeze"), "docx_en_freeze")
}