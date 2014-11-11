
#
# given a vector of previous words, predict the next word.
#
predict_next_word <- function (phrase, ngrams, n = 3) {
    
    # sanity checks
    stopifnot (is.character (phrase))
    stopifnot (length (phrase) == 1)
    
    # clean the input phrase
    clean_phrase <- clean_sentences (phrase, end_tag = "")
    
    # break the sentence into its component words
    previous <- unlist (strsplit (clean_phrase, split = " ", fixed = TRUE))
    len <- length (previous)
    
    prediction <- NULL
    for (i in n:1) {
        
        # ensure there are enough previous words 
        # for example, a trigram ngrams needs 2 previous words
        if (len >= i-1) {
            
            # grab the last 'i-1' words
            ctx <- tail (previous, i-1)
            ctx <- paste (ctx, collapse = " ")
            
            prediction <- ngrams [context == ctx, .SD [which.max (p), word]]
            if (length (prediction) > 0) {
                #message (sprintf ("%s-gram: '%s' -> '%s'", i, ctx, prediction))
                break
            }
        }
    }
    
    return (prediction)
}