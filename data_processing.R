library(tidyverse)

total_data = list()
total_data_list = c('yearly_co2_emissions_1000_tonnes', 'population_total', 'life_expectancy_years',
                    'forest_area_sq_km', 'forest_coverage_percent', 'wood_removal_cubic_meters', 'matfootp', 'compt_plastic_wst',
                    'coal_consumption_total', 'electricity_generation_total', 'residential_electricity_use_total',
                    'hydro_power_generation_total', 'natural_gas_production_total', 'nuclear_power_generation_total',
                    'oil_consumption_total', 'oil_production_total', 'energy_production_total', 'investments_percent_of_gdp',
                    'working_hours_per_week', 'gdp_per_capita_yearly_growth', 'gdpperemployee_us_inflation_adjusted',
                    'gdpperworking_hour_us_inflation_adjusted', 'total_gdp_us_inflation_adjusted', 'agriculture_percent_of_gdp',
                    'industry_percent_of_gdp', 'services_percent_of_gdp', 'agriculture_workers_percent_of_employment',
                    'industry_workers_percent_of_employment', 'democracy_score_use_as_color', 'hdi_human_development_index')

price = list()
price['wti'] = 53.965
price['brent'] = 55.97
price['natural_gas'] = 2.9
price['gasoline'] = 169.325
price['heating_oil'] = 163.3
price['gasoil'] = 456.6
price['kerosene'] = 544.63
price['ecx_emission'] = 39.45

for (i in total_data_list) {
  temp = read_csv(paste0('data/', i, '.csv'))
  temp %>% remove_rownames(.) %>% column_to_rownames(var = 'country')
  total_data[[i]] = temp
}

lastest_year_list = c()

for (j in 1:length(total_data)) {
  lastest_year_list[j] = as.numeric(colnames(total_data[[j]])[ncol(total_data[[j]])])
}