# Time Series Forecasting
Time series forecasting is a quantitative meathod of analysing data over periods of time with the purpose of predict future trends and patterns.  This R App aims to make an easily manageable tool that can assist in risk management and investment decisions while providing adaptable, realistic and informative insights and analysis for major financial assets such as Stocks, Currencies, and Bonds by accounting for volatility dynamics, asymmetry, and variance. 



## Features:
- Comprehensive Deep Learning Price Forecasting using ARIMA, BSTS and LSTM.
- Dynamic Conditional Correlation (DCC) Analysis with 2 Assets.
- Multivariate and Univariate Model Analysis with sGARCH, eGARCH, and gjrGARCH.
- Historical Risk Analysis with VaR and ES.
- Projected Risk Analysis with GARCH models.
- Annualized Sharpe, VaR, and Expected Shortfall (ES) Outputs at 95% confidence Interval.







## sGARCH, eGARCH, gjrGARCH

### sGARCH
The standard GARCH model extends the traditional ARCH model by allowing volatility to depend on both past squared shocks (ARCH term) and past volatility (GARCH term), this sGARCH model assumes symmetric reponses to positive and negative shocks.

### eGARCH
Unlike sGARCH, eGARCH extends to capture asymmetry using a logarithmic transformation, such as that large negative shocks increase volatility more than large than large positive shocks (large shocks have a exponential impact on volatility). 

### gjrGARCH
GJR-GARCH is similar to eGARCH in its nature that seeks to capture asymmetry (large shocks have a quadratic impact on volatility instead), however, instead of using logarithms to capture the effect, GJR-GARCH uses an indicator function rather than log variance.


## K-NN 
K-NN (k-nearest neighbors) is a regression and classification model that predicts a target value by averaging the values of its nearest neighbours (data-points of an applied input). K-NN is a non-parametric and instance-based learning algorithm that can learn when a test-point is provided, making it effective for continuous and non linear data predictions. In this app K-NN is used to forecast returns based on lagged returns and volatility (supported by GARCH) and how RMSE changes with different k values.

# Installation
Several libraries must be installed which can all be done with a single line in `R`:


```bash
install.packages(c("shiny", "shinythemes", "quantmod", "rugarch", "FNN", "plotly", "caret", "zoo", "rmgarch", "PerformanceAnalytics"))
```

# Set Up and Running the App

The only prerequisites needed to set-up and run the App are to install the above packages. Any important additional Notes for customisation or error decoding will be written alongside the function code in the app.  




Working on: 
- Debugging Stock Price Forecast - Finetuning hyperparameters and enhancing ARIMA, BSTS, LSTM to ensure best quality of forecasts
- Integrating Stock forecast into Main app
- DCC with 2+ Assests
  
