
# a test corpus
sentences <- c("I am Sam.", "Sam I am.", "I do not like green eggs and ham.")
sentences <- clean_sentences (sentences)

# bigram model
bigrams <- create_ngrams (sentences, 2)
ngram_probabilities (bigrams)

# calculate phrase probability using only the bigram model
grams <- c("^ i" ,  "i am", "am sam", "sam $")
expected <- exp (sum (bigrams [phrase %in% grams, logp]))
expect_equal (phrase_probability ("I am Sam", bigrams, models = 2, model_weights = 1), expected)

# calculate phrase probability using only the bigram model
grams <- c("^ i", "i do", "do not", "not $")
expected <- bigrams [phrase %in% grams, logp]
expected <- pad (expected, length (grams), pad_with = log(0))
expected <- exp (sum (expected))
expect_equal (phrase_probability ("I do not", bigrams, models = 2, model_weights = 1), expected)

