
if (!data.exists ("tdm")) {
    
    # create the term document matrix
    tokenizer <- function(x) RWeka::NGramTokenizer(x, RWeka::Weka_control(min = 2, max = 2))
    tdm <- TermDocumentMatrix(corpus, control = list(tokenize = tokenizer))
    
    # save for future generations
    cache ("tdm")
}


