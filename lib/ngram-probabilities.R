
#
# calculate the probability of occurence for each ngram
# the maximum liklihood estimate for the probability of each
# ngram is:
#
#   p (we love you) = count (we love you) / count (we love)
#   p (we love)     = count (we love) / count (we)
#   p (we)          = count (we) / count (<sentence-start>)
#
# in terms of the 'ngrams' data set this is the same as the phrase count divided
# by the context count where:
# 
#  phrase = we love you
#  context = love you
#
ngram_probabilities <- function (ngrams, number_of_sentences) {

  # create a data set that contains the number of times each context occurs in the text
  context <- ngrams [, sum (phrase_count), by = phrase]
  setnames (context, c("context", "context_count"))
    
  # through merging, add the context count to the model
  setkeyv (context, "context")
  setkeyv (ngrams, "context")
  ngrams [context, context_count := context_count, allow.cartesian=TRUE]
  
  # a hack to account for p (we|<start of sentence>)
  ngrams [context == "", context_count := number_of_sentences]
  
  # calculate the maximum liklihood estimate for the probability
  # storing the log (p) makes calculating phrase probability simpler later
  ngrams [, p := phrase_count / context_count ]
  ngrams [, logp := log (p) ]
  
  # probabilities calculated in-place
  return (NULL)
}