
#
# given a vector of previous words, predict the next word.  
#
# 'n' defines the number of predictions to return.  by default only
# the best (only 1) prediction will be returned.  otherwise, the top
# 'n' predictions will be returned.
#
predict_next_word <- function (phrase, ngrams, N = 1, grams = 3:1) {
  
  # sanity checks
  stopifnot (is.character (phrase))
  stopifnot (length (phrase) == 1)
  
  # clean the input phrase
  clean_phrase <- clean_sentences (phrase, end_tag = "")
  
  # break the sentence into its component words
  previous <- unlist (strsplit (clean_phrase, split = " ", fixed = TRUE))
  len <- length (previous)
  
  predictions <- NULL
  for (g in grams) {
    
    # ensure there are enough previous words 
    # for example, a trigram ngrams needs 2 previous words
    if (len >= g-1) {
      
      # grab the last 'g-1' words
      ctx <- tail (previous, g-1)
      ctx <- paste (ctx, collapse = " ")
      
      # find the top 'N' predictions
      predictions <- ngrams [ context == ctx, .SD [order (p, decreasing=T)[1:N], list (word, p)]]
      if (nrow (predictions) > 0) {
        
        # basic corrections for predictions that should not be made
        predictions [word == "$", word := "."]
        predictions [word == "###", word := NA]
        
        # exclude any missing predictions
        predictions <- predictions [complete.cases (predictions)]

        break
      }
    }
  }
  
  return (predictions)
}