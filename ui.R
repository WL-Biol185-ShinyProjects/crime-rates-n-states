library(leaflet)
library(shiny)
library(shinydashboard)

ui <- navbarPage("Crime Rates by States",
                # tabPanel( "Home" #a summary of project, can highlight this in a color and make it 'Home'
                         #),
                 
                 tabPanel("Map", # maps
                          fluidRow(
                            p("Look at a map of crimes in the USA."),
                           
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
                    
                 tabPanel("Demographics", # demographic breakdown data
                           fluidPage(
                             titlePanel("Demographic Breakdowns"),
                             sidebarLayout(
                               sidebarPanel(
                                 selectizeInput("OffenseType", 
                                                label = "Choose a Offense Type",
                                                multiple = TRUE,
                                                choices = c( "Illegal Entry into the United States"      = 'Illegal Entry into the United States',
                                                             "False Citizenship"                         = 'False Citizenship',
                                                             "Smuggling Aliens"                          = 'Smuggling Aliens',
                                                             "Re-entry after Deportation"                = 'Re-entry after Deportation',
                                                             "Failure to Register as a Sex Offender"     = 'Failure to Register as a Sex Offender',
                                                             "Harboring Escapee/Concealing from Arrest"  = 'Harboring Escapee/Concealing from Arrest',
                                                             "Flight to Avoid Prosecution"               = 'Flight to Avoid Prosecution',
                                                             "Flight to Avoid Deportation"               = 'Flight to Avoid Deportation',
                                                             "Violation of National Firearm Act of 1934" = 'Violation of National Firearm Act of 1934',
                                                             "Weapons of Mass Destruction"               = 'Weapons of Mass Destruction',
                                                             "Explosives Violation"                      = 'Explosives Violation',
                                                             "Import Violations"                         = 'Import Violations',
                                                             "Export Violations"                         = 'Export Violations',
                                                             "Federal Liquor Offenses"                   = 'Federal Liquor Offenses',
                                                             "Federal Tobacco Offenses"                  = 'Federal Tobacco Offenses',
                                                             "Wildlife Trafficking"                      = 'Wildlife Trafficking',
                                                             "Not Specified"                             = 'Not Specified',
                                                             "Justifiable Homicide"                      = 'Justifiable Homicide',
                                                             "False Pretenses/Swindle/Confidence Game"   = 'False Pretenses/Swindle/Confidence Game',
                                                             "Statutory Rape"                            = 'False Pretenses/Swindle/Confidence Game',
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
                                                             "Failure to Appear"                         = 'Failure to Appear',
                                                             "Federal Resource Violations"               = 'Federal Resource Violations',
                                                             "Perjury"                                   = 'Perjury',
                                                             "Treason"                                   = 'Treason',
                                                             "Espionage"                                 = 'Espionage',
                                                             "Impersonation"                             = 'Impersonation',
                                                             "Simple Assault"                            = 'Simple Assault',
                                                             "Fondling"                                  = 'Fondling',
                                                             "Purchasing Prostitution"                   = 'Purchasing Prostitution',
                                                             "Money Laundering"                          = 'Money Laundering',
                                                             "Rape"                                      = 'Rape',
                                                             "Theft From Coin-Operated Machine or Device" = 'Theft From Coin-Operated Machine or Device',
                                                             "Driving Under the Influence"               = 'Driving Under the Influence',
                                                             "All Other Offenses"                        = 'All Other Offenses')
                                            ),
                                 selectInput("RaceSexState",
                                             label    = "Choose a Sex, Race, or State",
                                             multiple = FALSE,
                                             choices  = c("Race"  = 'race', 
                                                          "Sex"   = 'sex', 
                                                          "State" = 'state_name')
                                            )
                                          ),
                             mainPanel(
                               plotOutput("demographic_bar")
                                      ),
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
                                                       actionButton("hieu",    label = "Hieu Nguyen"))
                                                            ),
                                         mainPanel(    textOutput("selected_var")
                                                  )
                                                    )
                                           ) 
                                     ),
                            tabPanel("Citations",
                                     fluidpanel(
                                       p("Our data was taken from the Federal Bureau of Investigation Crime Data Explorer Page. 
                                         All of the data are available to public.")
                                     ))
                          )
                 )

                        




