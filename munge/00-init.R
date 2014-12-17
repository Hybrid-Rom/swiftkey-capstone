
#
# global configuration
#

# what percentage of the input data should be kept for training?
input.p <- 0.75

# what percentage to use for the training data
train.p <- 0.95

# where is the data stored?
data_path <- "data/en_US/"

options (verbose = FALSE)
options (cache_dir = "cache")

#
# initialization logic
#

# unzip the data files, only if necessary
txts <- list.files (path = "data", pattern = "\\.txt$", recursive = TRUE)
if (length (txts) == 0) {
    
    zips <- list.files (path = "data", pattern = "\\.zip$", full.names = TRUE, recursive = TRUE)
    for (zip in zips) unzip (zip, exdir = dirname (zip))    
}

