# read data on population of american indians and indian americans and make plots
# indian americans by state - http://www.indiawest.com/news/3783-analysis-of-the-indian-american-community-from-census-2010-data.html
# american indians by state - http://en.wikipedia.org/wiki/Native_Americans_in_the_United_States
# us population by state - http://en.wikipedia.org/wiki/List_of_U.S._states_and_territories_by_population

# read data
pop_data <- read.delim("pop_indians.txt", as.is = TRUE)

# calculate number per 1000 of total population
pop_data$Indian_American <- sprintf("%.1f", pop_data$Pop_IndAm * 1000 
                                    / pop_data$Tot_Pop)
pop_data$American_Indian <- sprintf("%.1f", pop_data$Pop_AmInd * 1000 
                                    / pop_data$Tot_Pop)

# load libraries
library(googleVis)

# plot american indians
chart_1 <- gvisGeoChart(data = pop_data, 
                        locationvar = "State",
                        colorvar = "American_Indian", 
                        options = list(region = "US", 
                                       displayMode = "regions", 
                                       resolution = "provinces",
                                       colorAxis = "{minValue: 0, maxValue: 150}",
                                       width = 600, 
                                       height = 400),
                        chartid = "AmInd")

plot(chart_1)

# plot indian americans
chart_2 <- gvisGeoChart(data = pop_data, 
                        locationvar = "State",
                        colorvar = "Indian_American", 
                        options = list(region = "US", 
                                       displayMode = "regions", 
                                       resolution = "provinces", 
                                       colorAxis = "{minValue: 0, maxValue: 150}",
                                       width = 600, 
                                       height = 400),
                        chartid = "IndAm")

plot(chart_2)
