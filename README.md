# Exam

## Table of Contents  
1. [Introduction](#introduction)  
2. [Dataset](#dataset)  
3. [EDA (Exploratory Data Analysis)](#eda-exploratory-data-analysis)  
4. [Financial Learning](#financial-learning)  
5. [Bayesian Learning](#bayesian-learning)  
6. [Conclusions](#conclusions)  

## Introduction  

The project aims to predict the default of Italian Small and Medium Enterprises (SMEs) using various statistical learning techniques. The primary research question guiding this analysis is:  

**"Which statistical learning approach provides the most accurate and reliable predictions for SME default risk in Italy?"**  

To address this, the project evaluates and compares 2 approaches:
1. Financial Learning 
2. Bayesian Learning


## Dataset  
The dataset includes financial indicators (in standardised values) for a sample of 2049 Italian small-medium enterprises (SMEs) in 2018 and information about their status (Flag variable; 0=Active, 1=Defaulted) one year later.

The variables of the dataset:
- Flag  
- Total_assets  
- Shareholders_funds  
- Long_term_debt  
- Loans  
- Turnover  
- EBITDA  
- Net_income  
- Tangible_fixed_assets  
- Profit_Loss_after_tax  
- Current_liabilities  
- Current_assets  
- Net_income_on_Total_Assets  
- Leverage  
- Tangible_on_total_assets



## EDA (Exploratory Data Analysis)  
Cheked with command "print(sum(is.na(data)))" if there are missing values.
The result is 0 missing values.

with the command: "summary(data)" we anaylze our variables:

| Statistic   | Flag     | Total_assets | Shareholders_funds | Long_term_debt | Loans      | Turnover   | EBITDA     | Net_income  | Tangible_fixed_assets | Profit_Loss_after_tax | Current_liabilities | Current_assets | Net_income_on_Total_Assets | Leverage   | Tangible_on_total_assets |
|-------------|----------|--------------|--------------------|----------------|------------|------------|------------|--------------|-----------------------|-----------------------|--------------------|----------------|---------------------------|------------|--------------------------|
| Min.        | 0.00000  | -0.379995     | -0.31611            | -0.273864       | -0.287190  | -0.54400   | -1.48038   | -4.44506     | -0.343716              | -4.748423              | -0.409138           | -0.54253        | -8.300345                  | -0.589090  | -0.932028                |
| 1st Qu.     | 0.00000  | -0.242710     | -0.27329            | -0.273864       | -0.287190  | -0.21123   | -0.32716   | -0.22537     | -0.325433              | -0.233488              | -0.251286           | -0.31731        | -0.321765                  | -0.589090  | -0.790738                |
| Median      | 0.00000  | -0.151646     | -0.20815            | -0.273864       | -0.281337  | -0.09581   | -0.18035   | -0.15583     | -0.260832              | -0.158837              | -0.141358           | -0.16175        | -0.170741                  | -0.589090  | -0.375594                |
| Mean        | 0.06833  | -0.014183     | -0.01096            | -0.005915       | -0.019908  | -0.02592   | -0.01793   | -0.01425     | -0.000627              | -0.007344              | -0.008854           | -0.01445        |  0.009819                  |  0.006074  |  0.006065                |
| 3rd Qu.     | 0.00000  | -0.004814     | -0.02641            | -0.076514       |  0.006891  |  0.07194   |  0.08090   |  0.05976     | -0.045495              |  0.072584              |  0.012002           |  0.04629        |  0.256082                  |  0.235578  |  0.543831                |
| Max.        | 1.00000  | 18.908105     | 17.51151            | 15.399444       | 24.976590  | 26.97940   | 21.74522   | 15.79219     | 15.414282              | 16.601217              | 20.834466           | 24.83200        |  3.409903                  |  4.072354  |  3.114502                |


**The default rate is  0.06832601**

**Distribution of each variable**

![801d4885-2e7f-418e-a35a-8151cd4562d4](https://github.com/user-attachments/assets/da9c68df-d362-40a2-8c18-138a66e9fdc6)

![257b6963-eec8-4602-963a-dd6702![1791f6ea-45eb-4001-91bc-00664657ef03](https://github.com/user-attachments/assets/718d6468-d66a-4de1-8a9c-4dc651142582)
8a5f33](https://github.com/user-attachments/assets/5d6eaa90-5d9c-4724-a948-55409f241766)
![f51![8911bd22-f468-4d04-97f2-6e86b26e99d6](https://github.com/user-attachments/assets/077bc86b-81ee-454f-a640-768f874ceed0)
2296a-6e9b-400e-9aa7-69b62b64968e](https://github.com/user-attachments/assets/e483e02a-7302-4dde-9c4f-3d9970c8d51b)
![ec20b81a-83c7-4818-a297-cac0b14b08fc](https://github.com/user-attachments/assets/e72e1d04-665f-4a20-8157-b3fc820a98a0)
![d6d14![8bcd2ae0-f1b9-4d94-87fb-6258018b5775](https://github.com/user-attachments/assets/626dd787-9323-4a9f-a9b6-245ae332fe1e)
07a-7bcd-4fa4-9e5a-08c913f11e4f](https://github.com/user-attachments/assets/5374db3d-ee21-45e3-aa61-d4899a0383b9)
!![693f90da-72c0-4bd6-8a35-3cee9e43f640](https://github.com/user-attachments/assets/135cacea-9cdb-4991-8bb8-244b2fd04033)
[72920![886e7b30-03ed-4a69-96d0-6053f48a0231](https://github.com/user-attachments/assets/fd66c527-86fc-436d-87ef-d3496a4010ca)
d9c-9029-4bb1-8cfc-9225a341de44](https://github.com/user-attachments/assets/ca65ddd9-a265-4080-b42c-b8e9ff63f690)

![69812989-d5bc-45c4-b10d-3779884bfc32](https://github.com/user-attachments/assets/09bf151e-853b-44e1-aa87-6e28fcd263b2)
![5c7cf9b9-18a3-48b0-9a40-53fb0a8f9c67](https://github.com/user-attachments/assets/99db874d-921d-48fe-ab48-2514c19623f6)

![f93ee1d5-0d9b-4467-b2aa-c0052e4ca15a](https://github.com/user-attachments/assets/d15526d4-656c-471e-bf02-41ebdec9bf97)



**Correlation matrix**

| **Variable**               | **Flag** | **Total_assets** | **Shareholders_funds** | **Long_term_debt** | **Loans** | **Turnover** | **EBITDA** | **Net_income** | **Tangible_fixed_assets** | **Profit_Loss_after_tax** | **Current_liabilities** | **Current_assets** | **Net_income_on_Total_Assets** | **Leverage** | **Tangible_on_total_assets** |
|----------------------------|----------|------------------|------------------------|--------------------|-----------|--------------|------------|----------------|----------------------------|--------------------------|------------------------|--------------------|--------------------------------|--------------|----------------------------|
| **Flag**                   | 1.000000 | 0.120135         | 0.065515               | 0.021874           | 0.066947  | 0.086075     | 0.066736   | -0.014107      | 0.050775                  | -0.014763                | 0.139092               | 0.087262            | -0.236280                    | -0.085759    | -0.062352                  |
| **Total_assets**           | 0.120135 | 1.000000         | 0.799717               | 0.487353           | 0.553106  | 0.543062     | 0.667485   | 0.271552       | 0.712671                  | 0.267494                | 0.915710               | 0.775949            | 0.001880                     | 0.086082     | 0.196559                  |
| **Shareholders_funds**     | 0.065515 | 0.799717         | 1.000000               | 0.327333           | 0.371205  | 0.410217     | 0.521549   | 0.513540       | 0.572102                  | 0.508739                | 0.555177               | 0.650968            | 0.091663                     | 0.009553     | 0.210004                  |
| **Long_term_debt**         | 0.021874 | 0.487353         | 0.327333               | 1.000000           | 0.330673  | 0.060256     | 0.170314   | -0.097026      | 0.531025                  | -0.097865               | 0.346402               | 0.396220            | -0.074976                    | 0.557805     | 0.271232                  |
| **Loans**                  | 0.066947 | 0.553106         | 0.371205               | 0.330673           | 1.000000  | 0.630621     | 0.405781   | 0.184351       | 0.228420                  | 0.180468                | 0.587200               | 0.680304            | -0.034765                    | 0.180990     | 0.073458                  |
| **Turnover**               | 0.086075 | 0.543062         | 0.410217               | 0.060256           | 0.630621  | 1.000000     | 0.645126   | 0.421704       | 0.120212                  | 0.419033                | 0.566604               | 0.649621            | 0.097107                     | -0.000610    | -0.012307                  |
| **EBITDA**                 | 0.066736 | 0.667485         | 0.521549               | 0.170314           | 0.405781  | 0.645126     | 1.000000   | 0.571742       | 0.369585                  | 0.573066                | 0.608392               | 0.513782            | 0.337960                     | 0.050950     | 0.157352                  |
| **Net_income**             | -0.014107| 0.271552         | 0.513540               | -0.097026          | 0.184351  | 0.421704     | 0.571742   | 1.000000       | -0.066144                 | 0.999946                | 0.126995               | 0.395780            | 0.544851                     | -0.048617    | -0.054412                  |
| **Tangible_fixed_assets**  | 0.050775 | 0.712671         | 0.572102               | 0.531025           | 0.228420  | 0.120212     | 0.369585   | -0.066144      | 1.000000                  | -0.067513               | 0.609736               | 0.297549            | -0.065170                    | 0.188769     | 0.553759                  |
| **Profit_Loss_after_tax**  | -0.014763| 0.267494         | 0.508739               | -0.097865          | 0.180468  | 0.419033     | 0.573066   | 0.999946       | -0.067513                 | 1.000000                | 0.123849               | 0.391167            | 0.548562                     | -0.048762    | -0.054582                  |
| **Current_liabilities**    | 0.139092 | 0.915710         | 0.555177               | 0.346402           | 0.587200  | 0.566604     | 0.608392   | 0.126995       | 0.609736                  | 0.123849                | 1.000000               | 0.719490            | -0.035749                    | 0.019858     | 0.095107                  |
| **Current_assets**         | 0.087262 | 0.775949         | 0.650968               | 0.396220           | 0.680304  | 0.649621     | 0.513782   | 0.395780       | 0.297549                  | 0.391167                | 0.719490               | 1.000000            | 0.044429                     | 0.046599     | -0.058964                 |
| **Net_income_on_Total_Assets** | -0.236280 | 0.001880 | 0.091663 | -0.074976 | -0.034765 | 0.097107 | 0.337960 | 0.544851 | -0.065170 | 0.548562 | -0.035749 | 0.044429 | 1.000000 | -0.060431 | -0.071141 |
| **Leverage**               | -0.085759 | 0.086082         | 0.009553               | 0.557805           | 0.180990  | -0.000610    | 0.050950   | -0.048617      | 0.188769                  | -0.048762               | 0.019858               | 0.046599            | -0.060431                    | 1.000000     | 0.374895                  |
| **Tangible_on_total_assets**| -0.062352 | 0.196559         | 0.210004               | 0.271232           | 0.073458  | -0.012307    | 0.157352   | -0.054412      | 0.553759                  | -0.054582               | 0.095107               | -0.058964           | -0.071141                    | 0.374895     | 1.000000                  |


## Financial Learning

### Logistic regression

| Variable                     | Estimate   | Std. Error | z value  | Pr(>|z|)   | Significance |
|------------------------------|------------|------------|---------|------------|--------------|
| **Intercept**                | -3.27901   | 0.26411    | -12.415 | < 2e-16    | ***          |
| **Total assets**             | 0.05921    | 1.13432    | 0.052   | 0.95837    |              |
| **Shareholders' funds**      | -0.25349   | 0.53592    | -0.473  | 0.63621    |              |
| **Long-term debt**           | 0.27565    | 0.27326    | 1.009   | 0.31311    |              |
| **Loans**                    | 0.34406    | 0.21044    | 1.635   | 0.10205    |              |
| **Turnover**                 | -0.21333   | 0.33877    | -0.630  | 0.52888    |              |
| **EBITDA**                   | 0.14363    | 0.42098    | 0.341   | 0.73297    |              |
| **Net income**               | -12.48034  | 28.78873   | -0.434  | 0.66464    |              |
| **Tangible fixed assets**     | 0.12988    | 0.39019    | 0.333   | 0.73924    |              |
| **Profit/Loss after tax**     | 12.25367   | 26.97032   | 0.454   | 0.64958    |              |
| **Current liabilities**       | 0.18736    | 0.63805    | 0.294   | 0.76903    |              |
| **Current assets**            | -0.21803   | 0.41994    | -0.519  | 0.60363    |              |
| **Net income/Total Assets**   | -1.42109   | 0.18349    | -7.745  | 9.56e-15   | ***          |
| **Leverage**                 | -0.61194   | 0.23931    | -2.557  | 0.01056    | *            |
| **Tangible/Total Assets**     | -0.56079   | 0.20922    | -2.680  | 0.00735    | **           |

### Model Performance:
- **Null deviance:** 715.20 (on 1434 degrees of freedom)  
- **Residual deviance:** 551.92 (on 1420 degrees of freedom)  
- **AIC:** 581.92  
- **Fisher Scoring Iterations:** 6  

#### Significance codes:
- `***` = p < 0.001 (Highly Significant)  
- `**` = p < 0.01 (Moderately Significant)  
- `*` = p < 0.05 (Significant)  

**odds ratio**

| Variable                     | exp(Estimate) | Interpretation |
|------------------------------|--------------|----------------|
| **Intercept**                | 0.03767      | Baseline odds of Flag = 1 |
| **Total assets**             | 1.0610       | A 1-unit increase → 6.1% higher odds |
| **Shareholders' funds**      | 0.7761       | A 1-unit increase → 22.4% lower odds |
| **Long-term debt**           | 1.3174       | A 1-unit increase → 31.7% higher odds |
| **Loans**                    | 1.4107       | A 1-unit increase → 41.1% higher odds |
| **Turnover**                 | 0.8079       | A 1-unit increase → 19.2% lower odds |
| **EBITDA**                   | 1.1545       | A 1-unit increase → 15.4% higher odds |
| **Net income**               | 3.80e-06     | Near zero, suggests no meaningful effect |
| **Tangible fixed assets**     | 1.1387       | A 1-unit increase → 13.9% higher odds |
| **Profit/Loss after tax**     | 209750.6     | Extremely large effect, check data validity |
| **Current liabilities**       | 1.2061       | A 1-unit increase → 20.6% higher odds |
| **Current assets**            | 0.8041       | A 1-unit increase → 19.6% lower odds |
| **Net income/Total Assets**   | 0.2415       | A 1-unit increase → 75.9% lower odds |
| **Leverage**                  | 0.5423       | A 1-unit increase → 45.8% lower odds |
| **Tangible/Total Assets**     | 0.5708       | A 1-unit increase → 42.9% lower odds |


- Values **> 1** indicate **higher odds** of `Flag = 1` when the variable increases.
- Values **< 1** indicate **lower odds** of `Flag = 1` when the variable increases.
- **Extremely large or small values** (e.g., `Net Income` or `Profit/Loss after tax`) might indicate **data issues** or **outliers** affecting the model.


  ### sensitivity
 1-fnr
 0.5238095
 ### specificity
 1-fpr
 0.7132867



## stepwise regressione
## Coefficients

| Variable                     | Estimate  | Std. Error | z value | Pr(>|z|)  | Significance |
|------------------------------|-----------|------------|---------|----------|--------------|
| (Intercept)                  | -3.3702   | 0.1879     | -17.940 | < 2e-16  | ***          |
| Long_term_debt               | 0.3258    | 0.1398     | 2.330   | 0.01982  | *            |
| Loans                        | 0.3024    | 0.1672     | 1.809   | 0.07052  | .            |
| Net_income                   | -24.8944  | 13.8851    | -1.793  | 0.07299  | .            |
| Profit_Loss_after_tax        | 23.8048   | 13.1067    | 1.816   | 0.06933  | .            |
| Current_liabilities          | 0.3533    | 0.1481     | 2.385   | 0.01707  | *            |
| Current_assets               | -0.3468   | 0.2183     | -1.589  | 0.11204  |              |
| Net_income_on_Total_Assets   | -1.4082   | 0.1759     | -8.006  | 1.19e-15 | ***          |
| Leverage                     | -0.6122   | 0.2212     | -2.768  | 0.00565  | **           |
| Tangible_on_total_assets     | -0.5393   | 0.1683     | -3.204  | 0.00135  | **           |

**Significance codes:**  
- `***` = 0.001  
- `**` = 0.01  
- `*` = 0.05  
- `.` = 0.1  

---

### Model Summary

- **Dispersion parameter**: 1 (binomial family)
- **Null deviance**: 715.20 (df = 1434)
- **Residual deviance**: 552.56 (df = 1425)
- **AIC**: 572.56
- **Number of Fisher Scoring iterations**: 6


## Chi-square Test of the Two Logistic Regressions

| Model       | Resid. Df | Resid. Dev | Df | Deviance | Pr(>Chi) |
|------------|----------|------------|----|----------|---------|
| **Model 1** | 1425     | 552.56     | -  | -        | -       |
| **Model 2** | 1420     | 551.92     | 5  | 0.634    | 0.9864  |

### Explanation:
- **Resid. Df**: Remaining degrees of freedom for each model. Model 2 has fewer degrees of freedom (1420 vs. 1425) because it includes more variables.
- **Resid. Dev**: Residual deviance for each model. Lower values indicate a better fit to the data.
- **Df**: Difference in degrees of freedom between the two models (5 in this case).
- **Deviance**: Difference between the residual deviance of the two models (0.634). A low value suggests that the more complex model does not significantly reduce the deviance compared to the simpler model.
- **Pr(>Chi)**: P-value from the Chi-square test. **0.9864** is very high, indicating no statistical evidence to prefer the more complex model.

### Conclusion:
Since the p-value **0.9864** is much higher than any standard significance threshold (e.g., 0.05 or 0.01), there is no evidence that the more complex model is significantly better than the simpler one.  
🔹 **In practice, adding extra variables in Model 2 does not provide a significant improvement, so the simpler model might be preferable to avoid overfitting.** 🚀




![f35140d9-96aa-4e19-951d-59af58ca07d5](https://github.com/user-attachments/assets/de9a27e7-71b3-4e82-92f0-b10c1f759b6c)




![a668b41e-bdd2-4fbd-89df-c76283eec93c](https://github.com/user-attachments/assets/6f16933a-1b69-45a8-9d4b-bedf028a8f9c)



![63bd3e64-550c-4810-83d5-6fd26b8050b8](https://github.com/user-attachments/assets/722e572e-8888-4c5d-a7d8-d6de4f78a2c5)




## Random Forest



| Actual \ Predicted | 0 (Negative) | 1 (Positive) | Class Error |
|--------------------|-------------|-------------|-------------|
| **0 (Negative)**  | 1324        | 13          | 0.97%       |
| **1 (Positive)**  | 42          | 56          | 42.86%      |

**🔹 Accuracy:** **96.14%** ✅  

Se vuoi aggiungere altre metriche (Precision, Recall, F1-score), fammelo sapere! 🚀

![c2119b21-d245-42e2-bf0c-0c3b2bb4aaa8](https://github.com/user-attachments/assets/2263a09d-cd0e-4eb2-86ba-c8acfa0e076f)

![d42ca0c9-2d21-4aac-ac68-d81a6226467b](https://github.com/user-attachments/assets/6c5755f1-7c95-4e08-a7b7-40a3febd5652)



## Neural Network


# Bayesian Learning

## Bayesian Logistic Regression  (MCMC)

The table below presents the 95% Highest Density Interval (HDI) for each parameter in the Bayesian logistic regression model using Markov Chain Monte Carlo (MCMC) sampling. The HDI provides the range of the most credible values for each parameter.

| Parameter                  | 95% HDI                |
|----------------------------|------------------------|
| (Intercept)                | [-3.27, -2.81]        |
| Total_assets               | [-2.00,  1.24]        |
| Shareholders_funds         | [-1.16,  0.44]        |
| Long_term_debt             | [ 0.12,  0.95]        |
| Loans                      | [-0.24,  0.39]        |
| Turnover                   | [-0.30,  0.33]        |
| EBITDA                     | [-0.08,  0.73]        |
| Net_income                 | [-3.67,  3.51]        |
| Tangible_fixed_assets      | [-0.56,  0.45]        |
| Profit_Loss_after_tax      | [-2.77,  3.95]        |
| Current_liabilities        | [-0.15,  1.69]        |
| Current_assets             | [-1.02,  0.10]        |
| Net_income_on_Total_Assets | [-1.33, -0.86]        |
| Leverage                   | [-1.14, -0.38]        |
| Tangible_on_total_assets   | [-0.59,  0.02]        |

### Interpretation
- Parameters with HDIs entirely above or below zero suggest a higher probability of having a meaningful effect. For example, **Long_term_debt** has a positive HDI [0.12, 0.95], indicating a likely positive association with the dependent variable.
- Conversely, **Net_income_on_Total_Assets** [-1.33, -0.86] and **Leverage** [-1.14, -0.38] both have negative intervals, suggesting they likely have a negative impact.
- Many variables, such as **Total_assets** and **Profit_Loss_after_tax**, have HDIs that include zero, indicating uncertainty about their effect direction.

These results should be interpreted in context with domain knowledge and additional model diagnostics to confirm their significance and robustness.




##now we train another logisitc regressione to make predictions.



### Model Information
| Parameter      | Value  |
|---------------|--------|
| Function      | stan_glm |
| Family        | Binomial (logit) |
| Observations  | 1435 |
| Predictors    | 15 |
| Algorithm     | Sampling |
| Posterior Sample Size | 4000 |

### Coefficients (Estimates)
| Predictor                     | Mean  | SD    | 10%   | 50%   | 90%   |
|--------------------------------|-------|------|------|------|------|
| (Intercept)                   | -3.248 | 0.155 | -3.452 | -3.243 | -3.048 |
| Total_assets                  |  0.000 | 0.976 | -1.265 | 0.004 | 1.274 |
| Shareholders_funds            | -0.381 | 0.507 | -1.019 | -0.388 | 0.270 |
| Long_term_debt                |  0.299 | 0.266 | -0.036 | 0.295 | 0.640 |
| Loans                         |  0.318 | 0.210 | 0.051  | 0.321 | 0.582 |
| Turnover                      | -0.247 | 0.316 | -0.660 | -0.242 | 0.153 |
| EBITDA                        |  0.417 | 0.330 | -0.004 | 0.417 | 0.834 |
| Net_income                    |  0.154 | 1.911 | -2.220 | 0.178 | 2.514 |
| Tangible_fixed_assets         |  0.046 | 0.355 | -0.413 | 0.062 | 0.481 |
| Profit_Loss_after_tax         |  0.277 | 1.782 | -1.889 | 0.250 | 2.496 |
| Current_liabilities           |  0.315 | 0.584 | -0.414 | 0.281 | 1.081 |
| Current_assets                | -0.298 | 0.394 | -0.817 | -0.284 | 0.192 |
| Net_income_on_Total_Assets   | -1.400 | 0.179 | -1.630 | -1.395 | -1.172 |
| Leverage                     | -0.649 | 0.242 | -0.959 | -0.641 | -0.349 |
| Tangible_on_total_assets     | -0.588 | 0.213 | -0.862 | -0.586 | -0.320 |

### Fit Diagnostics
| Statistic  | Mean | SD  | 10%  | 50%  | 90%  |
|------------|------|-----|------|------|------|
| mean_PPD   | 0.069 | 0.008 | 0.059 | 0.068 | 0.079 |

### MCMC Diagnostics
| Predictor                     | mcse  | Rhat  | n_eff |
|--------------------------------|------|------|------|
| (Intercept)                   | 0.003 | 0.999 | 3519 |
| Total_assets                  | 0.022 | 1.000 | 1935 |
| Shareholders_funds            | 0.011 | 1.001 | 2205 |
| Long_term_debt                | 0.006 | 1.002 | 1930 |
| Loans                         | 0.004 | 1.001 | 3440 |
| Turnover                      | 0.005 | 1.001 | 3643 |
| EBITDA                        | 0.007 | 1.000 | 2364 |
| Net_income                    | 0.039 | 1.001 | 2462 |
| Tangible_fixed_assets         | 0.008 | 1.003 | 1921 |
| Profit_Loss_after_tax         | 0.036 | 1.001 | 2483 |
| Current_liabilities           | 0.012 | 1.001 | 2205 |
| Current_assets                | 0.008 | 1.002 | 2223 |
| Net_income_on_Total_Assets   | 0.003 | 1.000 | 3629 |
| Leverage                     | 0.005 | 1.002 | 2867 |
| Tangible_on_total_assets     | 0.004 | 1.000 | 2988 |

### Interpretation
- The model shows a well-calibrated posterior distribution with Rhat values close to 1, indicating convergence.
- Key predictors with strong effects include **Net_income_on_Total_Assets**, **Leverage**, and **Tangible_on_total_assets**, all showing significant negative coefficients.
- Fit diagnostics indicate a good model performance with a mean posterior predictive distribution (mean_PPD) of **0.069**.


### 50% Credible Intervals for Coefficients
| Predictor                     | 25%   | 75%   |
|--------------------------------|------|------|
| (Intercept)                   | -3.354 | -3.141 |
| Total_assets                  | -0.659 | 0.644 |
| Shareholders_funds            | -0.732 | -0.045 |
| Long_term_debt                |  0.119 | 0.472 |
| Loans                         |  0.177 | 0.457 |
| Turnover                      | -0.453 | -0.034 |
| EBITDA                        |  0.197 | 0.640 |
| Net_income                    | -1.080 | 1.355 |
| Tangible_fixed_assets         | -0.180 | 0.289 |
| Profit_Loss_after_tax         | -0.854 | 1.415 |
| Current_liabilities           | -0.085 | 0.702 |
| Current_assets                | -0.558 | -0.022 |
| Net_income_on_Total_Assets   | -1.516 | -1.278 |
| Leverage                     | -0.810 | -0.481 |
| Tangible_on_total_assets     | -0.727 | -0.439 |

### Interpretation
- The 50% credible intervals provide a refined understanding of the parameter estimates, indicating the most likely range for each coefficient.
- **Net_income_on_Total_Assets**, **Leverage**, and **Tangible_on_total_assets** show strong negative effects with tight credible intervals, suggesting a significant influence on the target variable.
- Some predictors, such as **Loans** and **EBITDA**, have intervals that do not include zero, indicating a potential positive effect on the outcome.
- The inclusion of zero in the credible intervals of certain variables, like **Total_assets**, suggests uncertainty about their impact.

These insights can help improve model interpretability and guide feature selection for better predictive performance.






![e0eec403-cd7b-4aa1-8414-53c7c2b4fdb0](https://github.com/user-attachments/assets/73178355-801d-4361-9e13-34e62281129b)


![462d7719-18a8-411f-9f01-de9b74e5ff09](https://github.com/user-attachments/assets/8b759400-dadd-47ca-9c0c-dd99a169755e)



### 95% Highest Density Intervals (HDI) for Coefficients
| Predictor                     | 95% HDI (Lower) | 95% HDI (Upper) |
|--------------------------------|----------------|----------------|
| (Intercept)                   | -3.56 | -2.96 |
| Total_assets                  | -1.86 | 1.90 |
| Shareholders_funds            | -1.33 | 0.64 |
| Long_term_debt                | -0.22 | 0.81 |
| Loans                         | -0.09 | 0.75 |
| Turnover                      | -0.84 | 0.40 |
| EBITDA                        | -0.20 | 1.06 |
| Net_income                    | -3.54 | 3.96 |
| Tangible_fixed_assets         | -0.65 | 0.76 |
| Profit_Loss_after_tax         | -3.29 | 3.71 |
| Current_liabilities           | -0.81 | 1.44 |
| Current_assets                | -1.09 | 0.43 |
| Net_income_on_Total_Assets   | -1.75 | -1.04 |
| Leverage                     | -1.15 | -0.22 |
| Tangible_on_total_assets     | -1.02 | -0.17 |

### Interpretation
- The 95% HDI represents the most credible range for each parameter, providing a more comprehensive uncertainty assessment than the 50% intervals.
- **Net_income_on_Total_Assets**, **Leverage**, and **Tangible_on_total_assets** remain strongly negative, reinforcing their significant impact.
- Several predictors, such as **Loans** and **EBITDA**, have wide intervals that include zero, indicating uncertainty about their effect direction.
- The broader intervals in the 95% HDI highlight the model’s overall uncertainty and emphasize the importance of further validation.


The result of predictions:
| Predicted \ Actual | 0   | 1   |
|--------------------|-----|-----|
| 0                  | 567 | 37  |
| 1                  | 5   | 5   |


 "Accuracy: 93.16 %"




## Naive Bayes classifier

## A-Priori Probabilities
| Class (Y) | Probability |
|-----------|------------|
| 0         | 0.9317     |
| 1         | 0.0683     |

## A-Priori Class Counts
| Class (Y) | Count |
|-----------|-------|
| 0         | 1337  |
| 1         | 98    |

---

## Conditional Probabilities
| Feature                      | Mean (Y=0) | Std Dev (Y=0) | Mean (Y=1) | Std Dev (Y=1) |
|------------------------------|------------|---------------|------------|---------------|
| Total_assets                 | -0.0354    | 0.4804        | 0.2614     | 2.6784        |
| Shareholders_funds           | -0.0152    | 0.8629        | 0.0776     | 1.7475        |
| Long_term_debt               | 0.0081     | 0.8656        | -0.0324    | 1.6075        |
| Loans                        | -0.0335    | 0.5117        | 0.2473     | 2.6895        |
| Turnover                     | -0.0440    | 0.2373        | 0.1527     | 2.8761        |
| EBITDA                       | -0.0318    | 0.4906        | 0.0760     | 3.0077        |
| Net_income                   | 0.0089     | 0.8653        | -0.1795    | 1.8981        |
| Tangible_fixed_assets        | 0.0111     | 0.8989        | 0.0284     | 1.7278        |
| Profit_Loss_after_tax        | 0.0174     | 0.9191        | -0.1877    | 2.0061        |
| Current_liabilities          | -0.0458    | 0.3827        | 0.3657     | 3.0517        |
| Current_assets               | -0.0380    | 0.5742        | 0.2465     | 2.9385        |
| Net_income_on_Total_Assets   | 0.0931     | 0.8401        | -1.1182    | 1.9394        |
| Leverage                     | 0.0575     | 1.0458        | -0.3003    | 0.7654        |
| Tangible_on_total_assets     | 0.0391     | 1.0056        | -0.3054    | 0.9909        |

---

## Confusion Matrix & Performance Metrics

### Confusion Matrix
| Predicted | Actual 0 | Actual 1 |
|-----------|---------|---------|
| **0**     | 554     | 33      |
| **1**     | 18      | 9       |

### Performance Metrics
| Metric                  | Value  |
|-------------------------|--------|
| **Accuracy**            | 91.69% |
| 95% Confidence Interval | (89.22%, 93.75%) |
| No Information Rate     | 93.16% |
| P-Value (Acc > NIR)     | 0.9322 |
| **Kappa**               | 0.2191 |
| McNemar's Test P-Value  | 0.04995 |
| **Sensitivity**         | 96.85% |
| **Specificity**         | 21.43% |
| **Positive Predictive Value** | 94.38% |
| **Negative Predictive Value** | 33.33% |
| Prevalence              | 93.16% |
| Detection Rate          | 90.23% |
| Detection Prevalence    | 95.60% |
| **Balanced Accuracy**   | 59.14% |

---

## Interpretation
The Naïve Bayes classifier achieved an accuracy of **91.69%**, indicating strong overall performance. However, the model struggles with correctly predicting instances of class **1**, as reflected in the relatively low true positive count (9) and the number of false negatives (33). This suggests potential areas for improvement, such as:
- **Feature Engineering**: Refining the features to enhance class separability.
- **Resampling Techniques**: Addressing class imbalance through oversampling (SMOTE) or undersampling.
- **Model Tuning**: Experimenting with different probability estimation methods to improve minority class detection.

**Positive Class:** 0

Further adjustments could help improve classification performance, particularly for the minority class (Y=1).


## Conclusions







