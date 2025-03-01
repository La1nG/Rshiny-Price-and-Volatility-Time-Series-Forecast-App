# Price Forecasting

Originally the concept behind the price forecasting model was to implement GARCH and ARIMA to capture volatility trends, however, after testing and creation I began to learn how only estimating the linearities in the data, can't be a driver to solely predict prices accurately despite being an effective measure of risk and uncertainity around them.

As I developed and researched more I identified ways to smooth overfitting such as BMA (Bayesian Modelling Averaging), and Weighting by RMSE and MAPE performance and L1/L2 Regularisation. Furthermore, I started to develop this further using more suited models to balance Linearities and Non-Linearities to capture both long-term and short-term Trends and smooth out Non-Linear patterns. The Arima-BSTS+LSTM Hybrid model is what I have identified to be a signficantly effective model at prediciting market direction and is the focus of the designed app.

Working On:
- Incorporating Exogenous Variables into ARIMA (ARIMAX) and BSTS
- Research an optimal training method for the price app and implement it
- Huber loss for the Loss plot
- XGBoost + Prophet Integration

Features:




# Techniques

### ARIMA

### BSTS

### LSTM

### Hybrid Ensemble

-----------------------------------------------

## Model Evaluation Techniques

### Loss Plot

### RMSE and MAPE

-----------------------------------------------

## Training and Finetuning the Model
