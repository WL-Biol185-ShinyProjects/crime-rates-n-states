output$demographic_bar <- renderPlot({
  if (input$X_axis     == "Type"){
    HPV_Prevalence %>%
      filter(Country   == input$chosen_country) %>%
      filter(Histology == "Any Histology")      %>%
      ggplot(aes_string("Type", "Prevalence"))          +
      geom_bar(stat     = 'identity', fill = "#F8AE9E") +
      theme(axis.text.x = element_text(size = 9, angle = 90, hjust = 1))
  } else{
    HPV_Prevalence %>%
      filter(Type      == input$chosen_type)    %>%
      filter(Histology == "Any Histology")      %>%
      ggplot(aes_string("Country", "Prevalence"))       +
      geom_bar(stat     = 'identity', fill  = "#F8AE9E")+
      theme(axis.text.x = element_text(size = 9, angle = 90, hjust = 1))
  }
})



output$demographic_bar <- renderPlot({
  
  count_df <- aggregate_edited %>% 
    filter(offense_type %in% !!input$OffenseType) %>% 
    count(offense_type, !!input$RaceSexState)
  
  ggplot(data         = count_df, 
         aes_string(x = input$RaceSexState, 
                    y = "n"
         )) +
    geom_bar()