
#
# returns all the words except the last
#
except_last_word <- function (phrase) {
  words <- split_on_space (phrase)
  paste (words [1:length (words)-1], collapse = " ")
}