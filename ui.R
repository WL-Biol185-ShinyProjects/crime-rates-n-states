library(leaflet)
library(shiny)
library(shinydashboard)
library(bslib)

ui <- navbarPage(
  
    theme = bs_theme(version = 4, bootswatch = "minty"),
  
          "Crime Rates by States",
                
                tabPanel(div("Home", 
                             img(src    = "home.png", 
                                 height = 19, 
                                 width  = 19,)
                             ),
    
                         fluidRow(
                           p("Welcome to our page! This site analyzes crime data for different precincts around the United States reported to the FBI through the National Incident-Based Reporting System (NIBRS) in 2019. 
Here, you'll discover an interactive state map with rates of different crimes and an interactive graph where you can breakdown crimes by demographic groups. We hope you learn and enjoy!")
                                 )
                         ),
                 
                 tabPanel(div("Maps", 
                              img(src    = "map.png", 
                                  height = 15, 
                                  width  = 25,)
                            ),
                          
                          fluidRow(
                            titlePanel("Mapping Crime"),
                            p("Which states have the highest rate of your chosen crime?"),
                            column(10,
                                   radioButtons("crime_radio", h3("Crime Options"),
                                                choices = list("Shoplifting"                  = "percent_of_shoplifting", 
                                                               "Simple Assault"               = "percent_of_simple_assault",
                                                               "Drug and Narcotic Violations" = "percent_of_drug_and_narcotic_violations", 
                                                               "Burglary"                     = "percent_of_burglary"),
                                                selected = "percent_of_shoplifting")
                                   ),
                            br(),
                            box(width = 14,
                                leafletOutput("crime_map")
                                ),
                            br(),
                            br(),
                            box(width = 12,
                            p("Alaska, California, Florida, New Jersey, and New York did not report any of their crimes to the FBI database. 
                              In addition, most states only reported a fraction of crimes to the FBI, with several precincts within each state 
                              either choosing not to report directly to the FBI or using their own format. To navigate this problem, we calculated
                              the percentage of each type of crime by state in order to more accurately compare the crime rates between states 
                              than if we used raw crime counts.")
                                  )
                                )
                         ),
                    
                 tabPanel(div("Demographics", 
                              img(src    = "man_woman.png", 
                                  height = 15, 
                                  width  = 20)
                              ),
                              
                           fluidPage(
                             titlePanel("Demographic Breakdown by Crime"),
                             p("Which sex, state, or race has the highest rate of your chosen crime?"),
                             sidebarLayout(
                               sidebarPanel(
                                 selectizeInput("OffenseType", 
                                                label = "Choose an Offense Type",
                                                multiple = FALSE,
                                                choices = c( "False Pretenses/Swindle/Confidence Game"   = 'False Pretenses/Swindle/Confidence Game',
                                                             "Statutory Rape"                            = 'Statutory Rape',
                                                             "Sexual Assault With An Object"             = 'Sexual Assault With An Object',
                                                             "Destruction/Damage/Vandalism of Property"  = 'Destruction/Damage/Vandalism of Property',
                                                             "Family Offenses, Nonviolent"               = 'Family Offenses, Nonviolent',
                                                             "Theft of Motor Vehicle Parts or Accessories" = 'Theft of Motor Vehicle Parts or Accessories',
                                                             "Pornography/Obscene Material"              = 'Pornography/Obscene Material',
                                                             "Sports Tampering"                          = 'Sports Tampering',
                                                             "Counterfeiting/Forgery"                    = 'Counterfeiting/Forgery',
                                                             "Welfare Fraud"                             = 'Welfare Fraud',
                                                             "Pocket-picking"                            = 'Pocket-picking',
                                                             "Theft From Motor Vehicle"                  = 'Theft From Motor Vehicle',
                                                             "Assisting or Promoting Prostitution"       = 'Assisting or Promoting Prostitution',
                                                             "Drug/Narcotic Violations"                  = 'Drug/Narcotic Violations',
                                                             "Wire Fraud"                                = 'Wire Fraud',
                                                             "Purse-snatching"                           = 'Purse-snatching',
                                                             "Runaway"                                   = 'Runaway',
                                                             "Arson"                                     = 'Arson',
                                                             "Motor Vehicle Theft"                       = 'Motor Vehicle Theft',
                                                             "Drunkenness"                               = 'Drunkenness',
                                                             "Shoplifting"                               = 'Shoplifting',
                                                             "Operating/Promoting/Assisting Gambling"    = 'Operating/Promoting/Assisting Gambling',
                                                             "Bad Checks"                                = 'Bad Checks',
                                                             "Extortion/Blackmail"                       = 'Extortion/Blackmail',
                                                             "Aggravated Assault"                        = 'Aggravated Assault',
                                                             "Stolen Property Offenses"                  = 'Stolen Property Offenses',
                                                             "Kidnapping/Abduction"                      = 'Kidnapping/Abduction',
                                                             "Prostitution"                              = 'Prostitution',
                                                             "Betting/Wagering"                          = 'Betting/Wagering',
                                                             "Murder and Nonnegligent Manslaughter"      = 'Murder and Nonnegligent Manslaughter',
                                                             "Peeping Tom"                               = 'Peeping Tom',
                                                             "Trespass of Real Property"                 = 'Trespass of Real Property',
                                                             "Drug Equipment Violations"                 = 'Drug Equipment Violations',
                                                             "Embezzlement"                              = 'Embezzlement',
                                                             "Negligent Manslaughter"                    = 'Negligent Manslaughter',
                                                             "Weapon Law Violations"                     = 'Weapon Law Violations',
                                                             "Robbery"                                   = 'Robbery',
                                                             "Credit Card/Automated Teller Machine Fraud" = 'Credit Card/Automated Teller Machine Fraud',
                                                             "Curfew/Loitering/Vagrancy Violations"      = 'Curfew/Loitering/Vagrancy Violations',
                                                             "Sodomy"                                    = 'Sodomy',
                                                             "Intimidation"                              = 'Intimidation',
                                                             "All Other Larceny"                         = 'All Other Larceny',
                                                             "Theft From Building"                       = 'Theft From Building',
                                                             "Burglary/Breaking & Entering"              = 'Burglary/Breaking & Entering',
                                                             "Liquor Law Violations"                     = 'Liquor Law Violations',
                                                             "Disorderly Conduct"                        = 'Disorderly Conduct',
                                                             "Gambling Equipment Violation"              = 'Gambling Equipment Violation',
                                                             "Incest"                                    = 'Incest',
                                                             "Bribery"                                   = 'Bribery',
                                                             "Human Trafficking, Commercial Sex Acts"    = 'Human Trafficking, Commercial Sex Acts',
                                                             "Human Trafficking, Involuntary Servitude"  = 'Human Trafficking, Involuntary Servitude',
                                                             "Identity Theft"                            = 'Identity Theft',
                                                             "Hacking/Computer Invasion"                 = 'Hacking/Computer Invasion',
                                                             "Animal Cruelty"                            = 'Animal Cruelty',
                                                             "Impersonation"                             = 'Impersonation',
                                                             "Simple Assault"                            = 'Simple Assault',
                                                             "Fondling"                                  = 'Fondling',
                                                             "Purchasing Prostitution"                   = 'Purchasing Prostitution',
                                                             "Rape"                                      = 'Rape',
                                                             "Theft From Coin-Operated Machine or Device" = 'Theft From Coin-Operated Machine or Device',
                                                             "Driving Under the Influence"               = 'Driving Under the Influence',
                                                             "All Other Offenses"                        = 'All Other Offenses')
                                            ),
                                 selectInput("RaceSexState",
                                             label    = "Compare by Sex, State, or Race",
                                             multiple = FALSE,
                                             choices  = c("Sex"   = 'sex', 
                                                          "State" = 'state_name',
                                                          "Race"  = 'race')
                                            )
                                          ),
                             mainPanel(
                               plotOutput("demographic_bar")
                                      ),
                                          )
                                  ),
                          p("Where is this information from? FBI Crime Data reports the offense and offender's sex and race for crime incidents across the United States. The individual-level data was grouped by the offense type, sex, state, and race for visualization."),
                          ),
              
                 navbarMenu("More",
                            tabPanel("About the Creators",
                                  fluidPage(
                                       titlePanel("About the Creators"),
                                       sidebarLayout(column(3,
                                          sidebarPanel( 
                                                       actionButton("natasha", label = "Natasha Gengler"),
                                                       actionButton("leah",    label = "Leah Jackson"),
                                                       actionButton("hieu",    label = "Hieu Nguyen")
                                                       )
                                                            ),
                                         mainPanel(    textOutput("selected_var")
                                                  )
                                                    )
                                           ) 
                                     ),
                            
                            tabPanel("Citations",
                                     fluidRow(
                                       p("Our data are from the Federal Bureau of Investigation Crime Data Explorer Page. 
                                         All of the data are available to public."
                                         )
                                       )
                                     )
                          )
                 )
