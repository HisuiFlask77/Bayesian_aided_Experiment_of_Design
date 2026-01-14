clear all;

% --- VARIABLE CONFIGURATION & DOMAIN DEFINITION ---
% Define the design space by specifying optimisable variables and their 
% respective search boundaries (lower and upper bounds).
vars = [
    optimizableVariable('para1',[-10, 10]), 
    optimizableVariable('para2',[-10, 10]),
    optimizableVariable('para3',[-10, 10]),
    optimizableVariable('para4',[-10, 10]),
    optimizableVariable('para5',[-10, 10]),
    optimizableVariable('para6',[-10, 10])
    ];


% --- DATA ACQUISITION ---
% Import the populated experimental data from the Excel workbook.
% Ensure that all manual entries in 'initial_data.xlsx' are complete before execution.
initial_data = readtable('initial_data.xlsx', 'Sheet', 1);

% Extract the design variables (Features) and the observed outcomes (Objective values)
initialX = initial_data(:, 1:6);
initialObjective = table2array(initial_data(:, 7));


% --- BAYESIAN OPTIMISATION ENGINE ---
% Execute the optimisation process using the Expected Improvement (EI) acquisition function.
% Note: The 'MaxObj' parameter represents the cumulative evaluation budget, 
% inclusive of the initial data points provided.
results = bayesopt(@(params) objective(params), vars, ...
    'InitialX', initialX, ...
    'InitialObjective', initialObjective, ...
    'AcquisitionFunctionName', 'expected-improvement', ...
    'MaxObj', 23);

% --- BENCHMARKING (VALIDATION MODE) ---
% Uncomment the section below to perform a high-iteration test 
% using a synthetic benchmark function instead of manual input.
%
% results = bayesopt(@(params) test_functions(params), vars, ...
%     'AcquisitionFunctionName', 'expected-improvement', ...
%     'MaxObj', 100);
