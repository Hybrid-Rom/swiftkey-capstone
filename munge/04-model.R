
# exclude any ngrams with less than 'cutoff' occurances
cutoff <- 3 

cache_if_missing ("model", {

    # count the total number of occurances across the corpus
    mx <- sparseMatrix(train.tdm$i, train.tdm$j, x=train.tdm$v, dimnames = train.tdm$dimnames)
    counts <- rowSums (mx)
    model <- data.table (phrase = rownames (mx), count = counts)

    # split the phrase into previous and next
    model [, prev_words := except_last_word (phrase), by = phrase]
    model [, next_word := last_word (phrase), by = phrase]
    
    # keep only the most frequently occuring next_word for each base_word
    model <- model [, list (
        next_word = next_word [which.max (count)], 
        count     = max (count)
    ), by = base_words]
    
    # exclude any ngrams that occur less than the cut-off frequncy
    model <- model [ count >= cutoff ]
    
    # uni-gram, bi-gram or tri-gram?
    model [, gram := sapply (strsplit (base_words, split = " "), length) + 1 ]
})



