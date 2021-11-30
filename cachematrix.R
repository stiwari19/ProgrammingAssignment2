## Function to create object where matrix and it's inverse is stored.
#Tested using a=matrix(1:4,2,2)

makeCacheMatrix <- function(x = matrix()) {

  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) m <<- solve
  getsolve <- function() m
  list(set = set, get = get,
    setsolve = setsolve,
    getsolve = getsolve)

}



## Using solve function to get the inverse of matrix . If the inverse is not stored or is Null
## then calculate the inverse else give the cached inverse value of matrix.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getsolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setsolve(m)
  m
}
