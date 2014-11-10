
#
# creates a data set containing the unique ngrams contained within a
# set of clean sentences.
#
create_ngrams <- function (sentences, ngram_min = 1, ngram_max = 3) {
  
  # sanity checks
  stopifnot (is.character (sentences))
  stopifnot (length (sentences) > 0)
  
  # split the sentences into n-grams
  tok <- function(x) RWeka::NGramTokenizer(x, RWeka::Weka_control(min = ngram_min, max = ngram_max))
  ngrams <- data.table (phrase = unlist (lapply (sentences, tok)))
  
  # remove duplicate ngrams and count the number of each
  ngrams <- ngrams [, list (phrase_count = .N), by = phrase]
  
  # mark each as a 1, 2, ... n gram
  ngrams [, n := sapply (strsplit (phrase, split = " "), length) ]
  
  # extract the context and the next word for each ngram
  ngrams [, `:=` (
    context = except_last_word (phrase),
    word    = last_word (phrase)
  ), by = phrase]
  
  return (ngrams)
}