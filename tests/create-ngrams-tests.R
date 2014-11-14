

# testing data set
sentences <- c("I am Sam.", "Sam I am.")
sentences <- clean_sentences (sentences)

# bigram testing
bigrams <- create_ngrams (sentences, 2)
expect_equal (bigrams [, sum (phrase_count)], 8)
expect_equal (bigrams [phrase == "^ i",  phrase_count], 1)
expect_equal (bigrams [phrase == "i am", phrase_count], 2)

# unigram testing
unigrams <- create_ngrams (sentences, 1)
expect_equal (unigrams [, sum (phrase_count)], 10)
expect_equal (unigrams [phrase == "^", phrase_count], 2)
expect_equal (unigrams [phrase == "i", phrase_count], 2)

# contractions should be maintained
unigrams <- create_ngrams ("don't he'll they've she's", 1)
expect_equal (unigrams [, sum (phrase_count)], 4)