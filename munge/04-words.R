
# exclude any phrases with less than 'k' occurances
k <- 3 

cache_if_missing ("phrases", {

    # count the total number of occurances across the corpus
    mx <- sparseMatrix(tdm$i, tdm$j, x=tdm$v, dimnames = tdm$dimnames)
    counts <- rowSums (mx)
    phrases <- data.table (phrase = rownames (mx), count = counts)

    # extract the 'previous word(s)'
    phrases [, base_words := {
        w <- unlist (strsplit (phrase, split = " ", fixed = TRUE))
        paste (w [1:length (w)-1], collapse = " ")
    }, by = phrase]
    
    # extract the 'next word'
    phrases [, next_word := {
        w <- unlist (strsplit (phrase, split = " ", fixed = TRUE))
        w [length (w)]
    }, by = phrase]
    
    # keep only the most frequently occuring next_word for each base_word
    phrases <- phrases [, list (
        next_word = next_word [which.max (count)], 
        count     = max (count)
    ), by = base_words]
    
    # exclude any phrases that are rarely seen
    phrases <- phrases [ count >= k ]
    
    # uni-gram, bi-gram or tri-gram?
    phrases [, word_count := sapply (strsplit (base_words, split = " "), length) ]
    phrases [ word_count == 0, gram := "uni" ]
    phrases [ word_count == 1, gram := "bi"  ]
    phrases [ word_count == 2, gram := "tri" ]
    phrases [, word_count := NULL ]
    phrases [, gram := as.factor (gram )]
})



