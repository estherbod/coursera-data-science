## This pair of functions implements a matrix with cached inverse.

## This function implements a matrix with its cached inverse. It is a list with options to 
## set and get the value of the matrix and to set and get the inverse.
makeCacheMatrix <- function(mat = matrix()) {
  mat <- NULL
  set <- function(m) {
    mat <<- m
    inv <<- NULL
  }
  get <- function() mat
  setinv <- function(i) inv <<- i
  getinv <- function() inv
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)  
}

## This function calculates the inverse of a matrix stored in the result of makeCacheMatrix. 
## It checks to see if the inverse has been calculated before and returns the result from the
## cache whenever possible. If the inverse has not been calculated before, it is stored in the cache.
cacheSolve <- function(mat, ...) {
  inv <- mat$getinv()
  if(!is.null(inv)) {
    message("returning cached inverse")
    inv
  }
  else {
    message("computing inverse")
    inv <- solve(mat$get(), ...)
    mat$setinv(inv)
    inv
  }
}