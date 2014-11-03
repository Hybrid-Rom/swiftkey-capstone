

# setup
# remove any test data sets in memory
delete <- ls (pattern = "test[0-9]+")
if (length (delete) > 0)
    rm (list = delete, envir = envir)

# remove any cached data files
cleanup <- list.files ("cache", pattern = "test.*\\.RData", full.names = TRUE)
file.remove (cleanup)

# test 1
# the code block can explicitly assign a data set to the given name
expect_false (data.exists ("test1"))
cache_if_missing ("test1", { test1 <- data.frame () })
expect_true (data.exists ("test1"))

# test 2
# the code block does not have to assign to the given name
expect_false (data.exists ("test2"))
cache_if_missing ("test2", { data.frame () })
expect_true (data.exists ("test2"))

# test 3
# do not write to the cache
cache_if_missing ("test3", { data.frame () }, cache_write = FALSE)
expect_false (file.exists ("cache/test3.RData"))

# test 4
# write to the cache
expect_false (file.exists ("cache/test4.RData"))
cache_if_missing ("test4", { data.frame () }, cache_write = TRUE)
expect_true (file.exists ("cache/test4.RData"))

# test 5
# default behavior is to write to the cache
expect_false (file.exists ("cache/test5.RData"))
cache_if_missing ("test5", { data.frame () })
expect_true (file.exists ("cache/test5.RData"))

# clean-up
cleanup ()




