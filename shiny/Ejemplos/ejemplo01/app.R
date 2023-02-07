# Ejemplo 1: reactive({})

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
    
    # Application title
    titlePanel("Old Faithful Geyser Data"),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 5,
                        max = 50,
                        value = 30),
            radioButtons("variable", "Plot variable:",
                         choices = colnames(faithful), inline = T)
            
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot"),
            verbatimTextOutput("breaks")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    x <- reactive({
        # choose variable to represent
        faithful[, input$variable]
    })
    
    
    bins <<- reactive({
        # generate bins based on input$bins from ui.R
        seq(min(x()), max(x()), length.out = input$bins + 1)
    })
    
    
    output$distPlot <- renderPlot({
            
            main = ifelse(input$variable == "waiting", 
                          "Histograma del tiempo de espera entre erupciones",
                          "Histograma de la duración de las erupciones")
            xlab = ifelse(input$variable == "waiting",
                          "Tiempo de espera entre erupciones (min)",
                          "Duración de las erupciones (min)")
                

            # draw the histogram with the specified number of bins
            hist(x(), breaks = bins(), 
                 col = 'orange', 
                 border = 'darkgray',
                 main = main,
                 xlab = xlab)
    })
    
    
    output$breaks <- renderPrint({
        # Print breaks
            bins()
    })
    
}

# Run the application 
shinyApp(ui = ui, server = server)
