## First function creates matrix avaliable to cache oneself.
## Second function calculates the inverse matrix and caches 
## the result.

## Function creates matrix avaliable to cache oneself.
## Function takes as argument matrix 'x', by default 'x' 
## is empty matrix.
## Return the list of functions for setting and getting
## matrix, setting and getting inverse matrix.

makeCacheMatrix <- function(x = matrix()) {
    ## Variable for caching inverse matrix
    inverse <- NULL
    
    ## Functions takes matrix 'y' as argument that by
    ## default is empty matrix, and assign it to 'x',
    ## and update cached value inverse.
    set <- function(y = matrix()) {
        x <<- y
        inverse <<- NULL
    }
    
    ## Function returns matrix 'x'.
    get <- function() {
        x
    }
    
    ## Function updates cached value inverse.
    ## Function takes matrix 'm' as an argument.
    setinverse <- function (m) {
        inverse <- m
    }
    
    ## Function returns cache value of inversed 
    ## matrix 'x'.
    getinverse <- function() {
        inverse
    }
    
    list( set = set, get = get, 
          setinverse = setinverse, getinverse = getinverse)
}


## Function returns inverse of 'x'.

cacheSolve <- function(x, ...) {
    inverse <- x$getinverse()
    
    if (!is.null(inverse)) {
        message("getting cached data")
        return(inverse) 
    }
    
    matrix <- x$get()
    inverse <- solve(matrix)
    x$setinverse(inverse)
    inverse
        ## Return a matrix that is the inverse of 'x'
}
