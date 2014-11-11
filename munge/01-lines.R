
cache ("lines", {
  
  # create a corpus from the text input
  files <- list.files ("data/en_US/", pattern = "\\.txt$", full.names = TRUE)
  lines <- unlist (lapply (files, readLines, skipNul = TRUE))
  
  # sample the original input
  message ("sampling ", percent (input.p), " of original data")
  index <- as.logical (rbinom (n = length (lines), size = 1, prob = input.p))
  lines <- lines [index]
})

# create and cache a training and test set
message ("allocating ", percent (train.p), " for training data")
index <- as.logical (rbinom (n = length (lines), size = 1, prob = train.p))
cache ("train.lines", lines [ index])
cache ("test.lines",  lines [!index])
