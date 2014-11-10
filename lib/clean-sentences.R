
#
# performs pre-processing on 1 or more sentences.
#
clean_sentences <- function (sentences) {
  
  sentences <- stri_trans_tolower (sentences)
  sentences <- stri_replace_all_regex (sentences, "[[:punct:]]+", "")
  sentences <- stri_replace_all_regex (sentences, "[[:digit:]]+", "###")
  sentences <- stri_replace_all_regex (sentences, "[^[:print:]]+", "")
  sentences <- stri_trim_both (sentences)
  
  return (sentences)
}