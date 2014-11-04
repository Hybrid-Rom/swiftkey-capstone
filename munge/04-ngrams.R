
# exclude any ngrams with less than 'cutoff' occurances
cutoff <- 3 

cache_if_missing ("ngrams", {

    # count the total number of occurances across the corpus
    mx <- sparseMatrix(train.tdm$i, train.tdm$j, x=train.tdm$v, dimnames = train.tdm$dimnames)
    counts <- rowSums (mx)
    ngrams <- data.table (phrase = rownames (mx), count = counts)

    # extract the 'previous word(s)'
    ngrams [, base_words := {
        w <- unlist (strsplit (phrase, split = " ", fixed = TRUE))
        paste (w [1:length (w)-1], collapse = " ")
    }, by = phrase]
    
    # extract the 'next word'
    ngrams [, next_word := {
        w <- unlist (strsplit (phrase, split = " ", fixed = TRUE))
        w [length (w)]
    }, by = phrase]
    
    # keep only the most frequently occuring next_word for each base_word
    ngrams <- ngrams [, list (
        next_word = next_word [which.max (count)], 
        count     = max (count)
    ), by = base_words]
    
    # exclude any ngrams that are rarely seen
    ngrams <- ngrams [ count >= cutoff ]
    
    # uni-gram, bi-gram or tri-gram?
    ngrams [, gram := sapply (strsplit (base_words, split = " "), length) + 1 ]
})



