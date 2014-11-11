
expect_equal (pad (c(10,20,30), 5), c(10,20,30,0,0))
expect_equal (pad (c(10,20,30), 4), c(10,20,30,0))
expect_equal (pad (c(10,20,30), 3), c(10,20,30))
expect_equal (pad (c(10,20,30), 2), c(10,20,30))
expect_equal (pad (c(10,20,30), 1), c(10,20,30))
expect_equal (pad (c(10,20,30), 5, pad_with = 99), c(10,20,30,99,99))
