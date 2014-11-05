
#
# creates a corpus from a vector of text input
#
create_corpus <- function (text) {
  stopifnot (is.character (text))
  stopifnot (length (text) > 0)
  
  corpus <- Corpus (VectorSource (text))
  corpus <- tm_map (corpus, content_transformer (tolower))
  corpus <- tm_map (corpus, removePunctuation)
  corpus <- tm_map (corpus, removeNumbers)
  corpus <- tm_map (corpus, stemDocument, language = "english")
  corpus <- tm_map (corpus, stripWhitespace)
  
  return (corpus)
}

# create the training and test corpus
cache_if_missing ("train.corpus", { create_corpus (train.lines) })
cache_if_missing ("test.corpus", { create_corpus (test.lines) })

# clean-up
rm (train.lines)
rm (test.lines)
gc ()
