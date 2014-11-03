
# what percentage of the corpus should be kept for training?
p <- 0.10

cache_if_missing ("corpus", {
    
    # create a corpus from the text input
    files <- list.files ("data/en_US/", pattern = "\\.txt$", full.names = TRUE)
    lines <- unlist (lapply (files, readLines))
    
    # sample a subset of the lines
    index <- as.logical (rbinom (n=length(lines), size=1, prob=p))
    corpus <- Corpus(VectorSource (lines [index]))
    
    # clean the corpus 
    corpus <- tm_map(corpus, content_transformer (tolower))
    corpus <- tm_map(corpus, removePunctuation)
    corpus <- tm_map(corpus, removeNumbers)
    corpus <- tm_map(corpus, stemDocument, language = "english") 
})
