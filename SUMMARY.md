# GARCH Model Summary Interpretations

This file guides and explains how to interpret results shown in the GARCH Model Summary, using the Example Model AAPL file as a reference.


### optimal parameters / robust standard error
- mu, (μ), or mean return is the daily return of AAPL, a t-value of `0.64129` and a p-value of `0.52133` indicates that mu is statistically insignficant, indicating the `expected daily return` of AAPL is 0.0587%, consisten with financial returns that have a mean closer to zero. The insignficance of mu implies that the changes in AAPL's price are better explained by `volatility dynamics rather than a deterministic drift`
- omega, (𝜔), or variance intercept is the baseline variance, which is the component of the conditional variance that does not depend on past residuals or variances. A t-value of `0.1539` and a high p-value of `0.87786` indivate that omega is not statistically signficant. This suggests that the baseline volatility of the model is is negligible and almost all volatility is attributed to past squared residuals α1 and past conditional variances β1.
- ARCH Parameter, α1, measures the sensitivity of conditional variance to past squared residuals `(e.g., sensitivity of large returns today influencing tommorows volatility)`. With a near zero estimate, high standard error and p ≈ 1, the ARCH parameter is statistically insigficant. This means that sudden shocks or extreme market events do not signficantly influence AAPL's future volatility.
- GARCH Parameter, β1, meeasures the persistence of conditional variance. A high t value and p < 0.001 indicates strong statistically signficance. THis means that volatility is highlt persistent for AAPL, and that if Volatility is high today, its likely to be high tomorrow. the Estimate value being close to 1.0 suggests that the volatility process is nearly integrated and shocks will decay slowly.

Diference between `Optimal Parameters` and `robust standard error`: the robust standard errpr summary accounts for potential misspecification or model assumptions.

### Log-Liklihood
Log-Liklihood measures the overall fit of the model (GARCH) to the data, higher values indicate a better fit. The Log-Liklihood value of 701.7981 indicates that the GARCH(1,1) model effectively explains AAPL's return and volatility patterns

### Information Criteria
Information Criteria are statistical tools that are used to evaluate model performance and balance between goodness-of-fit and model complexity. Each criterion (Akaike, Bayes, SHibata, Hannan-Quinn) penalises overfitting differently.

- Akaike Information Critieria (AIC)
AIC is calculated as: `AIC=2k−2ln(L)`, where k = the number of parameters, and ln(L) = the log-likelihood of the model. Lower AIC values indicate more efficient models, as goodness-of-fit is balanced (through log-likelihood), with penalty to model complexity (number of parameters). A value of `-5.6048` siggests the model provides a good fit while avoiding overfitting,

- Bayesian Information Criteria (BIC)
BIC is calculated as, `BIC=ln(n)k−2ln(L)`, BIC operates similarly to AIC except for the BIC penalises model complexity (number of parameters, k) more severely, especially as n increases. A slightly higher value of `-5.5483` is expected due to the stricter penalisation. Further confirming that the dataset is not overfitted.
BIC is particularly useful in contexts where long-term forecasting is required from models.

- Shibata Criterion
The Shibata Criterion is a variation of AIC specifically designed for stationary process such as GARCH models. Shibata penalises complexity less than AIC, expectedly leading to lower values. In this Summary the shibata value of `-5.6053` is close to the AIC when shows that the GARCH(1,1) model is appropriate for AAPL''s volatility.

- Hannan-Quinn Criterion (HQC)
HQC is calculated as, `HQC=2kln(ln(n))−2ln(L)`, HQC imposes a penalty stricter than AIC, but less sensitive to parameter size than BIC. A value of `-5.5821` suggests a strong fit model and appropriate complexity.
HQC is used for moderate-length time series where neither extreme overfitting (penalised by AIC) nor excessive simplicity (encouraged by BIC) is desired.





​
 
