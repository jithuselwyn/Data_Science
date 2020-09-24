data(flights)
head(flights)
flights<-data.frame(flights)

select(flights, year, month, flight)
filter(flights, month==1, day==1,origin=="EWR")

flights %>%
  select(carrier, dep_delay) %>%
  filter(dep_delay > 60)

flights %>%
  select(carrier, dep_time) %>%
  arrange(dep_time)

flights <- flights %>% mutate(Speed = distance/air_time*60)
flights <- flights %>% mutate(Speed2 = distance/air_time*60)

flights %>%
  group_by(dest) %>%
  summarise(avg_delay = mean(arr_delay, na.rm=T))
            
