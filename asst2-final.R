# This function (makeCacheMatrix) creates a special "matrix" object that can 
# cache its inverse.

#x<-matrix(1:4,2,2) #data
#z<-matrix(3:6,2,2) #data

#Function takes matrix as input, setting inverse variable to null, assigns m to null in global environment; 
#then names and assigns subfunction. After turning new input into live input, it resets m to null in the parent environment.

makeCacheMatrix <- function(x = matrix()){ 
        m <- NULL 
        set <- function(y) { 
                x <<- y 
                m <<- NULL 
        } 

#Name and assign subfunction to retrieve current data matrix; name and assign subfunction to take current data matrix 
#and calculates its inverse. The value is assigned to the variable m.

        get <- function() x 
        setMatrix <- function(x) {  
                m <-solve(x) 
                } 

#Name and assign subfunction to retrieve inverse; must list items (names of subfunctions) for function 

        getMatrix <- function() m  
        list(set=set, get=get, setMatrix=setMatrix, 
             getMatrix=getMatrix)
       
}
 
#A<-makeCacheMatrix() #instantiate MCM function
#m<<-A$setMatrix(x) # subfunction (with this instantiation) - generates inverse and assigns it to variable

# ## cacheSolve computes the inverse of the special "matrix" returned by makeCacheMatrix. 
# ## If the inverse has already been calculated (and the matrix has not changed), 
# ## then the cachesolve should retrieve the inverse from the cache.




#function takes matrix as input; first check to see if existing m is null; if not, throw message 
#saying "getting cached data" and print cached inverse. If existing m is indeed null, solve the matrix 
#and store the resulting inverse as a variable named m. Then print new inverse. 

cacheSolve <- function(x=matrix(),...){ 
                        if(!is.null(m)){ 
                        message("getting cached data") 
                        print(m) 
                        }
                        else{ 
                        m<<-solve(x)    
                        print(m)       
                        }
      }
