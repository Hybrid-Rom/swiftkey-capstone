# 
# #
# # creates a data set containing the frequency of occurrence for each model.  
# #
# 
# occurrences <- ngrams [, .N, by = list (n, phrase_count)]
# occurrences <- occurrences [order (n, phrase_count)]
# 
# # fit a logarithmic model for unigrams
# uniocc <- occurrences [n == 1]
# 
# fit <- lm (exp(N) ~ phrase_count, data = uniocc)
# fit <- lm (N ~ phrase_count, data = uniocc)
# 
# fit <- gam (N ~ s(phrase_count, bs = "cs"), data=uniocc)
# 
# uniocc$N.hat <- predict (fit, newdata=uniocc)
# 
# diff (uniocc$phrase_count)
# 
# 
# 
# p <- ggplot (uniocc, aes (phrase_count, N)) + geom_point () 
# p + scale_x_log10() + scale_y_log10()
