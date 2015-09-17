library(dplyr)
library(reshape2)
library(jsonlite)
cities <- read.csv("cities_geo.csv")
cities <- select(cities, -(lat:long))
cities <- select(cities, -(rank:city))

melted <- melt(cities, id.vars=c("code"), as.is = FALSE, variable.name="year", value.name = "population")
str(melted)

melted <- arrange(melted, code)
splitted <- split(melted, melted$code)

write(toJSON(splitted, na="null", pretty=TRUE),file="places/cities_chart.json")