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
    
    # split the test phrase into previous and next
    test.phrases [, prev_words := except_last_word (phrase), by = phrase]
    test.phrases [, next_word := last_word (phrase), by = phrase]
    
    # use the model to predict the next word
    limit <- 500000
    test.phrases [1:limit, next_word_hat := predict_next_word (prev_words, model), by = phrase]
    
    # output a quick preview of test results
    correct <- nrow (test.phrases [next_word == next_word_hat])
    total <- min (limit, nrow (test.phrases [!is.na(next_word_hat)]))
    message (sprintf ("The model predicted %s accurately.", percent (correct / total)))

    test.phrases    
})