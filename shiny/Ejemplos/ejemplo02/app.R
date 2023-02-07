# Ejemplo 2: reactive({})

library(shiny)

ui <- fluidPage(
  sliderInput(inputId = "num", 
    label = "Elige un número", 
    value = 25, min = 1, max = 100),
  plotOutput("hist"),
  verbatimTextOutput("summary"),
  verbatimTextOutput("summary2")

)

server <- function(input, output) {
  
  x = function(){rnorm(input$num)}
  # x = reactive({rnorm(input$num)})
  
  output$hist <- renderPlot({
    hist(x())
  })
  output$summary <- renderPrint({
    summary(x())
  })
  output$summary2 <- renderPrint({
    summary(x())
  })
  
}

shinyApp(ui = ui, server = server)