

expect_equal (remove_nonprint ("word 1234 ;!@_"), "word 1234 ;!@_")

x <- "fa\xE7ile"
Encoding(x) <- "latin1"
expect_equal (remove_nonprint (x), "faile")
