
classname <- function (name) paste (class (get (name)), collapse = " ")

#
# if a data set does not already exist, create and
# cache it.  if the data set already exists, do nothing.
#
cache_if_missing <- function (name, data, 
                              cache_write = as.logical (config$cache_loading)) {
    
    if (!data.exists(name)) {
        message ("creating data set: ", name, " @ ", Sys.time())
      
        # assign the data set to the given name
        assign (name, data, inherits = TRUE)
        
        # cache the data set, if allowed
        if (cache_write) {
            cache (name)   
            message (sprintf ("saving to cache: %s [%s] @ %s", name, classname (name), Sys.time()))
        }
        
    } else {
      message (sprintf ("loaded from cache: %s [%s] @ %s", name, classname (name), Sys.time()))
    }
}