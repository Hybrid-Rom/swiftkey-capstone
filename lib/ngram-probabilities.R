
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
ngram_probabilities <- function (ngrams) {

  # create a data set that contains the number of times each context occurs in the text
  context <- ngrams [, sum (phrase_count), by = context]
  setnames (context, c("context", "context_count"))
    
  # through merging, add the context count to the model
  setkeyv (context, "context")
  setkeyv (ngrams, "context")
  ngrams [context, context_count := context_count, allow.cartesian=TRUE]
  
  # calculate the maximum liklihood estimate 
  ngrams [, p    := phrase_count / context_count ]
  
  # storing log (p) makes calculating phrase probability easier
  ngrams [, logp := log (p) ]
  
  # probabilities calculated in-place
  return (NULL)
}