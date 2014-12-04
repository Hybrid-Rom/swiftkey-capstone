
library (ggplot2)
library (data.table)
library (stringi)
library (tm)
library (scales)
library (stats)
library (shiny)
library (networkD3)

#
# shinyapps.io requires that you source your own helper files... boo.
#
source ("cache.R")           
source ("clean-sentences.R")     
source ("create-corpus.R")      
source ("create-ngrams.R")      
source ("create-tdm.R")         
source ("data-exists.R")       
source ("except-last-word.R")   
source ("last_word.R")          
source ("ngram-probabilities.R")
source ("pad.R")     
source ("phrase-probability.R") 
source ("predict-next-word.R") 
source ("remove-nonprint.R")    
source ("split-on-space.R")     
source ("split-sentences.R")  
source ("phrase-accuracy.R")