

# bigram testing
sentences <- c("I am Sam.", "Sam I am.", "I do not like green eggs and ham.")
sentences <- clean_sentences (sentences)

bigrams <- create_ngrams (sentences, 2)
ngram_probabilities (bigrams)

expect_equal (bigrams [phrase == "^ i",   p],  2/3)
expect_equal (bigrams [phrase == "^ sam", p],  1/3)
expect_equal (bigrams [phrase == "i am",  p],  2/3)
expect_equal (bigrams [phrase == "sam $", p],  1/2)
expect_equal (bigrams [phrase == "am sam", p], 1/2)
expect_equal (bigrams [phrase == "i do", p],   1/3)

# unigram testing
sentences <- "A B C A B B C C A C B C A A C B C C B C"
sentences <- clean_sentences (sentences)

unigrams <- create_ngrams (sentences, 1)
ngram_probabilities (unigrams)

expect_equal (unigrams [phrase == "a", p],  5/22)
expect_equal (unigrams [phrase == "b", p],  6/22)
expect_equal (unigrams [phrase == "c", p],  9/22)
