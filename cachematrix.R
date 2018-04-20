## Put comments here that give an overall description of what your
## functions do

## make Cache Matrix makes a list of functions to create a "special matrix" to invert

## define below functions to set and get a matrix, as well as set and get its inverse. 
## Together with cacheSolve.R they cache the inverse of a matrix to save user time in computing it every time it is needed. 

makeCacheMatrix <- function(x = matrix()){
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) inv <<- solve
  getinverse <- function() inv
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## solve for the inverse of matrix. Check cache first if solution already exists, if not compute it

## below function gets the calculated inverse of a matrix from the cache, or calculates it. 
cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}
