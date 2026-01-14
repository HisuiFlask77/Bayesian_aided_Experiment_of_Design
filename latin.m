% INITIALISATION: Latin Hypercube Sampling (LHS)
% This script generates an initial set of experimental points distributed 
% across the defined search space using space-filling LHS.

clear all;

% Configuration: Define the scale of the experimental design
row = 20;       % Total number of initial experimental trials
column = 6;     % Number of independent variables (design dimensionality)

% Define the search space boundaries (Upper and Lower Bounds)
ub = [20 30 40 50 60 70];
lb = [10 20 30 40 50 -60];

% Generate initial samples within the unit hypercube [0, 1]
initial_data = lhsdesign(row, column);

% Denormalisation: Rescale the samples to the physical domain
for i = 1:column
    % Linearly scale each column from [0, 1] to [lb, ub]
    initial_data(:,i) = (ub(i) - lb(i)) * initial_data(:,i) + lb(i);
end

% Data Persistence: Export the design matrix to an Excel workbook
filename = 'initial_data.xlsx';
writematrix(initial_data, filename, 'Sheet', 1);

% Progress confirmation
fprintf('Initial design matrix successfully saved to: %s\n', filename);
