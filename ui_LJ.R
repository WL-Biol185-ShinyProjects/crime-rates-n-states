library(shiny)

# Bar : Offense by Race & Sex

fluidPage(
  sidebarLayout(
    sidebarPanel(
      selectInput("OffenseType",
                  label = "Choose a Offense Type",
                  multiple = FALSE,
                  choices = c("Drug and Narcotics" = 'Drug/Narcotic Violations', "Shoplifting" = 'Shoplifting')
                 ),
      selectInput("RaceSex",
                  label = "Choose a Race or Sex",
                  multiple = FALSE,
                  choices = c("Race" = 'race', "Sex" = 'sex')
               ),
    mainPanel(
      plotOutput("bar"),
      textOutput("summary")
             )
              )
             )
        )
