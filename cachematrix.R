## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function( x = matrix() ) {
    
    ## Initialize the inverse property
    i <- NULL
    
    ## Method to set the matrix
    set <- function( matrix ) {
        x <<- matrix
        i <<- NULL
    }
    
    ## Method the get the matrix
    get <- function() {
        ## Return the matrix
        x
    }
    
    ## Method to set the inverse of the matrix
    setInverse <- function(inverse) {
        i <<- inverse
    }
    
    ## Method to get the inverse of the matrix
    getInverse <- function() {
        ## Return the inverse property
        i
    }
    
    ## Return a list of the methods
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


## Write a short comment describing this function

## This function computes the inverse of the special "matrix" returned by `makeCacheMatrix`

cacheSolve <- function(x, ...) {
    i <- x$getInverse()
    
    if (!is.null(i)) {
        message("getting cached data")
        return(i)          # return early if already cached
    }
    
    mat <- x$get()
    i <- solve(mat, ...)   # compute inverse
    x$setInverse(i)        # store in cache
    i
}

# Usage
# m <- makeCacheMatrix(matrix(c(1,2,3,4), 2, 2))
# cacheSolve(m)   # computes inverse
# cacheSolve(m)   # returns cached result
