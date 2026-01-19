################################################################################################################
############ Set Directory ###################################################################################
################################################################################################################

# Get PROJECT_HOME from env, else use here() or getwd()
if (Sys.getenv("PROJECT_HOME") != "") {
  proj_root <- Sys.getenv("PROJECT_HOME")
  msg <- "📦 Using PROJECT_HOME from environment variable"
} else if (requireNamespace("here", quietly = TRUE)) {
  proj_root <- here::here()
  msg <- "📦 Using here::here() to detect project root"
} else {
  proj_root <- getwd()
  msg <- "📦 Using current working directory (getwd()) as project root"
}

func_dir <- file.path(proj_root, "Functions")

# Confirm:
cat(msg, "\n")
cat("✅ Project root is:     ", proj_root, "\n")
cat("✅ Functions folder is: ", func_dir, "\n")

if (!dir.exists(func_dir)) {
  stop("❌ Functions folder does not exist: ", func_dir)
}

cat("📄 Contents of Functions folder:\n")
print(list.files(func_dir))

################################################################################################################
############ Configuation ###################################################################################
################################################################################################################

CONFIG <- list(
  
  # Set the seed for reproducibility
  USE_FIXED_SEED = FALSE,
  RNG_SEED = 12345,
  
  # Select a state dataset, Options: "MA" "NY" "OH" "SC" "NC"
  STATECALL = "MA",
  
  # Sampling sizes, Use to sample your enitre data set
  SAMPLEDATA = TRUE,
  INFESTED_SAMPLE = 1000, #1500
  UNINFESTED_SAMPLE = 10000, #30000
  
  #Set expected ALB generation time (years, whole numbers)
  GENERATION_TIME = 2,
  
  # Debugging / snapshot controls
  DEBUG_MODE = FALSE,
  # Snapshot controls; only used if DEBUG_MODE = TRUE, Options: any combination of red, green, purple, and removed
  DISPLAY_TREE_COLORS = c("red", "purple"), # Order of colors determines draw order
  ZOOM_MODE = "dynamic", # Options: "static", "dynamic"
  
  # Compute Dahl Lambda?
  DAHL_LAMBDA = FALSE,
  
  # Recalculate References
  RECALCULATE_SP_LOOKUP = TRUE,
  RECALCULATE_DBH_LOOKUP = TRUE,
  RECALCULATE_NEAREST_NEIGHBOR = TRUE,
  RECALCULATE_PROXIMITY_MATRIX = TRUE,
  
  # Use different state references?
  USE_DIFFERENT_STATE_SELECTION = FALSE,
  
  # If USE_DIFFERENT_STATE_SELECTION = TRUE, select state per analysis
  STATECALL_DBH_LOOKUP = "MA",
  STATECALL_SP_LOOKUP = "MA",
  STATECALL_NEAREST_NEIGHBOR = "MA",
  
  # Proximity matrix recalculation: expressed in KM
  RADIUS1 = 0.6096, #2000 ft expressed in KM
  RADIUS2 = 0.3048, #1000 ft expressed in KM
  
  # Use BeetlePreent or BeetlePresentFirstYears in Simulation
  USE_FIRST_YEAR_FLAG = TRUE,
  
  # Parallel execution
  RUN_PARALLEL = FALSE,
  LOOP_COUNT = 12,
  # Plotting if RUN_PARALLEL = TRUE; Options: All, Detection, Removal
  PLOT_METHOD = "Detection",
  
  # Detection settings
  DETECTION_COUNT = c(70), # Detection events per tick
  # Detection method: "climbing" = 70% detection, "ground" = 30% detection, "perfect" = 100% detection
  SURVEY_TYPE = "perfect",
  DETECTION_GROUP_MODE = "short", # Options: "short", "long", "sequence", "random"
  # Only used if DETECTION_GROUP_MODE = "sequence"
  DETECTION_SEQUENCE = c("short", "long", "short"),
  # Detection Count List if RUN_PARALLEL = TRUE
  DETECTION_COUNTS_LIST = c(rep(70,12)),#c(0,0,0,0,0,0,0,0,0,0,0,0),
  
  # Removal settings
  REMOVAL_COUNT = c(50),  #c(0),
  REMOVAL_PREFERENCE = "infestation density", # Options: "infestation density", "cost", "random"  
  # Removal Count List if RUN_PARALLEL = TRUE
  REMOVAL_COUNTS_LIST = c(rep(50,12)), #c(0,0,0,0,0,0,0,0,0,0,0,0),
  
  # Simulation length
  MAX_TICKS = 30
)

# Unpack Config
list2env(CONFIG, envir = .GlobalEnv)

################################################################################################################
############ Source Preparation ###################################################################################
################################################################################################################

source(file.path(func_dir, "Initialize.R"))
source(file.path(func_dir, "Preprocessing.R"))
source(file.path(func_dir, "LambdaCalculator.R"))

if (isTRUE(get0("DAHL_LAMBDA", ifnotfound = FALSE))) {
  source(file.path(func_dir, "DahlLambdaCalculator.R"))
}

source(file.path(func_dir, "SPLookUpCalculator.R"))
source(file.path(func_dir, "DBHLookUpCalculator.R"))
source(file.path(func_dir, "NearestNeighborCalculation.R"))
source(file.path(func_dir, "ProxMatrix.R"))

################################################################################################################
############ Source Simulation ###################################################################################
################################################################################################################

source(file.path(func_dir, "ALB_ABM.R"))


