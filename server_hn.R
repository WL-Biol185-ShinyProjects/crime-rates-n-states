---
title: "server.r"
author: "me"
date: "10/13/2021"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

library(shiny)
library(leaflet)

function(input, output, session) {
  
  lats <- -90:90
  lons <- -180:180
  
  output$worldMap <- renderLeaflet({
    
    # note the dummy use of the action button input
    btn <- input$newButton
    
    leaflet() %>% 
      setView(lng = sample(lons, 1), lat = sample(lats, 1), zoom = 5) %>% 
      addTiles()
  })
  
}