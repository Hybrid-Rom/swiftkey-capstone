
# http://stackoverflow.com/questions/17703553/bigrams-instead-of-single-words-in-termdocument-matrix-using-r-and-rweka
options (mc.cores = 1)

# create a tdm for training with 1-grams, 2-grams, and 3-grams
cache_if_missing ("train.tdm", create_tdm (train.corpus))

# clean-up
rm (train.corpus)

