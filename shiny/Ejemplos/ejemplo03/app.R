# Ejemplo 3: eventReactive({})


library(shiny)

ui <- fluidPage(
    helpText("Adivina un número del 1 al 10"),
    
    actionButton("go", "Click me!"),
    
    textOutput("out")
)

server <- function(input, output) {
    y = eventReactive(input$go, {sample(1:10,1)})
    
    output$out <- renderText({y()})

}

shinyApp(ui = ui, server = server)
