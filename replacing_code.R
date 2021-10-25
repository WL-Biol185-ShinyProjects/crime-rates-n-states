library(ggplot2)
library(maps)

ggplot(data   = aggregate_edited, 
       mapping = aes(x     = long, 
                     y     = lat, 
                     group = group, 
                     fill  = aggregate_edited$offense_type)) + 
  
  geom_polygon(color = "gray90",
             size = 0.1) + 
  
  coord_map(projection = "albers", 
            lato = 39, 
            lat1 = 45) + 
  
  labs(title = "Offense Type") + 
  
  labs(fill = "Percent") + 
  
  scale_fill_gradient(low = "white", 
                      high = "#CB454A") + 
  
  labs(title = "Offense Type") + 
  
  labs(fill= "Percentage")

  