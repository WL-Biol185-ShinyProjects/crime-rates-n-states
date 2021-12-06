library(leaflet)
library(shiny)
library(shinydashboard)
library(bslib)

ui <- shiny::navbarPage(
  
    theme = shinytheme("united"),
  
          "Crime Rates by States",
                
                tabPanel(div("Home", 
                             img(src    = "home.png", 
                                 height = 19, 
                                 width  = 19,)
                             ),
    
                         fluidRow(
                           column(10, 
                                    p("Welcome to our page! This site analyzes crime data for different precincts around the United States reported to the FBI through the National Incident-Based Reporting System (NIBRS) in 2019. 
                                 Here, you'll discover an interactive state map with rates of different crimes and an interactive graph where you can breakdown crimes by demographic groups. We hope you learn and enjoy!"
                                    )
                                  )
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
                                                             "Driving Under the Influence"               = 'Driving Under the Influence')
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
                                           align = "center", 
                                           width = 12,
                                       column(width = 3,
                                              p("Hi, my name is Hieu Nguyen, Class of 2022, from Portland, OR. I am a neuroscience major and film minor. My passions include cooking, making videos, and singing. My favorite thing about this class is being able to construct representations of an unimaginably large data set. I’ve gained so much knowledge about the world through the interactive graphs that my group has made. My goal is to be a physician so I can help minority groups in the future. ")
                                              ),
                                       
                                       column(width = 3,
                                              p("Howdy! My name is Leah Jackson, Class of 2022, from Savannah, GA. I am a Biology major and Film and Visual Culture minor. My passions are gardening and talking about film and media. My aspirations are to become a physician and serve underserved communities while educating others about their health. 
")
                                       ),
                                       
                                       column(width = 3,
                                              p("Hello! My name is Natasha “Tash” Gengler, Class of 2022, from Wilmington, DE. I’m a math major and creative writing minor. Some of my hobbies include DJing a radio show, vegetarian cooking, and thrift shopping. Coming from a background of absolutely no coding experience, this class has been so helpful in learning how to code for data presentation. In the future, I hope to work as a physician and research rare diseases.  
")
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
