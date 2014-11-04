
#
# given a vector of previous words, predict the next word.
#
predict_next_word <- function (phrase, model, n = 3) {
  
  # sanity checks
  stopifnot (is.character (phrase))
  stopifnot (length (phrase) == 1)
  
  # break the sentence into its component words
  previous <- unlist (strsplit (phrase, split = " ", fixed = TRUE))
  len <- length (previous)
  
  prediction <- NULL
  for (i in n:1) {
 
    # ensure there are enough previous words 
    # trigram model needs 2 previous words
    if (len >= i-1) {
      
      # grab the last 'i-1' words
      base <- tail (previous, i-1)
      base <- paste (base, collapse = " ")
      
      prediction <- model [base_words == base, next_word]
      if (length (prediction) > 0) {
        break
      }
    }
  }
  
  return (prediction)
}