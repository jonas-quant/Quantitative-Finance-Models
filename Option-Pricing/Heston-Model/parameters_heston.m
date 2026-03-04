%% Heston Model Parameters Initialization

% Model name (without .slx)
modelName = 'matlab_function_heston';

% Close old models and open the target model
bdclose('all');
open_system(modelName);

% Heston Model Parameters
S0 = 100;        % Initial asset price
v0 = 0.04;       % Initial variance
mu = 0.05;       % Drift / Expected return
kappa = 2;       % Mean reversion speed
theta = 0.04;    % Long-term variance
sigma = 0.3;     % Volatility of variance (vol of vol)
rho = -0.7;      % Correlation between Brownian motions

T = 1;           % Time horizon (1 year)
N = 252;         % Number of time steps (trading days)
dt = T / N;      % Time step size

% Generate correlated Brownian motions
rng(42); % Set seed for reproducibility
Z1 = randn(N,1);
Z2 = randn(N,1);
dW_v = sqrt(dt) * Z1;
dW_s = sqrt(dt) * (rho * Z1 + sqrt(1 - rho^2) * Z2);

% Create time vector
time_vector = (0:dt:T-dt)';

%% Format time series as matrices for Simulink
dW_s_mat = [time_vector, dW_s];  % 252x2
dW_v_mat = [time_vector, dW_v];  % 252x2

%% Ensure model synchronization and assign variables to base workspace
set_param(modelName, 'SimulationCommand', 'update'); 

assignin('base','S0',S0);
assignin('base','v0',v0);
assignin('base','mu',mu);
assignin('base','kappa',kappa);
assignin('base','theta',theta);
assignin('base','sigma',sigma);
assignin('base','dt',dt);
assignin('base','dW_s',dW_s_mat);
assignin('base','dW_v',dW_v_mat);

%% Run the simulation
out = sim(modelName, ...
    'StopTime', num2str(T), ...
    'Solver', 'FixedStepDiscrete', ...
    'FixedStep', sprintf('%.15f', dt));

%% Extract results
S_data = out.S.signals.values;
v_data = out.v.signals.values;
t = out.S.time;

%% Plot Results
figure;
subplot(2,1,1);
plot(t, S_data, 'LineWidth', 1.5);
xlabel('Time (years)');
ylabel('Asset Price (S)');
title('Evolution of Asset Price (S_t)');

subplot(2,1,2);
plot(t, v_data, 'LineWidth', 1.5);
xlabel('Time (years)');
ylabel('Variance (v)');
title('Evolution of Variance (v_t)');

%% Display basic results
fprintf('Final Asset Price (S): %.2f\n', S_data(end));
fprintf('Mean Variance (v): %.4f\n', mean(v_data));
fprintf('Final Variance (v): %.4f\n', v_data(end));