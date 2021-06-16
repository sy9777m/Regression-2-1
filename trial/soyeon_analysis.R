#Sys.setlocale("LC_ALL","English")
library(regbook)
library(tidyverse)
source('data_processing.r')

carbon = read_csv('data/co2_emissions_world_bank.csv')
total_data[['carbon']] = carbon

total_data[['carbon']] = carbon
total_data[['greenhouse']] = greenhouse_worldbank
total_data[['electricity_from_renewable']] = electricity_from_renewable

second_reg_data = append(list(carbon = carbon), total_data[10:12]) %>% dataProcessing(.)
second_reg_data[1] = log(second_reg_data[1] * 3.664 * 1000)
pairs(second_reg_data)
second_fit = lm(carbon ~ ., second_reg_data)
summary(second_fit)

population_reg_data = dataProcessing(total_data[1:3])
population_reg_data[1] = log(population_reg_data[1] * 1000)
pairs(population_reg_data)
pop_fit = lm(yearly_co2_emissions_1000_tonnes ~ ., population_reg_data)
summary(pop_fit)

environment_reg_data = dataProcessing(append(total_data[1], total_data[4:8]))
environment_reg_data[1] = log(environment_reg_data[1] * 1000)
pairs(environment_reg_data)
env_fit = lm(yearly_co2_emissions_1000_tonnes ~ ., environment_reg_data)
summary(env_fit)


energy_reg_data = dataProcessing(append(total_data[1], total_data[9:17]))

economy_reg_data = dataProcessing(append(total_data[1], total_data[18:26]))

labor_reg_data = dataProcessing(append(total_data[1], total_data[27:28]))

society_reg_data = dataProcessing(append(total_data[1], total_data[29:30]))




energy_fit = lm(yearly_co2_emissions_1000_tonnes ~ ., energy_reg_data)
summary(energy_fit)
economy_fit = lm(yearly_co2_emissions_1000_tonnes ~ ., economy_reg_data)
summary(economy_fit)
labor_fit = lm(yearly_co2_emissions_1000_tonnes ~ ., labor_reg_data)
summary(labor_fit)
society_fit = lm(yearly_co2_emissions_1000_tonnes ~ ., society_reg_data)
summary(society_fit)

#1
first_reg_data = dataProcessing(append(total_data[1], total_data[5]))

#3
first_reg_data = append(total_data[1], total_data[7]) %>% append(., total_data[15]) %>% 
  append(., total_data[20]) %>% dataProcessing(.)
#4
first_reg_data = append(total_data[1], total_data[5]) %>% append(., total_data[15]) %>%
  append(., total_data[20]) %>% dataProcessing(.)
#5
first_reg_data = append(total_data[1], total_data[3]) %>% append(., total_data[6]) %>% 
  append(., total_data[8]) %>% append(., total_data[20])%>% append(., total_data[8])%>%dataProcessing(.)
#6
first_reg_data = append(total_data[1], total_data[3]) %>% append(., total_data[4]) %>% 
  append(., total_data[7]) %>% append(., total_data[9])%>% append(., total_data[20]) %>% 
  append(., total_data[23])%>%dataProcessing(.)

#2
first_reg_data = append(total_data[1], total_data[7]) %>% append(., total_data[20]) %>% dataProcessing(.)
first_reg_data[1] = log(first_reg_data[1] * 1000)
pairs(first_reg_data)
first_fit = lm(yearly_co2_emissions_1000_tonnes ~ ., first_reg_data)
summary(first_fit)
anova(first_fit)
influence.measures(first_fit)
dwtest(first_fit)
par(mfrow = c(2, 2))
plot(first_reg_data)
par(mfrow = c(1, 1))

plot(cooks.distance(first_fit))
abline(h = 3.67/58, lty = 2)



