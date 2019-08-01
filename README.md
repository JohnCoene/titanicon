# titanicon

<!-- badges: start -->
<!-- badges: end -->

Brings [Titanic animated icons](https://icons8.com/c/animated-icons) to Shiny and Rmarkdown.

## Installation

``` r
# install.packages("remotes")
remotes::install_github("rinterface/titanicon")
```

## Example

Browse all icon with:

```r
titanicon::titanicon_demo()
```

Below is a self-explanatory example.

```r
library(shiny)
library(titanicon)

ui <- fluidPage(
  use_titanicon(), # imports dependencies
  titanicon_theme(style = "height:100px;"), # applies to all subsequent icons
  titanicon("idea"),
  titanicon("mic"),
  titanicon_opts(click = FALSE) # options
)

server <- function(input, output){}

shinyApp(ui, server)
```
