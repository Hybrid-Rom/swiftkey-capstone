
test <- data.table (phrase = test)

# previous word(s)
test [, base_words := {
  w <- unlist (strsplit (phrase, split = " ", fixed = TRUE))
  paste (w [1:length (w)-1], collapse = " ")
}, by = phrase]

# next word
test [, next_word := {
  w <- unlist (strsplit (phrase, split = " ", fixed = TRUE))
  w [length (w)]
}, by = phrase]