source("renv/activate.R")

if (Sys.getenv("RUSER") == "DHERSZ") source("~/.Rprofile")

# rJavaEnv begin: Manage JAVA_HOME
if (dir.exists("rjavaenv")) {
  platform <- list.files("rjavaenv")
  arch <- list.files(file.path("rjavaenv", platform))
  version <- "11"
  
  rjavaenv_cache_dir <- tools::R_user_dir("rJavaEnv", "cache")
  
  java_home_path <- file.path(
    rjavaenv_cache_dir,
    "installed",
    platform, arch, version
  )
  
  Sys.setenv(JAVA_HOME = java_home_path)
  old_path <- Sys.getenv('PATH') # rJavaEnv
  new_path <- file.path(Sys.getenv('JAVA_HOME'), 'bin') # rJavaEnv
  Sys.setenv(PATH = paste(new_path, old_path, sep = .Platform$path.sep)) # rJavaEnv
  rm(old_path, new_path) # rJavaEnv
}
# rJavaEnv end: Manage JAVA_HOME
