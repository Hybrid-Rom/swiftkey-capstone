
#
# fetches the last element of a vector
#
last_word <- function (phrase) {
  words <- split_on_space (phrase)
  words [length (words)]
}