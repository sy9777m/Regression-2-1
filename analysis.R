#Sys.setlocale("LC_ALL","English")
library(regbook)
library(tidyverse)
source('data_processing.r')

sample_data_list = total_data[1:3]

regAnalysis <- function(data_list) {
  lastest_year_list = c()
  country_number_list = c()
  
  for (j in 1:length(data_list)) {
    lastest_year_list[j] = as.numeric(colnames(data_list[[j]])[ncol(data_list[[j]])])
    country_number_list[j] = nrow(data_list[[j]])
  }
  
  lastest_year = min(lastest_year_list)
  country_list = data_list[[match(min(country_number_list), country_number_list)]]['country']
  
  #fit = lm(data_list[[1]] ~ data_list[[2]] + data_list[[3]])
  #print(fit)
}

regAnalysis(sample_data_list)

#1st analysis