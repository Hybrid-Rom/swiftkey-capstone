#
# contains all initialization logic
#

# unzip the data files, only if necessary
txts <- list.files (path = "data", pattern = "\\.txt$", recursive = TRUE)
if (length (txts) == 0) {
    
    zips <- list.files (path = "data", pattern = "\\.zip$", full.names = TRUE, recursive = TRUE)
    for (zip in zips) unzip (zip, exdir = dirname (zip))    
}

