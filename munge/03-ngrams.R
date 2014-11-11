#
# given the clean, pre-processed sentences, create a data set containing the ngrams
# extracted from these sentences.
#


cache ("train.ngrams", {
  
  # create the unigrams
  unigrams <- create_ngrams (train.sentences, 1)
  ngram_probabilities (unigrams, length (train.sentences))  
  
  # create the bigrams
  bigrams <- create_ngrams (train.sentences, 2)
  ngram_probabilities (bigrams, length (train.sentences)) 
})


cache ("test.ngrams",  {

  # for testing purposes, extract 4-grams only. the first 3 words provide the 
  # context, then the 4th word is predicted
  test.ngrams <- create_ngrams (test.sentences, 4, 4)
})
