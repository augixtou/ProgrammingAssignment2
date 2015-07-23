# Create a special matrix, which is a list containing a function to 
# 1. set the value of the matix
# 2. get the value of the matix
# 3. set the value of the inverse matrix
# 4. get the value of the inverse matrix
 
makeCacheMatrix <- function(x = matrix()) {
    #set the intital inverse matrix value
    inverseMatrix <- NULL
    #set the value of matrix
    set <- function(y) {
        inverseMatrix <<- NULL
        x <<- y
    }
    #get the value of the matrix
    get<- function() x
    #set the value of the inverse matrix
    setInverseMatrix <- function(inverse) {
        inverseMatrix <<-  inverse
    }
    #get the value of the inverse matrix
    getInverseMatrix <- function() inverseMatrix
    #return a list containing the above function
    list( set = set, get =get,
          setInverseMatrix = setInverseMatrix,
          getInverseMatrix = getInverseMatrix)
}


## Caculate  and set the inverse matrix of the  sepcial "matrix"
## created by makeCacheMatrix if the InverseMatrix has not
## been cacualted Otherwise,return the inverse matrix directly. 

cacheSolve <- function(x, ...) {
    #get the inverse matrix and check if it is already cashed. 
    inverse<- x$getInverseMatrix()
     if (!is.null(inverse)){
         message("getting cached data")
         return (inverse)
     }
    # if not cashed, get the matrix data and caculate the inverse value
     data<- x$get()
     inverse<- solve(data)
     ## set the inverseMatrix
     x$setInverseMatrix(inverse)
     ## Return a matrix that is the inverse of 'x'
     inverse
}

