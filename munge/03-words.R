
cache_if_missing ("words", {

    # count the total number of occurances across the corpus
    counts <- rowSums (as.matrix (tdm))
    words <- data.table (phrase = names (counts), count = counts)

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
})



