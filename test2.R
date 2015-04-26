makeCacheMatrix <- function (x = matrix()) { 
         m <- NULL
         set <- function(y) {
                 x <<- y
                 m <<- NULL
         }
         get <- function() x
         setMatrix <- function(m) {
                 m <<- solve(x)
         }
         getMatrix <- function() m 
         list(set=set, get=get, setMatrix=setMatrix, 
              getMatrix=getMatrix)
return(m) 
}

# return(x)
# 
# a<-makeCacheMatrix(x)
# m<-a$setMatrix
# 
# return(m)
# 
# 
# cacheSolve <- function(m) {
# #         m <- a$getMatrix() #retrieve m from previous function (cache); 
# #         #if assigned to larger environment, it resets m to null?
# #         if(!is.null(m)) {  #if it exists, send message and then return m
# #                 message("getting cached data")
# #                 return(m)
# #         }
# # }
