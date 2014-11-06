
# create and cache the n-gram model
cache_if_missing ("model", create_model (train.tdm, cutoff = 3))

# clean-up
rm (train.tdm)
