Bayesian Optimisation Toolkit

This package provides a framework for performing Bayesian optimisation on experimental data, featuring Latin Hypercube Sampling for initialisation and robust data persistence for manual experimental inputs.

File Overview

File

Description

latin

Utilises Latin Hypercube Sampling (LHS) to generate initial design points. Running this script creates initial_data.xlsx.

test

A diagnostic script that simulates a high-speed experimental environment. It visualises the process via a line graph and displays the final results.

test_function

A basic objective function used for internal testing and validation of the optimisation logic.

main

The core optimisation engine. It performs Bayesian optimisation (minimisation by default) based on the data in initial_data.xlsx. The process terminates once the MaxObj (maximum experiment limit) is reached.

objective

An interface for manual data entry. It allows users to input experimental results and save them to initial_data.xlsx. It ensures data integrity even in the event of premature termination.

Workflow

Initialisation: Execute latin to generate the initial set of design variable combinations in initial_data.xlsx.

Experimental Data: Perform the experiments as defined in the spreadsheet. Populated results can be entered manually via the objective script.

Optimisation: Run main to start the Bayesian optimisation loop. During each iteration, the program will output:

Current objective function value.

Expected objective value (via the acquisition function).

Historical best value (current global minimum).

Monitoring: Use the test script to verify the progress and performance of the optimisation through visual charts.

Implementation Details

Minimisation: The toolkit is configured to find the minimum value of the objective function by default.

Data Persistence: The objective script is designed to save data incrementally. If an experimental session is interrupted, previously entered data remains secured in the Excel file.

Termination Logic: The optimisation currently relies on a fixed budget defined by the MaxObj parameter.
