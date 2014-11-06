#
# creates an n-gram term document matrix given a corpus
#
create_tdm <- function (corpus, ngram_min = 1, ngram_max = 3) {
    
    tok <- function(x) RWeka::NGramTokenizer(x, RWeka::Weka_control(min = ngram_min, max = ngram_max))
    tdm <- TermDocumentMatrix (corpus, control = list (tokenize = tok))    
    
    return (tdm)
}
