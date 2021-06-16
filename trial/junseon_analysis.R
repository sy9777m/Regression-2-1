I_reg_data = append(total_data[1], total_data[3]) %>% append(., total_data[5]) %>% 
  append(., total_data[7]) %>% append(., total_data[9]) %>% append(., total_data[25]) %>% dataProcessing(.)
I_reg_data[1] = log(I_reg_data[1] * 1000)
pairs(I_reg_data)
fit.I = lm(yearly_co2_emissions_1000_tonnes ~ ., I_reg_data)
summary(fit.I)
anova(fit.I)
drop1(fit.I, test = "F")
residuals(fit.I)
par(mfrow = c(2, 2))
plot(fit.I)

rstandard(fit.I)
rstudent(fit.I)

hatvalues(fit.I)

SSE <- sum(resid(fit.I)^2) ; SSE

sum((resid(fit.I) / (1 - hatvalues(fit.I)))^2)

influence.measures(fit.I)
par(mfrow = c(2, 2))
plot(fit.I, which = c(4, 6))

plot(dffits(fit.I))
abline(h = 2*sqrt(6/63), lty = 2)

plot(covratio(fit.I))
abline(h = 1 + 3*6/63, lty = 2)
abline(h = 1 - 3*6/63, lty = 2)

plot(dfbetas(fit.I)[ , 2]) ; abline(h = sqrt(6/63), lty = 2)
plot(dfbetas(fit.I)[ , 3]) ; abline(h = sqrt(6/63), lty = 2)
plot(dfbetas(fit.I)[ , 4]) ; abline(h = sqrt(6/63), lty = 2)
plot(dfbetas(fit.I)[ , 5]) ; abline(h = sqrt(6/63), lty = 2)
plot(dfbetas(fit.I)[ , 6]) ; abline(h = sqrt(6/63), lty = 2)

lmtest::dwtest(fit.I)

model0 <- lm(yearly_co2_emissions_1000_tonnes ~ 1, I_reg_data)
step(model0, scope = ~ life_expectancy_years + forest_coverage_percent + matfootp + coal_consumption_total + industry_percent_of_gdp, direction = "both")
