expected <- c("aaa", "bbb", "ccc")
expect_equal (split_on_space ("aaa bbb ccc"), expected)
expect_equal (split_on_space ("   aaa    bbb   ccc   "), expected)
