## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = numeric()) {
        m <- NULL
        set <- function(y) {
                x <<- y  # variable x in the containing environment (global in this case) is updated to be y
                # since no local variable 'y' exists within function R searches the containing environments
                m <<- NULL
        }
        get <- function() x
        setsolve <- function(solve) m <<- solve
        getsolve <- function() m
        list(set = set, get = get,
             setsolve = setsolve,  ##
             getsolve = getsolve)
}

## Please Note: there is no check whether the matrix is solvable...
## ..it will crash with matrix(1:9,3,3)! So use matrix(1:4,2,2) instead!

## use for testcases: https://class.coursera.org/rprog-009/forum/thread?thread_id=164

cacheSolve <- function(x, ...) {
        m <- x$getsolve()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setsolve(m)
        m
}