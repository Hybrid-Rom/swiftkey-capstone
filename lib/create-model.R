
#
# creates an n-gram model given a data set containing ngrams
#
create_model <- function (ngrams, cutoff = 1) {
  
  # extract the context and the next word from each ngram
  model <- ngrams [, list (
    context = except_last_word (phrase),
    word    = last_word (phrase)
  ), by = list (phrase, n, count) ]
  
  # for each context, keep only the most frequently occuring next word
  model <- model [, list (
    word  = word [which.max (count)], 
    count = max (count)
  ), by = context ]
  
  # exclude any ngrams that occur less than the cut-off frequncy
  model <- model [ count >= cutoff ]
  
  return (model)
}