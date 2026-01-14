function obj = test_functions(params)
    % STANDARD BENCHMARK FUNCTION
    % This function serves as a reference for validation. 
    % Utilise the 'test' script to demonstrate execution and visualise results.

    % Display the input parameter structure to the console for tracking
    disp(params)

    % Extract design variables from the parameter structure
    x = params.para1;
    y = params.para2;
    z = params.para3;
    a = params.para4;
    b = params.para5;
    c = params.para6;

    % Compute the scalar objective function value
    % This specific implementation calculates the Sum of Squares:
    % obj = x^2 + y^2 + z^2 + a^2 + b^2 + c^2
    obj = x^2 + y^2 + z^2 + a^2 + b^2 + c^2;
end
