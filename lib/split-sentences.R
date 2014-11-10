
split_sentences <- function (x) {
  result <- unlist (strsplit (x, split = "\\.+"))
  result [nchar (result) > 0]
}