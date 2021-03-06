
#
# creates a data set containing the unique ngrams contained within a
# set of clean sentences.
#
create_ngrams <- function (sentences, n) {
    message (sprintf ("creating %s-grams for %s sentences", n, comma (length (sentences))))
    
    # sanity checks
    stopifnot (is.character (sentences))
    stopifnot (length (sentences) > 0)
    
    # create a tokenizer
    ctl <- RWeka::Weka_control(min = n, max = n, delimiters = ' \r\n\t.,;:\\"()?!')
    tok <- function(x) RWeka::NGramTokenizer (x, ctl)
    
    # split the sentences into n-grams
    ngrams <- data.table (phrase = unlist (lapply (sentences, tok)))
    
    # remove duplicate ngrams and count the number of each
    ngrams <- ngrams [, list (phrase_count = .N), by = phrase]
    
    # mark each as a 1, 2, ... n gram
    ngrams [, n := n]
    
    # extract the context and the next word for each ngram
    ngrams [, `:=` (
        context = except_last_word (phrase),
        word    = last_word (phrase)
    ), by = phrase]
    
    # rearrange the columns
    setcolorder (ngrams, c("phrase", "context", "word", "n", "phrase_count"))
    
    return (ngrams)
}