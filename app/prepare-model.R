#
# prepares the ngram model for deployment
#

# prepare the ngram model
rm (ngrams)
load ("cache/ngrams.RData")

# remove extraneous columns
ngrams [, phrase_count := NULL]
ngrams [, context_count := NULL]
ngrams [, logp := NULL]
ngrams [, phrase := NULL]

# keep the top 5 most likely words for each context only
ngrams <- ngrams [ order (context, -p)]
ngrams [, rank := 1:.N, by = context]
ngrams <- ngrams [ rank < 6 ]

# save the ngram model in the deployment directory
save (list = "ngrams", envir = .GlobalEnv, file = "app/ngrams.RData")
