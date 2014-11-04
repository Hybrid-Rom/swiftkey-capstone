
split_on_space <- function (x) {
  result <- unlist (strsplit (x, split = "[ ]+"))
  result [nchar (result) > 0]
}
