#
# prepares the ngram model for deployment
#

model <- copy (ngrams)

# remove extraneous columns
model [, phrase_count := NULL]
model [, context_count := NULL]
model [, logp := NULL]
model [, phrase := NULL]

# keep the top 5 most likely words for each context only
model <- model [ order (context, -p)]
model [, rank := 1:.N, by = context]
model <- model [ rank < 6 ]

# save the ngram model in the app directory
save (list = "model", envir = .GlobalEnv, file = "app/ngrams.RData")
rm (model)