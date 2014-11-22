## This script contains two functions for caching and solving a matrix
## Please Note: there is no check whether the matrix is solvable...
## ..it will go pear-shaped with matrix(1:9,3,3)! So use matrix(1:4,2,2) instead!

## for testcases: https://class.coursera.org/rprog-009/forum/thread?thread_id=164 

## The function makeCacheMatrix creates a list containing a function to
## set the value of the matrix ("set")
## get the value of the matrix ("get")
## set the value of the mean ("setsolve")
## get the value of the mean ("getsolve")

makeCacheMatrix <- function(x = numeric()) {
        m <- NULL
        set <- function(y) {
                x <<- y  # variable x in the containing environment (global in this case) is updated to be y
                # since no local variable 'y' exists within function R searches the containing environments
                m <<- NULL
        }
        get <- function() x
        setsolve <- function(solve) m <<- solve ## put solved matrix in m
        getsolve <- function() m
        list(set = set, get = get,
             setsolve = setsolve,  
             getsolve = getsolve)
}

## The function cacheSolve solves the matrix from makeCacheMatrix.
## It only solves the matrix if it hasn't been cached beforehand.

cacheSolve <- function(x, ...) {
        m <- x$getsolve()
        if(!is.null(m)) {     ## check wheter a matrix already is cached
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setsolve(m)
        m
}