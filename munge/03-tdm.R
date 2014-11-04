
#
# creates a term document matrix from a corpus
#
create_tdm <- function (corpus, min_n, max_n) {
  
  # create the term document matrix with bi and tri-grams
  tok <- function(x) RWeka::NGramTokenizer(x, RWeka::Weka_control(min = min_n, max = max_n))
  tdm <- TermDocumentMatrix (corpus, control = list (tokenize = tok))
  
  return (tdm)
}

# http://stackoverflow.com/questions/17703553/bigrams-instead-of-single-words-in-termdocument-matrix-using-r-and-rweka
options (mc.cores = 1)

# create a tdm for training with 1-grams, 2-grams, and 3-grams
cache_if_missing ("train.tdm", create_tdm (train.corpus, 1, 3))

# create a tdm with only 4-grams to use for testing the model
cache_if_missing ("test.tdm", create_tdm (test.corpus, 4, 4))


