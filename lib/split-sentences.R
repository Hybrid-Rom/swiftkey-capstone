
split_sentences <- function (x) {
    
    # split based on periods, exclams or question marks
    result <- unlist (strsplit (x, split = "[\\.!?]+"))
    
    # trim excess whitespace
    result <- stri_trim_both (result)
    
    # do not return empty strings
    result [nchar (result) > 0]
}