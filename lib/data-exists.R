
#
# returns true if a data frame (or data table) exists in 
# the current environment.  additional arguments will be
# passed through to exists if needed.
#
data.exists <- function (data.name) {
    stopifnot (is.character (data.name))
    exists (data.name) && is.data.frame ( get (data.name))
}