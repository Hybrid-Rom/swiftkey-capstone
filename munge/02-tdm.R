
cache_if_missing ("tdm", {
    
    
    # create the term document matrix
    tok <- function(x) RWeka::NGramTokenizer(x, RWeka::Weka_control(min = 2, max = 2))
    tdm <- TermDocumentMatrix(corpus, control = list(tokenize = tok))
})
