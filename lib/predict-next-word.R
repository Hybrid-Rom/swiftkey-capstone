
#
# given a vector of previous words, predict the next word.
#
predict_next_word <- function (phrase, model, n = 3) {
    
    # sanity checks
    stopifnot (is.character (phrase))
    stopifnot (length (phrase) == 1)
    
    # uses 'create_corpus' to apply all of the same pre-processing on the 
    # input phrase as was applied to the training data
    clean_phrase <- sapply (create_corpus (phrase), function (x) x$content)
    
    # break the sentence into its component words
    previous <- unlist (strsplit (clean_phrase, split = " ", fixed = TRUE))
    len <- length (previous)
    
    prediction <- NULL
    for (i in n:1) {
        
        # ensure there are enough previous words 
        # for example, a trigram model needs 2 previous words
        if (len >= i-1) {
            
            # grab the last 'i-1' words
            base <- tail (previous, i-1)
            base <- paste (base, collapse = " ")
            
            prediction <- model [prev_words == base, next_word]
            if (length (prediction) > 0) {
                #message (sprintf ("%s-gram: '%s' -> '%s'", i, base, prediction))
                break
            }
        }
    }
    
    return (prediction)
}