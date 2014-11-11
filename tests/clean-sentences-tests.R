
# sentences should be delimited with leading/trailing markers
expect_equal (clean_sentences ("a test sentence"), "^ a test sentence $")

# all text input should be lower cased
expect_equal (clean_sentences0 ("LOWER CASE"), "lower case")

# all numbers are replaced with ###
expect_equal (clean_sentences0 ("foo123456"), "foo###")

# all punctuation is removed
expect_equal (clean_sentences0 ("!punc-tu-ation's"), "punc tu ation s")

# leading/trailing whitespace should be trimmed
expect_equal (clean_sentences0 ("  trim whitespace   "), "trim whitespace" )

# vectorized input
expect_equal (clean_sentences0 (c(" FIRST.", "SECOND.")), c("first", "second"))
