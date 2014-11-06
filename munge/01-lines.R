
# what percentage of the corpus should be kept for training?
keep <- 0.01

# what percentage to use for the training data
p <- 0.95

cache_if_missing ("lines", {
  
  # create a corpus from the text input
  files <- list.files ("data/en_US/", pattern = "\\.txt$", full.names = TRUE)
  lines <- unlist (lapply (files, readLines))
  
  # sample the original input
  message ("sampling ", percent (keep), " of original data")
  index <- as.logical (rbinom (n = length (lines), size = 1, prob = keep))
  lines <- lines [index]
})

# create and cache a training and test set
message ("allocating ", percent (p), " for training data")
index <- as.logical (rbinom (n = length (lines), size = 1, prob = p))
cache_if_missing ("train.lines", lines [ index])
cache_if_missing ("test.lines",  lines [-index])

# clean-up
rm (lines)
gc ()
