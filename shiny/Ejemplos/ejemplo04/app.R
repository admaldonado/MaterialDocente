# Ejemplo 4: session

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Choose dataset"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            selectInput("dataset", "Choose dataset",
                        choices = c("faithful", "iris", "mtcars")),
            
            selectInput("var", "Choose variable", choices = "", multiple = T),
            
            actionButton("go", "Actualizar")

        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("plot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output, session) {
    
    datasetInput <- reactive({
        switch(input$dataset,
               "faithful" = faithful,
               "iris" = iris,
               "mtcars" = mtcars)
    })
    
    observe({ updateSelectInput(session, "var", choices = colnames(datasetInput())) })

    plotData <- eventReactive(input$go, {
        datasetInput()[,input$var]
    })
    

    output$plot <- renderPlot({

      plot(plotData())
    })
    

    # observeEvent(input$go, {
    #   output$plot <- renderPlot({
    #     
    #     plot(plotData())
    #   })
    # })

}

# Run the application 
shinyApp(ui = ui, server = server)
