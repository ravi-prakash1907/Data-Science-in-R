above10 <- function(x){
  use <- x > 10
  
  x[use]
}

above <- function(x, n = 10){
  use <- x > n
  
  x[use]
}

x = 3:15
above(x, 8)