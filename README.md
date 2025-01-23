# Time Series Forecasting
Time series forecasting is a quantitative meathod of analysing data over periods of time with the purpose of predict future trends and patterns.  This R App aims to make an easily manageable tool while providing useful and informative analysis utilising a hybrid approach combining the GARCH (generalized autoregressive conditional heteroskedasticity) and K-NN (k-nearest neighbors) time-series methods.

## GARCH
GARCH is a statistical regression model used in the application of the analysis and prediction of the volatility of financial systems, such as Bonds, Stocks, and other assets. GARCH incorporates historical variances and error terms to identify patterns in long term volatility. This app uses a HARCH (1,1) model specifying that the model will include the lag of one conditional variable (time varying volatility of the returns) and one lag of the squared error (signficance of deviation in returns which contribute to volatility).

### Features

-


## K-NN 
K-NN is a regression and classification model that predicts a target value by averaging the values of its nearest neighbours (data-points of an applied input). K-NN is a non-parametric and instance-based learning algorithm that can learn when a test-point is provided (through quantmod api), making it effective for continuous and non linear data predictions. In this app K-NN is used to forecast returns based on lagged returns and volatility (supported by GARCH) and how RMSE changes with different k values.

### Features

-



# Installation


# Set Up and Running the Script
