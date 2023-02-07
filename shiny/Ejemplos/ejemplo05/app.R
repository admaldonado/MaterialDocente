# Ejemplo 5: tabsetPane()

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
    titlePanel("Old Faithful Geyser Data"),
    tabsetPanel(
        tabPanel("Primera pestaña",
                 # Sidebar with a slider input for number of bins 
                 sidebarLayout(
                     sidebarPanel(
                         sliderInput("bins",
                                     "Number of bins:",
                                     min = 1,
                                     max = 50,
                                     value = 30)
                     ),
                     
                     # Show a plot of the generated distribution
                     mainPanel(
                         tabsetPanel(
                             tabPanel("Histograma",
                                     plotOutput("distPlot")
                                     ),
                             tabPanel("Dispersión",
                                      plotOutput("plot2")
                                      )
                             )
                         
                         
                     )
                 )
        ),
        tabPanel("Segunda pestaña"),
        tabPanel("Tercera pestaña")
    )

)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
    })
    
    output$plot2 <- renderPlot({
        plot(faithful)
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
