
# create the training and test corpus
cache_if_missing ("train.corpus", { create_corpus (train.lines) })
cache_if_missing ("test.corpus", { create_corpus (test.lines) })

# clean-up
rm (train.lines)
rm (test.lines)
gc ()
