# Price Forecasting

Originally the concept behind the price forecasting model was to implement GARCH and ARIMA to capture volatility trends, however, after testing and creation I began to learn how only estimating the linearities in the data, can't be a driver to solely predict prices accurately despite being an effective measure of risk and uncertainity around them.

As I developed and researched more I identified ways to smooth overfitting such as BMA (Bayesian Modelling Averaging), and Weighting by RMSE and MAPE performance and L1/L2 Regularisation. Furthermore, I started to develop this further using more suited models to balance Linearities and Non-Linearities to capture both long-term and short-term Trends and smooth out Non-Linear patterns. The Arima-BSTS+LSTM Hybrid model is what I have identified to be a signficantly effective model at prediciting market direction and is the focus of the designed app.

Working On:

- potential silent model failure in forecast functions

Features:

# Techniques

### ARIMA/X
ARIMA is classical Time-Series model than explains a value inside of a series as a linear combination of past values and past errors after differencing.  Arima is often extended to a more robust "ARIMAX" model, incorporating exogenous variables (Inflation, Volume, and Volatility in this case), the app will log various ARIMA configurtions in order to identify a model with the least numerical instability to combat overparameterisation and weak exogenous signals.

### BSTS
BSTS models use Bayesian methods, such as MCMC sampling to capture the structural components of the series, such as local trends and potential shifts that ARIMA by itself may not capture. This addition to the framework offers a probabilistic forecast that accounts for and quantifies uncertainty.

### LSTM
LSTM is a form of Recurrent Neural Network (RNN) that is efficient at learning long-term dependencies in sequential data. Enabling it to capture non-linear relationships that models such as ARIMA and BSTS may miss or poorly represent.  The app aims to construct training sequences from the normalised data and trains the network over a series of epochs. The loss (Mean-Squared Error) is logged periodically to monitor the state of convergence.

### Prophet - May get removed or utilised differently after backtesting
Prophet is a forecasting tool developed by facebook, it models Time-Series Data as an additive model with components for trends, seasonality (daily, weekly, yearly), and holidays. Prophet can take Historical asset prices without the need of additional regressors and create a forecast that is robust to outliers and irregularities.

### XGBoost 
XGBoost is an implementation of 'gradient-boosting decision trees', where XGBoost is able to produce decision trees sequentially and allow for each new tree to correct the error of previous trees. Its used to capture complex, Non-Linear relationships between the lagged values of the series and the exogenous variables, allowing it to learn patterns not detected by other models such as LSTM.

### Hybrid Ensemble with Ridge Regression - Ensemble composition may change
The hybrid model approach combines the predictions from ARIMA, BSTS, LSTM, Prophet, and XGBoost. Each forecasting model provides its forecast and the ridge regression assigns weights based on their performance during Cross-Validation to avoid overfitting by penalising large coefficients so that the model is less likely to get dominated by the problems of a single model.

Contributions:
- ARIMA contributes its linear forecast, capturing the overall trend and short-term dependencies.
- BSTS adds probabilistic forecasts and captures structural shifts.
- LSTM brings in non-linear dynamics and long-term dependencies.
- Prophet provides robustness to seasonality and outlier handling.
- XGBoost captures complex interactions and non-linear features.


-----------------------------------------------

## Model Evaluation Techniques

### Huber Loss Plot - To Be Implemented



### Error Metrics

### RMSE

## MAPE
