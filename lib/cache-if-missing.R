#
# if a data set does not already exist, create and
# cache it.  if the data set already exists, do nothing.
#
cache_if_missing <- function (name, data, 
                              cache_write = as.logical (config$cache_loading)) {
    
    if (!data.exists(name)) {
        
        # create the data set
        assign (name, data, inherits = TRUE)
        
        # cache the data set, if allowed
        if (cache_write)
            cache (name)
    }
}