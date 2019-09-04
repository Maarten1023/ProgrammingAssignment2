## This set of functions can be used to calculate the inverse of a matrix and once done, cache it in a variable in a parentenvironment, so it
## can be re-used. Both are designed to use in conjunction.

## This function controls the caching of the matrix and the inverse if calculated, using 'setter' and 'getter' of a variable 'x'

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y,...) {
                x <<- y
                m <<- NULL
        }
        get <- function() {x}
        setinv_matrix <- function(inv_matrix) m <<- inv_matrix
        getinv_matrix <- function() {m}
        list(set = set, get = get,
             setinv_matrix = setinv_matrix,
             getinv_matrix = getinv_matrix)
}


## This function checks if a matrix already has a cached inverse. If so it 'gets' the inverse, if not it calculates the inverse 
## and 'sets' it in the parent enivronment.

cacheSolve <- function(x, ...) {
        m <- x$getinv_matrix()
        if(!is.null(m)) {
        message("getting cached data")
        return(m)
}
data <- x$get()
m <- solve(data, ...)
x$setinv_matrix(m)
m
}
