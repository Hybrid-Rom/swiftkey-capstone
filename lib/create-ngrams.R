
#
# creates a data set containing the unique ngrams contained within a
# set of clean sentences.
#
create_ngrams <- function (sentences, ngram_min = 1, ngram_max = 3) {
  
  # split the sentences into n-grams
  tok <- function(x) RWeka::NGramTokenizer(x, RWeka::Weka_control(min = ngram_min, max = ngram_max))
  ngrams <- data.table (phrase = unlist (lapply (sentences, tok)))
  
  # remove duplicate ngrams and count the number of each
  ngrams <- ngrams [, list (count = .N), by = phrase]
  
  # mark each as a 1, 2, ... n gram
  ngrams [, n := sapply (strsplit (phrase, split = " "), length) ]
  
  return (ngrams)
}