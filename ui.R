library(shiny)
ui <- navbarPage("Crime Rates by States",
                 tabPanel( "Home" #a summary of project, can highlight this in a color and make it 'Home'
                          ),
                 
                 tabPanel("Map" # maps 
                   ),
                    
                 tabPanel( "Demographics" # demographic breakdown data
                   ),
                 
                 navbarMenu("More",
                            tabPanel("About the Creators"),
                            tabPanel("Citations"))
                 )
                        




