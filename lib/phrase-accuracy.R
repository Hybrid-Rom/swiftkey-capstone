
#
# measures the predictive accuracy of a phrase word by word. for example
# the phrase "which is the best" would have accuracy measured for each 
# of the sub-phrases; "which is", "which is the", and "which is the best".
#
phrase_accuracy <- function (phrase, ngrams) {
  
  # clean the input
  phrase <- clean_sentences (phrase, end_tag = "")
  
  # generate a list of sub-phrases to predict
  split <- unlist (stri_split (phrase, regex = "[ ]+"))
  phrases <- sapply (2:length (split), function (end) split [1:end])
  phrases <- sapply (phrases, function (p) paste (p, collapse = " "))
  
  # extract the context and actual next word
  phrases <- data.table (phrase = phrases)
  phrases [, `:=` (
    context = except_last_word (phrase),
    word    = last_word (phrase)
  ), by = phrase]
  
  # is the actual next word in the top 5 suggestions?
  phrases [, accurate := word %in% predict_next_word (context, ngrams)$word, by = phrase]
  phrases [, length := .I ]
  phrases [, accuracy := cumsum (accurate) / length ]
  
  return (phrases)
}