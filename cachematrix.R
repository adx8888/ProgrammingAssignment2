## Put comments here that give an overall description of what your
## functions do
## Coursera Data Science: R Programming - Week 3 Assignment
## GIthub: adx8888
## June, 20, 2021. Porto Alegre, Brazil
## makeCacheMatrix = This fuction creates a special "matrix" object that can cache its inverse
## cacheSolve = This function computes the inverse of the special "matrix" 

## Write a short comment describing this function


## default argument "matrix"

makeCacheMatrix <- function(x = matrix()) {
  
## initialize the inverse property 
  inv <- NULL
  
  
## define the set function to assign new 
  set <- function(y) {
    
## value of matrix in parent environment
    x <<- y
    
## if there is a new matrix, reset inv to NULL
    inv <<- NULL 
    
## print the matrix
    x
  }
  
## define the get fucntion - returns value of the matrix argument  
  get <- function() x    
  
## assigns value of inv in parent environment
  setinverse <- function(inverse) inv <<- inverse
  
## gets the value of inv where called
  getinverse <- function() inv


## Return a list of the methods
list(set = set, get = get, 
     setinverse = setinverse, 
     getinverse = getinverse)    
}
  

## Write a short comment describing this function
  
## If the inverse has already been calculated (and the matrix has not changed),
## then cacheSolve will retrieve the inverse from the cache

cacheSolve <- function(x, ...) {

## Return a matrix that is the inverse of 'x'
  
  inv <- x$getInverse()
  
  
## Just return the inverse if its already set
  if(!is.null(inv)){
    message("getting cached data")
    return(inv)
  }

## Get the matrix from our object
  
  dat <- x$get()
  
## Calculate the inverse using matrix multiplication
  
  inv <- solve(dat,...)
  
## Set the inverse to the object
  
  x$setInverse(inv)
  
## Print matrix 
  inv
}
