
# should return true, as 'iris' is a data frame
data (iris)
expect_true (data.exists ("iris"))

# should return false, as 'data-foo' does not exists
expect_false (data.exists ("data-foo"))

# should return false, as 'ls' is a function
expect_false (data.exists ("ls"))

# must pass the name of the element, not the element itself
expect_error (data.exists (ls))