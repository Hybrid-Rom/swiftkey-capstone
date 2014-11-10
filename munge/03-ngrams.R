#
# given the clean, pre-processed sentences, create a data set containing the ngrams
# extracted from these sentences.
#


cache_if_missing ("train.ngrams", {
  
  # extract all 1, 2, and 3-grams
  train.ngrams <- create_ngrams (train.sentences, 1, 3)
  
  # calculate the probability of each
  ngram_probabilities (train.ngrams, length (train.sentences))  
})


cache_if_missing ("test.ngrams",  {

  # for testing purposes, extract 4-grams only. the first 3 words provide the 
  # context, then the 4th word is predicted
  test.ngrams <- create_ngrams (test.sentences, 4, 4)
})
