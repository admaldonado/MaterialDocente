ui <- fluidPage(
  textOutput("greeting")
)

server <- function(input, output) {
  output$greeting <- "Hello human!"
}

shinyApp(ui = ui, server = server)