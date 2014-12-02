
#
# given a vector of previous words, predict the next word.  
#
# 'n' defines the number of predictions to return.  by default only
# the best (only 1) prediction will be returned.  otherwise, the top
# 'n' predictions will be returned.
#
predict_next_word <- function (phrase, ngrams, N = 1, grams = 3:1) {
    
    # sanity checks
    stopifnot (is.character (phrase))
    stopifnot (length (phrase) == 1)
    
    # clean the input phrase
    clean_phrase <- clean_sentences (phrase, end_tag = "")
    
    # break the sentence into its component words
    previous <- unlist (strsplit (clean_phrase, split = " ", fixed = TRUE))
    len <- length (previous)
    
    predictions <- NULL
    for (i in grams) {
        
        # ensure there are enough previous words 
        # for example, a trigram ngrams needs 2 previous words
        if (len >= i-1) {
            
            # grab the last 'i-1' words
            ctx <- tail (previous, i-1)
            ctx <- paste (ctx, collapse = " ")
            
            #prediction <- ngrams [context == ctx, .SD [which.max (p), word]]
            predictions <- ngrams [context == ctx, 
                                   .SD [order (p, decreasing=T)[1:N], word]]
            if (length (predictions) > 0) {
                #message (sprintf ("%s-gram: '%s' -> '%s'", i, ctx, prediction))
                break
            }
        }
    }
    
    return (predictions)
}