# Asian LongHorned Beetle Infestation Modeling
Asian Longhorned Beetle (ALB) infestation modeling via Agent Based Models

Link to Arxiv Paper:

.......add summary of this work here.......


# Shiny Application Tool
Link to Shiny App:

This novel application was developed for field scientists visualize ALB infestation data and model the infestation data over years. The user may upload their field data and run the various codes to study the spatial relationships of the data, simulate the infestation data provided, and simulate scenarios of the infestations over years. 

## Step-By-Step Application Instructions
........ insert instructions here.........


Example output figures can be found in the "Output Examples" folder of the repository.

# Using the R Codes without the App
The R codes for each function file in the paper can be found in the "R Codes" folder of this repository. Below you will find the instructions for running the individual R codes without using the application. The codes are listed and explained in order of use.

1. "ABMProcedure.R"
    - The code houses all of the source codes. It begins by locating your local folder directory where the code is stored. This also ensures that the outputs are saved to the same folder at later steps. By running this code, the user is running all of the function files sequentially and then running the simulation as the last line of the code.
    - This code also contains the configuration settings. The settings include.........FINISH THIS WHEN WE KNOW WHAT IS INCLUDED IN THE FIRST VERSION
       - the short and long radii values (default: Short = 0.3048 km (1000ft), Long =  0.6096 km (2000ft)
       - visualization modes: Dynamic, Static
       - Simulation length in years
       - Detection percent per time step
       - Removal percent per time step
       - Beetle Generation Time 
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
13. "ALB_ABM.R"


