## Put comments here that give an overall description of what your
## functions do

# create a special matrix, which is a list containing
# a function to 
# 1. set the value of the matix
# 2. get the value of the matix
# 3. set the value of the inverse matrix
# 4. get the value of the inverse matrix
 
makeCacheMatrix <- function(x = matrix()) {
    inverseMatrix <- NULL
    set <- function(y) {
        inverseMatrix <<- NULL
        x <<- y
    }
    get<- function() x
    setInverseMatrix <- function(inverse) {
        inverseMatrix <<-  inverse
    }
    getInverseMatrix <- function() inverseMatrix
    list( set = set, get =get,
          setInverseMatrix = setInverseMatrix,
          getInverseMatrix = getInverseMatrix)
}


## calculate the inversematrix using the sepcial "matrix"
## created by the above function if the InverseMatrix has not
## been caculated

cacheSolve <- function(x, ...) {
     inverse<- x$getInverseMatrix()
     if (!is.null(inverse)){
         message("getting cached data")
         return (inverse)
     }
     data<- x$get()
     inverse<- solve(data)
     ## get the inverseMatrix
     x$setInverseMatrix(inverse)
     ## Return a matrix that is the inverse of 'x'
     inverse
}
