
# extracts the processed string from a corpus
extract_string <- function (corpus) sapply (corpus, function(d) d$content)

# sanity checks
expect_error (create_corpus (123))
expect_error (create_corpus (character(0)))

# validate text pre-processing
expect_equal ("lower", extract_string (create_corpus ("LOWER")))
expect_equal ("punct", extract_string (create_corpus ("punct.")))
expect_equal ("number", extract_string (create_corpus ("999number777")))
expect_equal ("stem", extract_string (create_corpus ("stemming")))
expect_equal ("space space", extract_string (create_corpus (" space   space   ")))



