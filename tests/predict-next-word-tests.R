
# create a model for testing
text <- c("Jack jumps highest of all.", "Jill falls down the hill.", "Jane rolls over the wall.")
corpus <- create_corpus (text)
tdm <- create_tdm (corpus, ngram_min = 1, ngram_max = 4)
model <- create_model (tdm, cutoff = 0)

# 4-gram model matches on a 4-gram
expect_equal (predict_next_word ("Bill falls down the", model, n = 4), "hill")

# 4-gram model matches on a 3-gram
expect_equal (predict_next_word ("Who thought that Jill falls", model, n = 4), "down")

# 4-gram model matches on a 2-gram
expect_equal (predict_next_word ("Where does Jane", model, n = 4), "roll")

# 4-gram model matches on a 1-gram
expect_equal (predict_next_word ("Go drive", model, n = 4), "the")

# 4-gram model would match on a 4-gram, but specifically limited to 2-grams
expect_equal (predict_next_word ("Bill falls down the", model, n = 2), "hill")

