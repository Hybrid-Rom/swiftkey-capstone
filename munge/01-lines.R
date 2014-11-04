
# what percentage of the corpus should be kept for training?
keep <- 0.25

# what percentage to use for the training data
p <- 0.80

cache_if_missing ("lines", {
  
  # create a corpus from the text input
  files <- list.files ("data/en_US/", pattern = "\\.txt$", full.names = TRUE)
  lines <- unlist (lapply (files, readLines))
  
  # sample the original input
  index <- as.logical (rbinom (n = length (lines), size = 1, prob = keep))
  lines <- lines [index]
})

# create a training and test set
index <- as.logical (rbinom (n = length (lines), size = 1, prob = p))
train.lines <- lines [ index]
test.lines  <- lines [-index]
