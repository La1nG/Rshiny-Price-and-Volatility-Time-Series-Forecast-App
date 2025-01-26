# Time Series Forecasting
Time series forecasting is a quantitative meathod of analysing data over periods of time with the purpose of predict future trends and patterns.  This R App aims to make an easily manageable tool while providing useful and informative analysis utilising a hybrid approach combining the GARCH (generalized autoregressive conditional heteroskedasticity) and K-NN (k-nearest neighbors) time-series methods.

## Features:
- Stock Price Forecasting
- Volatility Dynamics Analysis and Forecasting
- Annualized Sharpe, Annualized VaR
- Black Scholes Model and European Option Pricing, this can be changed by adjusting the pricing formula.



## GARCH
GARCH is a statistical regression model used in the application of the analysis and prediction of the volatility of financial systems, such as Bonds, Stocks, and other assets. GARCH incorporates historical variances and error terms to identify patterns in long term volatility. This app uses a HARCH (1,1) model specifying that the model will include the lag of one conditional variable (time varying volatility of the returns) and one lag of the squared error (signficance of deviation in returns which contribute to volatility).


## K-NN 
K-NN is a regression and classification model that predicts a target value by averaging the values of its nearest neighbours (data-points of an applied input). K-NN is a non-parametric and instance-based learning algorithm that can learn when a test-point is provided (through quantmod api), making it effective for continuous and non linear data predictions. In this app K-NN is used to forecast returns based on lagged returns and volatility (supported by GARCH) and how RMSE changes with different k values.


# Installation
Several libraries must be installed which can all be done with a single line in `R`:

```bash
install.packages(c("shiny", "quantmod", "rugarch", "FNN", "plotly", "caret", "zoo"))
```

# Set Up and Running the App

After the libraries are installed into an R IDE such as RStudio you should then set up a Rshiny web app file/folder then you can copy/paste the server logic into the server console and UI into UI console then run app. Variables are adjustable in-app through sliders.




Working on: 
- sliders
- volatility overlay, rolling volatility graphs
- Black Scholes Options Pricing
