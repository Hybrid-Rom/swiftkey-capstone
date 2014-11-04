
test.phrases <- data.table (phrase = test.tdm$dimnames$Terms)

# split the test phrase into previous and next
test.phrases [, prev_words := except_last_word (phrase), by = phrase]
test.phrases [, next_word := last_word (phrase), by = phrase]


