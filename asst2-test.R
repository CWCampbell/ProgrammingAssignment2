# This function (makeCacheMatrix) creates a special "matrix" object that can 
# cache its inverse.

#x<-matrix(1:4,2,2) #data
#z<-matrix(3:6,2,2) #data

makeCacheMatrix <- function(x = matrix()){ #function takes matrix as input
        m <- NULL #setting inverse variable to null
        #assign("m", NULL, envir= .GlobalEnv) 
        set <- function(y) { #naming and assigning subfunction; 
                x <<- y #turns new input into live input
                m <<- NULL #resets m to null, one level up (parent environment)
        } 
        get <- function() x # naming and assigning subfunction: retrieves current data matrix
        setMatrix <- function(x) {  # naming and assigning subfunction: takes current data matrix and calculates its inverse
                m <-solve(x) # assigns name m to inverse
                } 
        getMatrix <- function() m  #naming and assigning subfunction: retrieves inverse
        list(set=set, get=get, setMatrix=setMatrix, #list items (names of subfunctions) for function 
             getMatrix=getMatrix)
       
}
 
#A<-makeCacheMatrix() #instantiate MCM function
#m<<-A$setMatrix(x) # subfunction (with this instantiation) - generates inverse and assigns it to variable

# ## cacheSolve computes the inverse of the special "matrix" returned by makeCacheMatrix. 
# ## If the inverse has already been calculated (and the matrix has not changed), 
# ## then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x=matrix(),...){ #function takes matrix as input
                        if(!is.null(m)){ #check to see if existing m is null; if not...
                        message("getting cached data") #throw message saying "getting cached data"
                        print(m) # print cached inverse
                        }
                        else{ #if existing m is indeed null...
                        m<<-solve(x)    #solve the matrix and put the resulting inverse in a variable named m    
                        print(m)       #print new inverse 
                        }
      }

