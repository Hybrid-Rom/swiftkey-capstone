
#
# performs pre-processing on 1 or more sentences.
#
clean_sentences <- function (sentences, start_tag = "^", end_tag = "$") {
    
    # lower case
    sentences <- stri_trans_tolower (sentences)
    
    # remove anything that is not alpha, numeric, whitespace or ' (for contractions)
    sentences <- stri_replace_all_regex (sentences, "[^[:alnum:][:blank:]']+", " ")
    
    # replace all digits with a simple indicator flag
    sentences <- stri_replace_all_regex (sentences, "[[:digit:]]+", "###")
    
    # add starting/ending tag to each sentence
    sentences <- stri_paste (start_tag, sentences, end_tag, sep = " ")
    
    # trim whitespace
    sentences <- stri_trim_both (sentences)
    
    return (sentences)
}

#
# a useful function for when no starting or ending tags are needed
#
clean_sentences0 <- function (x) clean_sentences (x, start_tag = "", end_tag = "")


