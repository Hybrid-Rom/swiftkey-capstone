#
# creates a corpus from a vector of text input and performs
# all of the necessary text pre-processing.
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
    corpus <- tm_map (corpus, content_transformer (str_trim))
    
    return (corpus)
}