#
# contains all initialization logic
#

# inits the parallelization library (only if installed)
if (require (doMC)) {
    registerDoMC ()
    print (sprintf ("doMC parallel backend loaded with '%s' worker(s)", getDoParWorkers ()))
}

# unzip the data files
zips <- list.files (path = "data", pattern = "\\.zip$", full.names = TRUE, recursive = TRUE)
for (zip in zips) unzip (zip, exdir = dirname (zip))
