
#
# creates an n-gram model given a tdm
#
create_model <- function (tdm, cutoff = 3) {
    
    # count the total number of occurances across the corpus
    mx <- sparseMatrix(tdm$i, tdm$j, x=tdm$v, dimnames = tdm$dimnames)
    counts <- rowSums (mx)
    model <- data.table (phrase = rownames (mx), count = counts)
    
    # split the phrase into previous and next
    model [, prev_words := except_last_word (phrase), by = phrase]
    model [, next_word := last_word (phrase), by = phrase]
    
    # keep only the most frequently occuring prev_word for each base_word
    model <- model [, list (
        next_word = next_word [which.max (count)], 
        count     = max (count)
    ), by = prev_words]
    
    # exclude any ngrams that occur less than the cut-off frequncy
    model <- model [ count >= cutoff ]
    
    # uni-gram, bi-gram or tri-gram?
    model [, gram := sapply (strsplit (prev_words, split = " "), length) + 1 ]
    
}