library(shiny)

# Bar : Offense by Race & Sex

fluidPage(
  sidebarLayout(
    sidebarPanel(
      selectInput("OffenseType",
                  label = "Choose a Offense Type",
                  choices = c("normal", "uniform"))
      ),
      selectInput("RaceSex",
                  label = "Choose a Race or Sex",
                  choices = c("Race", "Sex"))
    ),
    mainPanel(
      plotOutput("bar"),
      textOutput("summary")
    )
  )