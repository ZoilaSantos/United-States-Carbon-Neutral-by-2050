install.packages('tidyverse')
library(tidyverse)

usa_sustainability <- read.csv('usa_sustainability.csv')

#USA greenhouse gas emissions from 2002 to 2019
usa_ghg_emissions_2019 <- usa_sustainability %>% 
  select(year,total_ghg_emissions_mmtco2) %>% 
  filter(year < 2020)

# intercept: 124409.42
# slope: -58.42
# Regression equation: total_ghg_emissions_mmtco2 = -58.42(year) + 124409.42
usa_ghg_emissions_regression <- lm(formula = total_ghg_emissions_mmtco2 ~ year, data = usa_ghg_emissions_2019)

# Predicted total_ghg_emissions_mmtco2 in year 2030 
# 5816.82 mmtco2
total_ghg_emissions_mmtco2_2030_predicted <- -58.42*2030 + 124409.42

# Predicted total_ghg_emissions_mmtco2 in year 2050
# 4648.42 mmtco2
total_ghg_emissions_mmtco2_2050_predicted <- -58.42*2050 + 124409.42

usa_ghg_emissions_with_predicted <- rbind(usa_ghg_emissions_2019, c(2030,total_ghg_emissions_mmtco2_2030_predicted), c(2050,total_ghg_emissions_mmtco2_2050_predicted))

# President Biden aims to reduce greenhouse gas emissions by 65% by 2030 according to his 2021 executive order
# Goal = 2219.91 mmt
total_ghg_emissions_mmtco2_2030_goal <- (-58.42*2021 + 124409.42) - ((-58.42*2021 + 124409.42) * (0.65))

# According to President Biden's 2021 executive order, he aims for the United States to be Carbon Neutral by 2050
# carbon neutral - when the net emission and absorption of CO2 is 0
#Let us assume the United States absorb about 1000 million metric tons of CO2 equivalent a year
total_ghg_emissions_mmtco2_2050_goal <- 1000

usa_ghg_emissions_with_goal <- rbind(usa_ghg_emissions_2019, c(2030,total_ghg_emissions_mmtco2_2030_goal), c(2050,total_ghg_emissions_mmtco2_2050_goal))

usa_ghg_emissions_with_actual <- rbind(usa_ghg_emissions_2019, c(2020,5981), c(2021,6340.2))

