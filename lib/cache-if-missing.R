#
# if a data set does not already exist, create and
# cache it.  if the data set already exists, do nothing.
#
cache_if_missing <- function (name, data) {
    
    if (!data.exists(name)) {
        
        # create and cache the data set
        assign (name, data, inherits = TRUE)
        cache (name)
    }
}