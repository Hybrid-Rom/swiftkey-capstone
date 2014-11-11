
#
# calculates the probability of a phrase using multiple n-gram models
#
# p (we love you) = p (we) * p (love | we) * p (you | love)
#
#
phrase_probability <- function (phr, ngrams, models = 1:3, model_weights = 1:3) {
    
    clean_phrase <- clean_sentences (phr)
    
    # use a uni, bi, and tri-gram model to calculate the phrase probability
    probs <- sapply (models, function (n) {
        
        # find all n-grams for the phrase
        tok <- function(x) RWeka::NGramTokenizer(x, RWeka::Weka_control(min = n, max = n))
        phr_ngrams <- unlist (lapply (clean_phrase, tok))
        
        # find the probabilities for each ngram in the phrase
        phr_probs <- ngrams [phrase %in% phr_ngrams, logp]
        
        # account for ngrams where there is no calculated probability; p = 0% or log(0)
        phr_probs <- pad (phr_probs, length (phr_ngrams), pad_with = log(0))
        
        # calculate the phrase probability; p1*p2 = exp (log (p1) + log (p2))
        exp (sum (phr_probs))  
    })
    
    # interpolated model - weight the probability from each model according to the given weights    
    weighted.mean (probs, model_weights)
}

