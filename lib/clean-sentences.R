
#
# performs pre-processing on 1 or more sentences.
#
clean_sentences <- function (sentences) {
  
  sentences <- stri_trans_tolower (sentences)
  sentences <- stri_replace_all_regex (sentences, "[^[:alnum:][:blank:]]+", " ")
  sentences <- stri_replace_all_regex (sentences, "[[:digit:]]+", "###")
  sentences <- stri_trim_both (sentences)
  
  return (sentences)
}