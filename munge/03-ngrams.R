#
# given the clean, pre-processed sentences, create a data set containing the ngrams
# extracted from these sentences.
#
cache ("ngrams", {
    
    # create a unigram model
    unigrams <- create_ngrams (sentences$train, 1)
    ngram_probabilities (unigrams)  
    
    # create a bigram model
    bigrams <- create_ngrams (sentences$train, 2)
    ngram_probabilities (bigrams) 
    
    # create a trigram model
    trigrams <- create_ngrams (sentences$train, 3)
    ngram_probabilities (trigrams)
    
    # combine the models into a single data set
    ngrams <- rbindlist (list (unigrams, bigrams, trigrams))
    
    # exclude ngrams that offer little predictive power
    ngrams <- ngrams [ phrase_count > 3 ]
    
    # exclude any non-english characters
    ngrams <- ngrams [ !stri_detect (phrase, regex = "[^A-Za-z #'\\^\\$]+")]
})

# for testing purposes, extract 4-grams only. the first 3 words provide the 
# context, then the 4th word is predicted
cache ("test.ngrams",  create_ngrams (sentences$train, 4))
