
if (!data.exists ("corpus")) {
    
    # create a corpus from the text input
    path <- "data/en_US/"
    lines <- unlist (lapply (list.files (path, full.names = TRUE), readLines))
    corpus <- Corpus(VectorSource (lines))
    
    # clean the corpus 
    corpus <- tm_map(corpus, content_transformer (tolower))
    corpus <- tm_map(corpus, removePunctuation)
    corpus <- tm_map(corpus, removeNumbers)

    # save for future generations
    cache ("corpus")
}

