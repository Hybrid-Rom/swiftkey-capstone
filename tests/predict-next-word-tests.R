
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

# combine the testgrams
testgrams <- rbindlist (list (trigrams, bigrams, unigrams))

# make some predictions!
expect_equal (predict_next_word ("I am", testgrams)$word, "sam")
expect_equal (predict_next_word ("I", testgrams)$word, "am")
expect_equal (predict_next_word ("", testgrams)$word, "i")

# return the top N predictions
expect_equal (length (predict_next_word ("I am", testgrams, N = 2)), 2)

