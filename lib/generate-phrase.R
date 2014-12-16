#'
#' Generate phrase
#' 
#' Generates a randomized phrase based on the languge model's
#' top 5 suggested next words.
#'
generate_phrase <- function (ngrams, max_length = 35) {
  
  phrase <- "^"
  for (i in 1:max_length) {
    
    # predict the next word
    nxt <- predict_next_word (phrase, ngrams)
    
    # randomly choose 1 of the top 5 suggestions
    next_word <- nxt [sample (1:nrow (nxt), 1), word ]
    
    # append the chosen word to the phrase    
    phrase <- paste (phrase, next_word, sep = " ")

    # if end of sentence reach, we're done
    if (next_word == ".")
      break
  }
  
  # remove the start-of-sentence marker
  phrase <- stri_replace (phrase, "", regex = "^\\^")
  phrase <- stri_replace (phrase, ".", regex = " \\.")
  phrase <- stri_trim_both (phrase)
  
  return (phrase)
}