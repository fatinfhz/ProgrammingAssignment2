## Programming Assignment 2 
## Fatin Fatihah Zahari

## The following functions calculate the inverse of a matrix and saves it
## to the cache such that the next time the user attempts to calculate the
## matrix inverse, the previously saved value is returned instead of
## repeating the calculation.

## This function creates a special "matrix" object, which is really a list 
## containing a function to
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the inverse
## 4. get the value of the inverse

## Create a matrix object x and some associated sub-functions/methods

makeCacheMatrix <- function(x = matrix()) 
{
  
  
  ##Define the cache 'invcache'
  invcache   <- NULL
  set <- function(y) 
  {
    ##Assign the input matrix y to the variable x in the parent environment
    x <<- y
    
    ##Re-initialize 'invcache' in the parent environment to null 
    invcache <<- NULL
  
  }
  get <- function() x ## return the matrix x
  
  ##Set the cache invcache' equalto the inverse of the matrix x 
  setinverse <- function(inverse) invcache <<- inverse
  
  ##Return the cached inverse of x
  getinverse <- function() invcache
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## The following function calculates the inverse of the special "matrix" created
## with the above function. However, it first checks to see if the inverse
## has already been caclulated. If so, it 'get's the inverse from the cache
## and skips the computation. Otherwise, it calculates the matrix inverse
## and sets the value of the inverse in the cache via the 'setinverse' function.

cacheSolve <- function(x, ...) 
  {
        ## Return a matrix that is the inverse of 'x'
         invcache <- x$getinverse()
         if(!is.null(invcache)) {
         message("getting cached data.")
         return(invcache)
  }
  data <- x$get()
  invcache <- solve(data)
  x$setinverse(invcache)
  invcache
}

