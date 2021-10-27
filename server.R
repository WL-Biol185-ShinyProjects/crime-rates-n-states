library(shiny)
library(ggplot2)
library(maps)
library(dplyr)
library(tidyverse)

# globalMean <- read.delim(".../global-mean.txt", header = TRUE)


function(input, output) {
  x <- reactive({
    if (input$distribution == "normal") {
      rnorm(100, input$number)
    } else {
      runif(100, max = input$number)
    }
    
  })
  
  
  output$hist <- renderPlot({
    
    col <- if (input$distribution == "normal") {
      "pink"
    } else { "green"
    }
    hist(x(), col = col)
    
  })
  
  
  output$summary <- renderText({
    summary(x())

    
    
  })
  
}
