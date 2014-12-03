
split_sentences <- function (phrase) {
  
  # split based on periods, exclams or question marks
  result <- unlist (strsplit (phrase, split = "[\\.!?]+"))
  
  # trim excess whitespace
  result <- stri_trim_both (result)
  
  # do not return empty strings
  result <- result [nchar (result) > 0]
  
  # ensure that something is always returned
  if (length (result) > 0)
    result
  else 
    ""
}