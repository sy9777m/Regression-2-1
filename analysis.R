#Sys.setlocale("LC_ALL","English")
library(regbook)
library(tidyverse)
source('data_processing.r')

population_reg_data = dataProcessing(total_data[1:3])
population_reg_data[1] = population_reg_data[1] * 1000
environment_reg_data = dataProcessing(append(total_data[1], total_data[4:8]))
environment_reg_data[1] = environment_reg_data[1] * 1000
energy_reg_data = dataProcessing(append(total_data[1], total_data[9:17]))
energy_reg_data[1] = energy_reg_data[1] * 1000
economy_reg_data = dataProcessing(append(total_data[1], total_data[18:26]))
economy_reg_data[1] = economy_reg_data[1] * 1000
labor_reg_data = dataProcessing(append(total_data[1], total_data[27:28]))
labor_reg_data[1] = labor_reg_data[1] * 1000
society_reg_data = dataProcessing(append(total_data[1], total_data[29:30]))
society_reg_data[1] = society_reg_data[1] * 1000

pop_fit = lm(yearly_co2_emissions_1000_tonnes ~ ., population_reg_data)
env_fit = lm(yearly_co2_emissions_1000_tonnes ~ ., environment_reg_data)
energy_fit = lm(yearly_co2_emissions_1000_tonnes ~ ., energy_reg_data)
economy_fit = lm(yearly_co2_emissions_1000_tonnes ~ ., economy_reg_data)
labor_fit = lm(yearly_co2_emissions_1000_tonnes ~ ., labor_reg_data)
society_fit = lm(yearly_co2_emissions_1000_tonnes ~ ., society_reg_data)
