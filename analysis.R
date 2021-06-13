#Sys.setlocale("LC_ALL","English")
library(regbook)
library(tidyverse)
source('data_processing.r')

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