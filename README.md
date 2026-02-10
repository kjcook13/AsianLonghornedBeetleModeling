# Asian Longhorned Beetle Infestation Modeling
Asian Longhorned Beetle (ALB) infestation modeling via Agent Based Models

Link to Arxiv Paper:

Paper Abstract: 
The Asian longhorned beetle (Anoplophora glabripennis; ALB) is an invasive tree pest in urban and peri-urban forests in both North America and Europe. This pest requires active management, as ALB damage typically leads to tree mortality and potentially dangerous situations resulting from limb breakage and falling host trees. Effective management programs require an understanding of how invasive species spread and how their spread is altered by management practices. To that end, we developed a spatially explicit agent-based model in which we simulate the spread of ALB through probabilistic functions, and simulate management scenarios. The probability of ALB spread was calculated as a function of the host trees’ diameter at breast height, source pressure from neighboring infestations, and the distance from a potential host to the nearest infested host. Management strategies were configured based on stakeholder input and calibrated parameters via history matching. Simulated outputs of the number of detected infestations per year, and the number of removed trees per year, were compared to the observed data. Model accuracy varied among the four states used in this study, with observed annual counts falling within the 10–90% posterior predictive interval for most years in Massachusetts and New York, but a lower percent coverage in Ohio. The model showed promise as a useful tool for predicting invasive species’ populations and as part of a comprehensive ALB management strategy.

# Shiny Application Tool
Link to Shiny App:

This novel application was developed for field scientists visualize ALB infestation data and model the infestation data over years. The user may upload their field data and run the various codes to study the spatial relationships of the data, simulate the infestation data provided, and simulate scenarios of the infestations over years. 

## Step-By-Step Application Instructions
1.	Proceed to the tab, “Import Data and Set Parameters”.
    1.	Set the upper and lower radii. This will be used in the forthcoming calculators. 
    2.	Upload CSV dataset. Preview data to ensure correctness. Download the updated CSV.
    3.	Run “Spatial Analysis Calculator” by uploading the updated CSV from the previous step. Save the file after complete. If you have already used this calculator and saved the file, upload the spatial results.
    4.	Run “SP Score Calculator” by uploading the updated CSV and the spatial results file. Save the file after complete. If you have already used this calculator and saved the file, upload the SP score results.
    5.	Run “DBH Calculator” by uploading the updated CSV. Save the file after complete. If you have already used this calculator and saved the file, upload the DBH results.
    6.	Run “Nearest Neighbor Calculator” by uploading the updated CSV. Save the file after complete. If you have already used this calculator and saved the file, upload the Nearest Neighbor results.
2.	Proceed to the next tab, “Run Simulation”
    1.	Set the length of your simulation in years. 
    2.	Set the yearly output plots, as Static (x and y axis are set to one length for all plots over each year) or Dynamic (x and y axis lengths change by zooming in and out at each year).
    3.	Set Beetle generation time (1-3 years).
    4.	Set Survey Events per Year. 
    5.	Set Detection Rate per survey.
    6.	Set Survey Radius  (kilometers)
    7.	Set Removal Preference to 1) infestation density, 2) cost, or 3) random
    8.	Set removal events per year
3.	Proceed by clicking on “Generate Proximity Matrix”. This step may take hours depending on how much data you have.
4.	Proceed by clicking on “Run Simulation”.
5.	Proceed to the next tab, “Visualize Simulation Results”.
    1.	Select “Generate Visualization Plots”. The output plots from the simulation will appear in this window. The user may also download the figures.



Example output figures can be found in the "Output Examples" folder of the repository.

# Using the R Codes without the App
The R codes for each function file in the paper can be found in the "R Codes" folder of this repository. Below you will find the instructions for running the individual R codes without using the application. The codes are listed and explained in order of use.

1. "ABMProcedure.R"
    - The code houses all of the source codes. It begins by locating your local folder directory where the code is stored. This also ensures that the outputs are saved to the same folder at later steps. By running this code, the user is running all of the function files sequentially and then running the simulation as the last line of the code.
    - This code also contains the configuration settings. The settings include:
       - The short and long radii values (default: Short = 0.3048 km (1000ft), Long =  0.6096 km (2000ft)
       - Visualization modes: Static, Dynamic, 
       - Simulation length in years
       - Survey Events per Year
       - Detection rate per survey
       - Removal count per year
       - Survey radius in kilometers
       - Beetle Generation Time (1-3 years)
       - Set Removal Preference: Infestation Density, Cost, or Random
       - Removal events per year
2. "Initialize.R"
    - This function file initializes the agent based model by making sure that all of the necessary packages are installed on the user's R library and sets the storage paths.
3. "Preprocessing.R"
    - This code reads the users data CSV in the directory, and reformats the file with the correct columns names. It also removes any rows with errors or empty values. The output is an updated CSV file.
4. "LambdaCalculator.R"
    - This code computes the spatial analysis of the data points in the user's CSV file. The output is an .rds file containing the spatial analysis.
6. "SPScoreCalculator.R"
    - This code computes the SP score (source pressure score) of the data points in the user's CSV file, using the lambda spatial analysis. The output is an .rds file containing the SP scores.
8. "DBHCalculator.R"
    - This code computes the DBH analysis (diameter at breast height) of the data points in the user's CSV file. The output is an .rds file containing the DBH analysis.
10. "NearestNeighborCalculator.R"
    - This code computes the nearest neighbor analysis of the data points in the user's CSV file. The output is an .rds file containing the nearest neighbor analysis.
12. "ProxMatrix.R"
    - This code computes the proximity matrix for the short and long radii, as well as the detection radii defined in the "ABMProcedure.R" code. This code must be run in conjunction with the following "ALB_ABM.R" because the long proximity matrix is usually too large of a file to download. The short proximity matrix is saved to an .rds file. The long proximity matrix and the detection proximity matrix is stored in the user's cache. All outputs are used in the "ALB_ABM.R" code. 
14. "ALB_ABM.R"
    - This code runs the agent based model simulation using all of the files computed in the previous code calculators. The output consists of plots for the agent populations over time and visualizations of the data points over time.


