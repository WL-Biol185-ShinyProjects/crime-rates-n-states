library(shiny)
ui <- navbarPage("Crime Rates by States",
                 tabPanel( "Home" #a summary of project, can highlight this in a color and make it 'Home'
                          ),
                 
                 tabPanel("Map" # maps 
                   ),
                    
                 tabPanel( "Demographics", # demographic breakdown data
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
                                 )),
                                 mainPanel(
                                   plotOutput("bar"),
                                   textOutput("summary")
                                 )
                               )
                             )
                           ),
                
                 
                 navbarMenu("More",
                            tabPanel("About the Creators",
                                  fluidPage(
                                    #theme = bs_theme(version = 4, bootswatch = "minty"),
                                       titlePanel("About the Creators"),
                                       sidebarLayout(column(3,
                                         sidebarPanel( 
                                                       actionButton("natasha", label = "Natasha Gengler"),
                                                       actionButton("leah",    label = "Leah Jackson"),
                                                       actionButton("hieu",    label = "Hieu Nguyen")),
                                                            ),
                                         mainPanel(    textOutput("selected_var")
                                                )
                                       ))),
                            tabPanel("Citations"))
                 )
                        




