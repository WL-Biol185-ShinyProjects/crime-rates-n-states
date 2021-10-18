library(shiny)

# Bar : Count Offense by Identity

function(input, output) {
  
  x <- reactive({
    if(
      input$ArrestType == "normal") {
      rnorm(100, input$number)
    } else {
      runif(100, max = input$number)
    }
  })
  
  output$bar <- renderPlot({
    
    col <- if (input$distribution == "normal") {"lightblue"
    } else { 
      "lightgreen"
    }
    
    p <- offense type
    q <- gender, race, age, ethnicity, under18
    
    ggplot(dat, 
           aes(p, fill = q)) + 
      geom_bar() + 
      theme(legend.position = "right")
  })
  
  output$summary <- renderText({
    summary(x())
    
  })
}


