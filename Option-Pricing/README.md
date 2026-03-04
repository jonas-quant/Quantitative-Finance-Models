# Option Pricing Models

This directory contains continuous-time financial models implemented in MATLAB/Simulink for pricing European options and simulating asset trajectories.

## 1. Heston Stochastic Volatility Model
The Heston model improves upon the Black-Scholes framework by assuming that volatility is not constant, but follows a random process. This implementation models the coupled Stochastic Differential Equations (SDEs) for the asset price $S_t$ and its variance $v_t$:

$$dS_t = \mu S_t dt + \sqrt{v_t} S_t dW_t^S$$
$$dv_t = \kappa(\theta - v_t)dt + \xi \sqrt{v_t} dW_t^v$$

* **Simulink Implementation:** The model captures the mean-reverting behavior of variance and simulates Monte Carlo paths for the underlying asset. 
* **Files:** `Heston-Model/heston_sim.slx` and `Heston-Model/init_heston.m`.

## 2. Black-Scholes-Merton Model
A block-diagram implementation of the classic Geometric Brownian Motion (GBM) and the analytical pricing formula for European options. The underlying asset dynamics are given by:

$$dS_t = \mu S_t dt + \sigma S_t dW_t$$

* **Simulink Implementation:** Visualizes the analytical solution and simulates the asset price trajectory under constant volatility.
* **Files:** `Black-Scholes/bs_sim.slx` and `Black-Scholes/init_bs.m`.

## Usage
To run the simulations, execute the respective `.m` initialization script in MATLAB to load the workspace parameters, then run the `.slx` Simulink model.
