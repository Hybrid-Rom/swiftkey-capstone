#
# creates a holdout test data set for scoring the model
#

cache ("test.ngrams", {
    
    # place a hard limit on the number of test phrases to predict
    count <- min (3000, nrow (test.ngrams))
    p <- count / nrow (test.ngrams)
    test.ngrams [, test := as.logical (rbinom (n = nrow (test.ngrams), size = 1, prob = p))]
    
    # calculate the probability of each phrase
    test.ngrams [test == TRUE, p := phrase_probability (phrase, ngrams)]
    
    # use the model to predict the next word
    test.ngrams [test == TRUE, word_hat := predict_next_word (context, ngrams), by = phrase]
    
    # output a quick preview of test results
    correct <- nrow (test.ngrams [test == TRUE & word == word_hat])
    message (sprintf ("The ngram model predicted %s accurately (%s total).", percent (correct / count), count))
    
    # the null model simply predicts 'the', the most common word for each phrase
    correct <- nrow (test.ngrams [test == TRUE & word == "the"])
    message (sprintf ("The null model predicted %s accurately (%s total).", percent (correct / count), count))
})