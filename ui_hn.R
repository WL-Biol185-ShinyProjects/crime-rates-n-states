---
title: "ui.r"
author: "me"
date: "10/13/2021"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

library(shiny)
library(leaflet)

fluidPage(
  # map output
  leafletOutput("worldMap"),
  
  # line break (puts some space between map and button)
  br(),
  
  # a button
  actionButton("newButton", "New place!")
)