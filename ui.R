library(shiny)
ui <- fluidPage(
  
  titlePanel("Tabsets"),
  
  sidebarLayout(
    
    sidebarPanel(
      sliderInput("number", label = h3("Slider Range"), min = 0, 
                  max = 100, value = c(40, 60)),
      
      selectInput("distribution",
                  label = "Choose a distribution",
                  choices = c("normal", "uniform"))
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Plot", plotOutput("hist")), 
        tabPanel("Summary", verbatimTextOutput("summary")), 
        tabPanel("Table", tableOutput("table"))
      )
    )
  )
)