library(leaflet)
library(shiny)
library(shinydashboard)
library(ggplot2)
library(tidyverse)
library(rgdal)
library(png)
library(htmltools)


#first tab
tabItem(tabName= "CrimeMap",
        fluidRow(
          p("Look at a map of crimes in the USA."),
          box(width = 14,
              leafletOutput("CrimeMap")
          )
        )
)

tabPanel("Map", 
         fluidRow(
           p("Look at a map of crimes in the USA."),
           box(width = 14,
               leafletOutput("CrimeMap"
               )
           )
         )
)