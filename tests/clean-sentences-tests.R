
# sentences should be delimited with leading/trailing markers
expect_equal (clean_sentences ("a test sentence"), "^ a test sentence $")

# all text input should be lower cased
expect_equal (clean_sentences0 ("LOWER CASE"), "lower case")

# all numbers are replaced with ###
expect_equal (clean_sentences0 ("foo123456"), "foo###")

# all punctuation is removed
expect_equal (clean_sentences0 ("!punc-tu-ation"), "punc tu ation")

# leading/trailing whitespace should be trimmed
expect_equal (clean_sentences0 ("  trim whitespace   "), "trim whitespace" )

# contractions should be maintained as a single word
expect_equal (clean_sentences0 ("don't"), "don't")
expect_equal (clean_sentences0 ("it's"), "it's")
expect_equal (clean_sentences0 ("he'll"), "he'll")

# vectorized input
expect_equal (clean_sentences0 (c(" FIRST.", "SECOND.")), c("first", "second"))

