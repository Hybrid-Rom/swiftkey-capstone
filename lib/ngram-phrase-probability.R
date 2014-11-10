#
# calculates the n-gram probability of a phrase.  the probability of a phrase is calculated
# as follows.
#
# p (we love you) = p (we) * p (love | we) * p (you | love)
#
# also keep in mind that p1*p2*p3 = exp (log (p1) + log (p2) + log (p3))
#
ngram_phrase_probability <- function (phrase, ngrams, n) {
  
  # find all the phrase n-grams
  tok <- function(x) RWeka::NGramTokenizer(x, RWeka::Weka_control(min = n, max = n))
  partial <- unlist (lapply (phrase, tok))
  
  # the probability of the first word in the phrase also needs to be taken into account
  partial <- append (partial, head (split_on_space (phrase), n = 1))
  
  # the phrase probability
  exp (sum (ngrams [phrase %in% partial, logp]))
}