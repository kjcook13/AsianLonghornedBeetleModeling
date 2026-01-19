#############################################################################################################
############ Set Project, Data & Output Directories ########################################################
#############################################################################################################

# 1. Define core directories
project_root <- proj_root
data_dir     <- file.path(project_root, "Data")
output_dir   <- file.path(project_root, "Outputs")
output_folder   <- file.path(project_root, "Outputs")


# 2. Validate existence (and create output if missing)
if (!dir.exists(data_dir)) {
  stop("❌ Data directory not found: ", data_dir)
}

if (!dir.exists(output_dir)) {
  dir.create(output_dir, recursive = TRUE)
  message("📂 Created output directory: ", output_dir)
}

# 3. Build full path to the dataset
dataset_path <- file.path(
  data_dir,
  paste0(STATECALL, "_FullRunDataset.csv")
)

# 4. (Optional) set working directory to project root
# setwd(project_root)

# 5. Report for sanity
message("🔷 Project root:       ", project_root)
message("🔷 Data directory:     ", data_dir)
message("🔷 Output directory:   ", output_dir)
message("🔷 Dataset path:       ", dataset_path, "\n")


#############################################################################################################
############ Apply RNG seed if configured ###################################################################
#############################################################################################################

if (isTRUE(USE_FIXED_SEED)) {
  set.seed(RNG_SEED)
  if (DEBUG_MODE) cat(sprintf("🔧 Fixed RNG seed set to %d\n", RNG_SEED))
} else {
  if (DEBUG_MODE) cat("🎲 RNG seed is not fixed; using default random state\n")
}

#############################################################################################################
############ Package Loader Helper ##########################################################################
#############################################################################################################

load_pkgs <- function(pkgs) {
  installed <- rownames(installed.packages())
  missing   <- setdiff(pkgs, installed)
  
  if (length(missing)) {
    install.packages(
      missing,
      dependencies = TRUE,
      repos = "https://cran.r-project.org"
    )
  }
  
  invisible(lapply(pkgs, library, character.only = TRUE))
}

REQUIRED_PKGS <- c(
  "readr", "dplyr", "ggplot2", "reshape2", "tidyverse",
  "doParallel", "foreach", "data.table", "openxlsx", "RColorBrewer",
  "tidyr", "MASS", "fitdistrplus", "spatstat", "spatstat.geom",
  "sp", "raster", "profvis", "janitor", "minpack.lm","NetLogoR"
)

load_pkgs(REQUIRED_PKGS)

start_time <- Sys.time()
