

# a single period delimits sentences
expect_equal (length (split_sentences ("1st sentence. 2nd sentence.")), 2)

# multiple periods also delimits sentences
expect_equal (length (split_sentences ("1st sentence... 2nd sentence...")), 2)

# an exclam delimits sentences
expect_equal (length (split_sentences ("1st sentence!! 2nd sentence!")), 2)

# a question mark delimits sentences
expect_equal (length (split_sentences ("1st sentence?? 2nd sentence?")), 2)

# extra whitespace should not impact sentence splitting
expect_equal (length (split_sentences (" 1st sentence.  2nd sentence. ")), 2)
