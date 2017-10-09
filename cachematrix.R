## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {                             #default arg x is a 1x1 NA matrix
    m <- NULL                                                           #sets the Inverse Matrix (m) with NULL in object environment at the first time
    set <- function(y) {                                                #sets the Invertible Matrix argument and clear the cache
        x <<- y                                                         #sets the Invertible Matrix argument in the in the MakeCacheMatrix Object
        m <<- NULL                                                      #sets the Inverse Matrix (m) with NULL in the in the MakeCacheMatrix Object
    }
    get <- function() x                                                 #returns the Invertible Matrix argument (x)
    setInverseMatrix <- function(inverseMatrix) m <<- inverseMatrix     #sets the value of the Inverse Matrix (m) in the MakeCacheMatrix Object
    getInverseMatrix <- function() m                                    #Returns the value of the Inverse Matrix (m) from the makeCacheMatrix Object
    list(set = set, get = get,
         setInverseMatrix = setInverseMatrix,
         getInverseMatrix = getInverseMatrix)                           #returns the makeCacheMatrix object containing its methods
}


## This function computes the inverse of the special "matrix" returned by
## `makeCacheMatrix` above. If the inverse has already been calculated (and the
## matrix has not changed), then it should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
    m <- x$getInverseMatrix()               #Attempts to get the cached Inverse Matrix from makeCacheMatrix object
    if(!is.null(m)) {                       #Inverse Matrix already previously cached by the setInverseMatrix() in the makeCacheMatrix object
        message("getting cached data")
        return(m)                           #returns Inverse Matrix previously cached by setInverseMatrix()
    }
    data <- x$get()                         #gets the Invertible Matrix argument to be inverted from makeCacheMatrix object
    m <- solve(data, ...)                        #calculates the inverse of the invertible matrix
    x$setInverseMatrix(m)                   #Caches the Inverse Matrix in MakeCacheMatrix Object
    m                                       #Return a matrix that is the inverse of 'x'
}
