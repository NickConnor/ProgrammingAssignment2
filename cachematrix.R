## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function:
## 1. take the value of the input matrix
## 2. get/produce the value of the input matrix
## 3. take the resulting matrix and calculate the inverse, store/cache it.
## 4. get the value of this inverted matrix from cache, without recalculating? - solve function.

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y){
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set=set, get=get, setinverse = setinverse, getinverse=getinverse) 
}

## Trying to create an inverted matrix with the above input.

## Return a matrix that is the inverse of 'x'
cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if(!is.null(i)) {
    message("retrieving cached data...")
    return(i)
}
  data <- x$get()
  i <- solve(data)
  x$setinverse(i)
  i
}

## OKAY
## Running sample input Demo
## Create demo simple matrix then run
## > x<-rbind(c(1, -1/3, 5), c(5,-1/3,1), c(1,-1/2,5))
## > x
## [,1]       [,2] [,3]
## [1,]    1 -0.3333333    5
## [2,]    5 -0.3333333    1
## [3,]    1 -0.5000000    5
## Check if it can be solved with the solve function.
## > solve(x)
## [,1]          [,2]       [,3]
## [1,] 0.2916667  2.083333e-01 -0.3333333
## [2,] 6.0000000 -8.538092e-18 -6.0000000
## [3,] 0.5416667 -4.166667e-02 -0.3333333
##  
## It CAN! Time to run through the functions.
## 
## > m<-makeCacheMatrix(x)
##  Made the variable m contain the base matrix in cache, check.
## > m$get()
## [,1]       [,2] [,3]
## [1,]    1 -0.3333333    5
## [2,]    5 -0.3333333    1
## [3,]    1 -0.5000000    5
## 
## Running the matrix m through the solving function.
## 
## > cacheSolve(m)
## [,1]          [,2]       [,3]
## [1,] 0.2916667  2.083333e-01 -0.3333333
## [2,] 6.0000000 -8.538092e-18 -6.0000000
## [3,] 0.5416667 -4.166667e-02 -0.3333333
## 
## 
## Running the matrix m through the solving function again, retrieving cache.
## 
## > cacheSolve(m)
## retrieving cached data...
## [,1]          [,2]       [,3]
## [1,] 0.2916667  2.083333e-01 -0.3333333
## [2,] 6.0000000 -8.538092e-18 -6.0000000
## [3,] 0.5416667 -4.166667e-02 -0.3333333
## 
##  Looks like it worked!

