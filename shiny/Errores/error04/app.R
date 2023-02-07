ui <- fluidPage(
  textOutput("greeting")
)

server <- function(input, output) {
  message("The greeting is ", output$greeting)
}

shinyApp(ui, server)