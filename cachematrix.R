## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# This function creates a "special" matrix which the inverse of it is cached in an environment that is different from the current environment 
makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function () x
    setinverse <- function(solve) m <<-solve
    getinverse <- function() m
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## Write a short comment describing this function
# This function calculates the inverse of the "special "squared matrix created with the above function

cacheSolve <- function(x, ...) {
    m <- x$getinverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)
    m ## Return a matrix that is the inverse of 'x'
}
