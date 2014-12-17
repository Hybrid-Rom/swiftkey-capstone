#
# given the clean, pre-processed sentences, create a data set containing the ngrams
# extracted from these sentences.
#
ngrams <- ecache (key = "ngrams", {
    
    # create a unigram, bigram, trigram, and 4-gram model
    list_of_models <- lapply (1:4, function (n) {
      
      # cache each model 
      ecache (key = paste0 ("grams", n), {
        
        # create the model and calculate its probabilities
        g <- create_ngrams (sentences$train, n)
        ngram_probabilities (g)
      })
    })
      
    # combine the models into a single data set
    ngrams <- rbindlist (list_of_models)
    rm (list_of_grams)
    
    # exclude ngrams that offer little predictive power
    ngrams <- ngrams [ phrase_count > 3 ]
    
    # exclude any non-english characters
    ngrams <- ngrams [ !stri_detect (phrase, regex = "[^A-Za-z #'\\^\\$]+")]
    
    # do not predict a 'start of sentence'
    ngrams <- ngrams [word != "^"]
    
    # do not predict 'end of sentence' with no context or at the start of a sentence
    ngrams <- ngrams [!(context == ""  & word == "$")]
    ngrams <- ngrams [!(context == "^" & word == "$")]
})

# for testing purposes, extract 4-grams only. the first 3 words provide the 
# context, then the 4th word is predicted
ecache (key = "grams4",  create_ngrams (sentences$train, 4))
