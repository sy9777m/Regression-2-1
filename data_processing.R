

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

for (i in total_data_list) {
  temp = read_csv(paste0('data/', i, '.csv'))
  total_data[[i]] = temp
}

dataProcessing = function(data_list) {
  lastest_year_list = c()
  
  for (j in 1:length(data_list)) {
    lastest_year_list[j] = as.numeric(colnames(data_list[[j]])[ncol(data_list[[j]])])
  }
  
  lastest_year = min(lastest_year_list)
  country_list = data_list[[1]][['country']]
  
  result = tibble(.rows = length(country_list))
  
  for (j in 1:length(data_list)) {
    rownames(data_list[[j]]) = data_list[[j]][['country']]
    for (c in country_list) {
      if (!(c %in% data_list[[j]][['country']])) {
        data_list[[j]][(nrow(data_list[[j]]) + 1),] = NA
        data_list[[j]][(nrow(data_list[[j]])), 'country'] = c
        rownames(data_list[[j]])[nrow(data_list[[j]])] = c
      }
    }
    result = result %>% add_column(data_list[[j]] %>% filter(., country %in% country_list) %>% .[as.character(lastest_year)])
    colnames(result)[j] = names(data_list)[j]
  }
  
  rownames(result) = country_list
  
  result = result %>% drop_na()
  
  char_df = result[, unlist(lapply(result, is.character))]
  
  if (nrow(char_df) * ncol(char_df) != 0) {
    for (j in 1:length(char_df)) {
      temp_df = char_df[j]
      temp_vector = c()
      result_df = tibble(.rows = nrow(temp_df))
      
      for (i in 1:nrow(temp_df)) {
        if (grepl('B', temp_df[i, 1], fixed = TRUE)) {
          temp_vector[i] = as.double(str_sub(temp_df[i, 1], 1, -2)) * (10^9)
        }
        else if (grepl('M', temp_df[i, 1], fixed = TRUE)) {
          temp_vector[i] = as.double(str_sub(temp_df[i, 1], 1, -2)) * (10^6)
        }
        else if (grepl('k', temp_df[i, 1], fixed = TRUE)) {
          temp_vector[i] = as.double(str_sub(temp_df[i, 1], 1, -2)) * (10^3)
        }
        else {
          temp_vector[i] = as.double(temp_df[i, 1])
        }
      }
      
      result[, names(char_df)[j]] = temp_vector
    }
  }
  
  print(paste0('lastest year: ', lastest_year))
  
  return(result)
}