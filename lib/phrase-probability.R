
#
# calculates the probability of a phrase using multiple n-gram models
#
phrase_probability <- function (phrase, ngrams) {
  
  # use a uni, bi, and tri-gram model to calculate the phrase probability
  n <- 1:3
  probs <- sapply (n, function (n) ngram_phrase_probability (phrase, ngrams, n))
  weighted.mean (probs, n)
}

