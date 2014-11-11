

# all text input should be lower cased
expect_equal (clean_sentences ("LOWER CASE"), "lower case")

# all numbers are replaced with ###
expect_equal (clean_sentences ("foo123456"), "foo###")

# all punctuation is removed
expect_equal (clean_sentences ("!punc-tu-ation's"), "punc tu ation s")

# leading/trailing whitespace should be trimmed
expect_equal (clean_sentences ("  trim whitespace   "), "trim whitespace" )