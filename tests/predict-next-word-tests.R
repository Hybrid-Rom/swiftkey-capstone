
# a simple corpus for testing
sentences <- c("I am Sam.", "Sam I am.", "I do not like green eggs and ham.")
sentences <- clean_sentences (sentences)

# trigrams
trigrams <- create_ngrams (sentences, 3)
ngram_probabilities (trigrams)

# bigrams
bigrams <- create_ngrams (sentences, 2)
ngram_probabilities (bigrams)

# unigrams
unigrams <- create_ngrams (sentences, 1)
ngram_probabilities (unigrams)

# combine the ngramss
ngrams <- rbindlist (list (trigrams, bigrams, unigrams))

# match on a 3-gram
expect_equal (predict_next_word ("I am", ngrams, n = 3), "sam")

# match on a 2-gram
expect_equal (predict_next_word ("I", ngrams, n = 3), "am")

# match a 1-gram
expect_equal (predict_next_word ("", ngrams, n = 3), "i")
