# Bayesian Optimisation Toolkit

A robust Python-based framework for experimental design and Bayesian optimisation, featuring Latin Hypercube Sampling (LHS) and automated data persistence.

[![Python Version](https://img.shields.io/badge/python-3.8+-blue.svg)](https://www.python.org/)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)

---

## 🛠 Project Structure

The package consists of five core components designed to facilitate a seamless transition from initial sampling to iterative optimisation.

### 1. `latin.py` (LHS Initialisation)
This module utilises **Latin Hypercube Sampling** to generate an optimal distribution of initial data points. 
* **Output:** Generates `initial_data.xlsx`.
* **Workflow:** Each row represents a specific combination of design variables. Users should perform the initial experiments and record the results directly into this spreadsheet before proceeding to the main optimisation loop.

### 2. `main.py` (Optimisation Engine)
The core driver of the toolkit. It performs Bayesian optimisation based on the data provided in `initial_data.xlsx`.
* **Objective:** By default, the engine seeks to **minimise** the objective function.
* **Termination:** The process is governed by the `MaxObj` parameter, which defines the maximum number of allowable experimental trials.
* **Monitoring:** During each iteration, the script outputs critical metrics, including the current objective value, the expected objective value, and the historical best result.

### 3. `objective.py` (Data Management & Persistence)
A dedicated interface for manual experimental data entry.
* **Resilience:** Designed to ensure data integrity; if an experiment is terminated prematurely, all previously entered data is retained.
* **Integration:** Automatically updates `initial_data.xlsx` with new experimental outcomes.

### 4. `test.py` (Visualisation & Validation)
A demonstration script to verify system performance and visualise trends.
* **Visuals:** Generates line graphs representing experimental progress and final results.
* **Simulation:** Assumes high-velocity execution to demonstrate how progress scales over time.

### 5. `test_function.py` (Benchmarking)
Contains a standard test function used to validate the optimisation logic before applying it to real-world experimental data.

---

## 🚀 Getting Started

1. **Initialise Sampling:**
   Run `python latin.py` to generate your design variable matrix in `initial_data.xlsx`.
   
2. **Conduct Experiments:**
   Perform the physical or simulated experiments listed in the spreadsheet and fill in the results.

3. **Execute Optimisation:**
   Run `python main.py` to begin the Bayesian iteration. The system will suggest new points to sample.

4. **Manual Entry:**
   Use `objective.py` to input results for the newly suggested points. The data will be saved automatically, ensuring no progress is lost.

---

## 📊 Key Features
* **Data Persistence:** Continuous saving to Excel prevents data loss during manual entry or system crashes.
* **Smart Sampling:** Uses LHS to ensure the design space is explored efficiently from the outset.
* **Iterative Insight:** Real-time feedback on expected vs. actual values to monitor convergence.
