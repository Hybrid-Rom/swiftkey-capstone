#
# creates a holdout test data set for scoring the model
#

cache_if_missing ("test.phrases", {
    
    # split the held out text into 4-gram phases
    # the first 3 words provide the context, then the 4th word is predicted
    tok <- function(x) RWeka::NGramTokenizer(x, RWeka::Weka_control(min = 4, max = 4))
    test.phrases <- data.table (phrase = unlist (sapply (test.lines, tok)))
    
    # exclude any duplicate phrases which could occur
    test.phrases <- test.phrases [ !duplicated (phrase) ]
    
    # place a hard limit on the number of test phrases
    limit <- 30000
    if (nrow (test.phrases > limit)) {
        
        p <- limit / nrow (test.phrases)
        index <- as.logical (rbinom (n = nrow (test.phrases), size = 1, prob = p))
        test.phrases <- test.phrases [index]
    }
    
    # split the test phrase into previous and next
    test.phrases [, prev_words := except_last_word (phrase), by = phrase]
    test.phrases [, next_word := last_word (phrase), by = phrase]
    
    # clean the "next_word" so that it can be compared to the model's prediction
    test.phrases [, next_word := sapply (create_corpus (next_word), function (x) x$content)]
    
    # use the model to predict the next word
    test.phrases [, next_word_hat := predict_next_word (prev_words, model), by = phrase]
    
    # output a quick preview of test results
    correct <- nrow (test.phrases [next_word == next_word_hat])
    total <- nrow (test.phrases)
    message (sprintf ("The ngram model predicted %s accurately.", percent (correct / total)))

    # the null model simply predicts 'the', the most common word for each phrase
    correct <- nrow (test.phrases [next_word == "the"])
    message (sprintf ("The null model predicted %s accurately.", percent (correct / total)))
    
    test.phrases    
})