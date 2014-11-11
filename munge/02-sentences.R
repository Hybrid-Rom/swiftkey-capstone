#
# each line of text input can contain 1 or more sentences.  split each line into separate sentences
# and pre-process each sentence.
#

cache ("train.sentences", {
  
  # split the training data into sentences
  sentences <- split_sentences (train.lines)
  
  # clean the training data
  sentences <- clean_sentences (sentences)
})

cache ("test.sentences", { 
  
  # split the holdout test data into sentences
  split_sentences (test.lines)
})
