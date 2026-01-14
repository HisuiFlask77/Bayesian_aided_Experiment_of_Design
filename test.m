clear all;

% --- DESIGN SPACE DEFINITION ---
% Initialise the optimisable variables. Each parameter is defined within a 
% continuous search domain ranging from -10 to 10. These serve as the 
% input dimensions for the Bayesian optimisation framework.
vars = [
    optimizableVariable('para1',[-10, 10]), 
    optimizableVariable('para2',[-10, 10]),
    optimizableVariable('para3',[-10, 10]),
    optimizableVariable('para4',[-10, 10]),
    optimizableVariable('para5',[-10, 10]),
    optimizableVariable('para6',[-10, 10])
    ];


% --- ALGORITHM VALIDATION & VISUALISATION ---
% This section executes a diagnostic run to demonstrate the optimisation 
% process. By utilising the 'test_functions' benchmark, we can observe 
% how the algorithm explores the design space and converges on the global minimum.
%
% Configuration:
% - Acquisition Function: 'Expected Improvement' (balances exploration and exploitation).
% - Max Evaluations: 100 (defines the computational budget for this simulation).
results = bayesopt(@(params) test_functions(params), vars, ...
    'AcquisitionFunctionName', 'expected-improvement', ...
    'MaxObj', 100);

% Note: Upon completion, MATLAB will generate a series of diagnostic plots 
% illustrating the objective function value versus the number of iterations, 
% providing a visual representation of the optimisation trajectory.
