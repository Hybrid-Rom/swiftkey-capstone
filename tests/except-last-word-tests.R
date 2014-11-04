
expect_equal (except_last_word ("alpha  beta   omega"), "alpha beta")
expect_equal (except_last_word ("  alpha  beta   omega"), "alpha beta")
expect_equal (except_last_word ("alpha  beta   omega   "), "alpha beta")
