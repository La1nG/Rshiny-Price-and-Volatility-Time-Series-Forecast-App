# GARCH Model Summary Interpretations

This file guides and explains how to interpret results shown in the GARCH Model Summary, using the Example Model AAPL file as a reference.


### optimal parameters / robust standard error
- mu, (μ), or mean return is the daily return of AAPL, a t-value of `0.64129` and a p-value of `0.52133` indicates that mu is statistically insignficant, indicating the `expected daily return` of AAPL is 0.0587%, consisten with financial returns that have a mean closer to zero. The insignficance of mu implies that the changes in AAPL's price are better explained by `volatility dynamics rather than a deterministic drift`
- omega, (𝜔), or variance intercept is the baseline variance, which is the component of the conditional variance that does not depend on past residuals or variances. A t-value of `0.1539` and a high p-value of `0.87786` indivate that omega is not statistically signficant. This suggests that the baseline volatility of the model is is negligible and almost all volatility is attributed to past squared residuals α1 and past conditional variances β1.
- ARCH Parameter, α1, measures the sensitivity of conditional variance to past squared residuals `(e.g., sensitivity of large returns today influencing tommorows volatility)`. With a near zero estimate, high standard error and p ≈ 1, the ARCH parameter is statistically insigficant. This means that sudden shocks or extreme market events do not signficantly influence AAPL's future volatility.
- GARCH Parameter, β1, meeasures the persistence of conditional variance. A high t value and p < 0.001 indicates strong statistically signficance. THis means that volatility is highlt persistent for AAPL, and that if Volatility is high today, its likely to be high tomorrow. the Estimate value being close to 1.0 suggests that the volatility process is nearly integrated and shocks will decay slowly.

Diference between `Optimal Parameters` and `robust standard error`: the robust standard errpr summary accounts for potential misspecification or model assumptions.

### Log-Liklihood

​
 
