
# any phrases with less than 'k' number of occurances will be excluded
k <- 3 

cache_if_missing ("words", {

    # convert to a more functional sparse matrix
    mx <- sparseMatrix(tdm$i, tdm$j, x=tdm$v, dimnames = tdm$dimnames)
  
    # count the total number of occurances across the corpus
    counts <- rowSums (mx)
    words <- data.table (phrase = rownames (mx), count = counts)

    # previous word(s)
    words [, base_words := {
        w <- unlist (strsplit (phrase, split = " ", fixed = TRUE))
        paste (w [1:length (w)-1], collapse = " ")
    }, by = phrase]
    
    # next word
    words [, next_word := {
        w <- unlist (strsplit (phrase, split = " ", fixed = TRUE))
        w [length (w)]
    }, by = phrase]
    
    # keep only the most frequently occuring next_word for each base_word
    words <- words [, list (
        next_word = next_word [which.max (count)], 
        count     = max (count)
    ), by = base_words]
    
    # exclude any phrases that are rarely seen
    words <- words [ count >= k ]
    
    # uni-gram, bi-gram or tri-gram?
    words [, base_words_count := sapply (strsplit (base_words, split = " "), length) ]
    words [ base_words_count == 0, gram := "uni" ]
    words [ base_words_count == 1, gram := "bi"  ]
    words [ base_words_count == 2, gram := "tri" ]
    words [, base_words_count := NULL ]
    words [, gram := as.factor (gram )]
})



