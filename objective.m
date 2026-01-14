function obj = objective(params)
    % INTERFACE FOR MANUAL DATA ENTRY
    % This function facilitates the collection of experimental results for each
    % iteration of the Bayesian optimisation process.

    % Display the suggested design parameters for the current trial
    fprintf('\n--- Suggested Parameters for Current Iteration ---\n');
    disp(params);
    
    % Prompt the user to manually input the observed outcome of the experiment
    % Ensure the value entered corresponds to the objective function to be minimised.
    obj = input('Please enter the experimental result (Objective Value): ');

    % Consolidate the design variables and the resulting objective value into a single record
    new_record = [params.para1, params.para2, params.para3, ...
                  params.para4, params.para5, params.para6, obj];

    % --- DATA PERSISTENCE & LOGGING ---
    % Retrieve the existing dataset to append the latest observation
    filename = 'initial_data.xlsx';
    current_data = readtable(filename, 'Sheet', 1);
    
    % Convert the table to an array for concatenation
    historical_data = table2array(current_data);
    
    % Append the new record to the bottom of the historical dataset
    updated_dataset = [historical_data; new_record];

    % Write the updated matrix back to the Excel workbook to ensure data 
    % is retained even if the process is interrupted.
    writematrix(updated_dataset, filename, 'Sheet', 1);
    
    fprintf('Data successfully logged to %s.\n', filename);
end
