#
# each line of text input can contain 1 or more sentences.  split each line into separate sentences
# and clean each sentence.
#

sentences <- ecache (key = "sentences", {
    
    # split the text input into sentences and clean
    # test data should not be cleaned    
    list (train = clean_sentences (split_sentences (lines$train)),
          test  = split_sentences (lines$test))
})
