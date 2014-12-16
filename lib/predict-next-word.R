
#
# given a vector of previous words, predict the next word.  
#
# 'n' defines the number of predictions to return.  by default only
# the best (only 1) prediction will be returned.  otherwise, the top
# 'n' predictions will be returned.
#
predict_next_word <- function (phrase, ngrams, grams = 3:1) {
  
  # sanity checks
  stopifnot (is.character (phrase))
  stopifnot (length (phrase) == 1)
  
  # clean the input phrase
  clean_phrase <- clean_sentences (split_sentences (phrase))
  
  # break the sentence into its component words
  words <- split_on_space (clean_phrase)
  
  # HACK only remove the 'end of sentence marker' if the phrase
  # did not end with a period.  currently difficult to tell if 
  # the phrase has an explicit sentence ending or if the clean_sentences
  # function is assuming there should be one.
  if (!stri_detect (phrase, regex = ".*[\\.!?][[:blank:]]*$"))
    words <- head (words, -1)
  
  predictions <- NULL
  for (g in grams) {
    
    # ensure there are enough previous words 
    # for example, a trigram ngrams needs 2 previous words
    if (length (words) >= g-1) {
      
      # grab the last 'g-1' words
      ctx <- tail (words, g-1)
      ctx <- paste (ctx, collapse = " ")
      
      # find the top 'N' predictions
      predictions <- ngrams [ context == ctx, list (word, p, n)]
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