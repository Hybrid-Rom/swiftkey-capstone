#
# given the clean, pre-processed sentences, create a data set containing the ngrams
# extracted from these sentences.
#

# extract all 1, 2, and 3-grams
cache_if_missing ("train.ngrams", create_ngrams (train.sentences, 1, 3))

# for testing purposes, extract 4-grams only. the first 3 words provide the 
# context, then the 4th word is predicted
cache_if_missing ("test.ngrams",  create_ngrams (test.sentences, 4, 4))
