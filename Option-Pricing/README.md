# Option Pricing & Volatility Modeling

This directory contains implementations of fundamental and advanced option pricing models. The focus is on European derivative valuation and the simulation of underlying asset trajectories under different market assumptions.

By utilizing MATLAB and Simulink, these projects apply a systems-engineering approach to financial mathematics. Complex analytical formulas and differential equations are broken down into modular subsystems, allowing for clear visualization of the data flow and feedback loops.

## Implemented Models

### 1. [Black-Scholes Model](./Black-Scholes/)
* **Market Assumption:** Constant volatility and log-normal asset returns.
* **Implementation:** Block-diagram architecture of the analytical closed-form solution.
* **Key Features:** Real-time calculation of Call and Put premiums, utilizing encapsulated subsystems for intermediate variables ($d_1$ and $d_2$).

### 2. [Heston Stochastic Volatility Model](./Heston-Model/)
* **Market Assumption:** Volatility is a random, mean-reverting process (addressing the empirical volatility smile).
* **Implementation:** Discrete-time simulation of coupled Stochastic Differential Equations (SDEs) utilizing Euler-Maruyama discretization.
* **Key Features:** Monte Carlo path generation, correlation parameters between asset price and variance ($\rho$), and state-variable feedback loops using unit delays.
