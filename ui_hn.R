library(leaflet)
library(shiny)
library(shinydashboard)
library(ggplot2)
library(tidyverse)
library(rgdal)
library(png)
library(htmltools)


#first tab
tabItem(tabName= "leaflet",
        fluidRow(
          
          p("View how APR is distributed regionally:"),
          box(width = 14,
              leafletOutput("aprMap")
          )
        )
)