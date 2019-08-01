#' Titanicon
#' 
#' All titanicon functions.
#' 
#' @param hover,click Whether to trigger the animation on hover and click.
#' @param icon An icon, see below for valid icons.
#' @param ... Any other option or element passed to \link[shiny]{div}.
#' @param class Any additional class(es).
#' 
#' @section Icons:
#' \itemize{
#'   \item{\code{caps}}
#'   \item{\code{chat}}
#'   \item{\code{checkbox}}
#'   \item{\code{expand}}
#'   \item{\code{cheap}}
#'   \item{\code{expensive}}
#'   \item{\code{idea}}
#'   \item{\code{mailbox}}
#'   \item{\code{mic}}
#'   \item{\code{no-mic}}
#'   \item{\code{online}}
#'   \item{\code{pause}}
#'   \item{\code{power}}
#'   \item{\code{shopping}}
#'   \item{\code{smile}}
#'   \item{\code{stop}}
#'   \item{\code{unlock}}
#'   \item{\code{zoom}}
#' }
#' 
#' @import shiny
#' 
#' @name dependencies
#' @export
use_titanicon <- function(){
  singleton(
    tags$head(
      tags$script(src = "titanic-assets/titanic.min.js"),
      tags$script(src = "titanic-assets/bodymovin.min.js")
    )
  )
}

#' @rdname dependencies
#' @export
titanicon_opts <- function(hover = TRUE, click = TRUE){
  opts <- list(
    hover = hover,
    click = click
  )
  json <- jsonlite::toJSON(opts, auto_unbox = TRUE)
  json <- as.character(json)
  script <- paste0("var titanic = new Titanic(", json, ");")

  singleton(tags$script(script))
}

#' @rdname dependencies
#' @export
titanicon_theme <- function(...){
  opts <- list(...)
  options("TITANICON_THEME" = opts)
  invisible()
}

#' @rdname dependencies
#' @export
reset_titanicon_theme <- function(){
  options("TITANICON_THEME" = NULL)
}

#' @rdname dependencies
#' @export
titanicon <- function(icon, ..., class = ""){
  if(missing(icon)) stop("missing icon", call. = FALSE)
  class <- paste0(class, collaspe = " ")
  cl <- paste0("titanic titanic-", icon, " ", class)
  tg <- shiny::div(class = cl, ...)
  opts <- getOption("TITANICON_THEME")
  if(!is.null(opts))
    tg$attribs <- append(tg$attribs, opts)
  return(tg)
}

#' Titanicon Demo
#'
#' Demo of all icons available.
#'
#' @export
#'
#' @examples
#' if(interactive()) {
#'  titanicon_demo()
#' }
titanicon_demo <- function() { 
  shiny::shinyAppFile(
    system.file(
      "examples/demo.R", 
      package = 'titanicon', 
      mustWork = TRUE
    )
  )
}