
# setup
if (data.exists ("foo")) rm (foo)

# the code block can explicitly assign a data set to the given name
expect_false (data.exists ("foo"))
cache_if_missing ("foo", { foo <- data.frame () })
expect_true (data.exists ("foo"))

# setup
if (data.exists ("foo")) rm (foo)

# the code block does not have to assign to the given name
expect_false (data.exists ("foo"))
cache_if_missing ("foo", { data.frame () })
expect_true (data.exists ("foo"))
