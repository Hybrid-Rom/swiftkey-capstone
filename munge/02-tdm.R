
cache_if_missing ("tdm", {
    
    # http://stackoverflow.com/questions/17703553/bigrams-instead-of-single-words-in-termdocument-matrix-using-r-and-rweka
    options (mc.cores = 1)
    
    # create the term document matrix with bi and tri-grams
    tok <- function(x) RWeka::NGramTokenizer(x, RWeka::Weka_control(min = 1, max = 3))
    tdm <- TermDocumentMatrix(corpus, control = list(tokenize = tok))
})
