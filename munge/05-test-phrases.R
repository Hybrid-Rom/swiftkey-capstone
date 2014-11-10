#
# creates a holdout test data set for scoring the model
#

cache_if_missing ("test.phrases", {
    
    # place a hard limit on the number of test phrases
    limit <- 30000
    if (nrow (test.ngrams) > limit) {
        
        p <- limit / nrow (test.ngrams)
        index <- as.logical (rbinom (n = nrow (test.ngrams), size = 1, prob = p))
        test.ngrams <- test.ngrams [index]
    }
    
    # extract the context and the next word from each ngram
    test.ngrams [, `:=` (
      context = except_last_word (phrase),
      word    = last_word (phrase)
    ), by = list (phrase, n, count) ]
    
    # use the model to predict the next word
    test.ngrams [, word_hat := predict_next_word (context, model), by = phrase]
    
    # output a quick preview of test results
    correct <- nrow (test.ngrams [word == word_hat])
    total <- nrow (test.ngrams)
    message (sprintf ("The ngram model predicted %s accurately (%s total).", percent (correct / total), total))

    # the null model simply predicts 'the', the most common word for each phrase
    correct <- nrow (test.ngrams [word == "the"])
    message (sprintf ("The null model predicted %s accurately (%s total).", percent (correct / total), total))
    
    test.ngrams   
})