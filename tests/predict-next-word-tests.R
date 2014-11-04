
model <- data.table (base_words = c ("jack jumps high", "jumps high", "jumps", ""),
                     next_word  = c ("4gram", "3gram", "2gram", "1gram"),
                     count      = c (10, 10, 10, 10),
                     gram       = c (4, 3, 2, 1))

# 4-gram model matches on a 4-gram
expect_equal (predict_next_word ("jack jumps high", model, n = 4), "4gram")

# 4-gram model matches on a 3-gram
expect_equal (predict_next_word ("fred jumps high", model, n = 4), "3gram")

# 4-gram model matches on a 2-gram
expect_equal (predict_next_word ("fred jumps", model, n = 4), "2gram")

# 4-gram model matches on a 1-gram
expect_equal (predict_next_word ("fred skips high", model, n = 4), "1gram")

# 4-gram model would match on a 4-gram, but choose to only use 3-grams
expect_equal (predict_next_word ("jack jumps high", model, n = 3), "3gram")

