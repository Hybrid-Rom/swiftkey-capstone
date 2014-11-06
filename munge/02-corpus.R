
# create the training and test corpus
cache_if_missing ("train.corpus", { create_corpus (train.lines) })

# clean-up
rm (train.lines)
gc ()
