
expect_equal (last_word ("alpha  beta   omega"), "omega")
expect_equal (last_word ("  alpha  beta   omega"), "omega")
expect_equal (last_word ("alpha  beta   omega   "), "omega")
