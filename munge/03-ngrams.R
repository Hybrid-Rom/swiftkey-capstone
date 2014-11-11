#
# given the clean, pre-processed sentences, create a data set containing the ngrams
# extracted from these sentences.
#
cache ("ngrams", {
    
    # create a unigram model
    unigrams <- create_ngrams (train.sentences, 1)
    ngram_probabilities (unigrams)  
    
    # create a bigram model
    bigrams <- create_ngrams (train.sentences, 2)
    ngram_probabilities (bigrams) 
    
    # create a trigram model
    trigrams <- create_ngrams (train.sentences, 3)
    ngram_probabilities (trigrams)
    
    ngrams <- rbindlist (list (unigrams, bigrams, trigrams))
})

# for testing purposes, extract 4-grams only. the first 3 words provide the 
# context, then the 4th word is predicted
cache ("test.ngrams",  create_ngrams (test.sentences, 4))
