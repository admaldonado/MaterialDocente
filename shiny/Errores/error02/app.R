ui <- fluidPage(
  numericInput("count", label = "Number of values", value = 100)
)

server <- function(input, output) {
  message("The value of input$count is ", input$count)
}

shinyApp(ui, server)