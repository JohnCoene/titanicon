library(shiny)
library(titanicon)

ui <- fluidPage(
  use_titanicon(), # imports dependencies
  titanicon_theme(style = "height:100px;float:left;"), # applies to all icons
  titanicon("caps"),
  titanicon("chat"),
  titanicon("checkbox"),
  titanicon("expand"),
  titanicon("cheap"),
  titanicon("expensive"),
  titanicon("idea"),
  titanicon("mailbox"),
  titanicon("mic"),
  titanicon("no-mic"),
  titanicon("online"),
  titanicon("pause"),
  titanicon("power"),
  titanicon("shopping"),
  titanicon("smile"),
  titanicon("stop"),
  titanicon("unlock"),
  titanicon("zoom"),
  titanicon_opts(click = FALSE) # options
)

server <- function(input, output){}

shinyApp(ui, server)
