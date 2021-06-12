library(tidyverse)

resetData = function() {
  co2_emission_per_person = read_csv('data/co2_emissions_tonnes_per_person.csv')
  co2_emission_total = read_csv('data/yearly_co2_emissions_1000_tonnes.csv')
  
  pop = read_csv('data/population/population_total.csv')
  pop_growth = read_csv('data/population/population_growth_annual_percent.csv')
  new_birth = read_csv('data/population/new_births_total_number_estimated.csv')
  life_expect = read_csv('data/population/life_expectancy_years.csv')
  
  agricultural_land_percent = read_csv('data/environment/agricultural_land_percent_of_land_area.csv')
  composition_plastic_waste = read_csv('data/environment/compt_plastic_wst.csv')
  forest_area_sq_km = read_csv('data/environment/forest_area_sq_km.csv')
  forest_coverage = read_csv('data/environment/forest_coverage_percent.csv')
  forest_land_area = read_csv('data/environment/forest_land_total_area_ha.csv')
  material_foot = read_csv('data/environment/matfootp.csv')
  wood_removal = read_csv('data/environment/wood_removal_cubic_meters.csv')
  
  coal_consumption_per_cap = read_csv('data/energy/coal_consumption_per_cap.csv')
  coal_consumption_total = read_csv('data/energy/coal_consumption_total.csv')
  electricity_generation_per_person = read_csv('data/energy/electricity_generation_per_person.csv')
  electricity_generation_total = read_csv('data/energy/electricity_generation_total.csv')
  energy_production_per_person = read_csv('data/energy/energy_production_per_person.csv')
  energy_production_total = read_csv('data/energy/energy_production_total.csv')
  hydro_power_generation_per_person = read_csv('data/energy/hydro_power_generation_per_person.csv')
  hydro_power_generation_total = read_csv('data/energy/hydro_power_generation_total.csv')
  natural_gas_production_per_person = read_csv('data/energy/natural_gas_production_per_person.csv')
  natural_gas_production_total = read_csv('data/energy/natural_gas_production_total.csv')
  nuclear_power_generation_per_person = read_csv('data/energy/nuclear_power_generation_per_person.csv')
  nuclear_power_generation_total = read_csv('data/energy/nuclear_power_generation_total.csv')
  oil_consumption_per_cap = read_csv('data/energy/oil_consumption_per_cap.csv')
  oil_consumption_total = read_csv('data/energy/oil_consumption_total.csv')
  oil_production_per_cap = read_csv('data/energy/oil_production_per_person.csv')
  oil_production_total = read_csv('data/energy/oil_production_total.csv')
  residential_electricity_use_per_person = read_csv('data/energy/residential_electricity_use_per_person.csv')
  residential_electricity_use_total = read_csv('data/energy/residential_electricity_use_total.csv')
  
  agriculture_percent = read_csv('data/economy/agriculture_percent_of_gdp.csv')
  gdp_per_capita_growth = read_csv('data/economy/gdp_per_capita_yearly_growth.csv')
  gdp_per_capita = read_csv('data/economy/gdppercapita_us_inflation_adjusted.csv')
  gdp_per_employee = read_csv('data/economy/gdpperemployee_us_inflation_adjusted.csv')
  gdp_per_working = read_csv('data/economy/gdpperworking_hour_us_inflation_adjusted.csv')
  income = read_csv('data/economy/income_per_person_gdppercapita_ppp_inflation_adjusted.csv')
  industry_percent = read_csv('data/economy/industry_percent_of_gdp.csv')
  investment_percent = read_csv('data/economy/investments_percent_of_gdp.csv')
  service_percent = read_csv('data/economy/services_percent_of_gdp.csv')
  total_gdp = read_csv('data/economy/total_gdp_us_inflation_adjusted.csv')
  working_hours_per_week = read_csv('data/economy/working_hours_per_week.csv')
  
  agriculture_workers_percent = read_csv('data/work/agriculture_workers_percent_of_employment.csv')
  industry_workers_percent = read_csv('data/work/industry_workers_percent_of_employment.csv')
  
  democracy_score = read_csv('data/Society/democracy_score_use_as_color.csv')
  hdi = read_csv('data/Society/hdi_human_development_index.csv')
  military_expenditure_percent = read_csv('data/Society/military_expenditure_percent_of_gdp.csv')
  
  dataProcessing()
}

dataProcessing = function () {
  
}
