library(shiny)

# Bar : Count Offense by Identity

fluidPage(
  sidebarLayout(
    sidebarPanel(
      selectInput("Arrest Type",
                  label = "Choose a Arrest",
                  choices = c("normal", "uniform"))
      ),
      selectInput("Identity",
                  label = "Choose a Arrest",
                  choices = c("Ethnicity", "Sex", "Age"))
    ),
    mainPanel(
      plotOutput("bar"),
      textOutput("summary")
    )
  )
)