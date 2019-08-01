.onLoad <- function(libname, pkgname) {
  shiny::addResourcePath(
    "titanic-assets",
    system.file("assets", package = "titanicon")
  )
}