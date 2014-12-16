
lines <- ecache (key = "lines", {
  
  # create a corpus from the text input
  files <- list.files (data_path, pattern = "\\.txt$", full.names = TRUE)
  text <- unlist (lapply (files, readLines, skipNul = TRUE))
  
  # sample the original input
  message ("sampling ", percent (input.p), " of the original text")
  index <- as.logical (rbinom (n = length (text), size = 1, prob = input.p))
  text <- text [index]
  
  # split the text into test and training sets
  message ("allocating ", percent (train.p), " for training data")
  index <- as.logical (rbinom (n = length (text), size = 1, prob = train.p))
  list (train = text [ index],
        test  = text [-index])
})
