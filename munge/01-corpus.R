
cache_if_missing ("corpus", {
    
    # create a corpus from the text input
    files <- list.files ("data/en_US_sample/", pattern = "\\.txt$", full.names = TRUE)
    lines <- unlist (lapply (files, readLines))
    corpus <- Corpus(VectorSource (lines))
    
    # clean the corpus 
    corpus <- tm_map(corpus, content_transformer (tolower))
    corpus <- tm_map(corpus, removePunctuation)
    corpus <- tm_map(corpus, removeNumbers)
})
