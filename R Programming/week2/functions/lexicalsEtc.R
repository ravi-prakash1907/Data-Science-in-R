# basics
f <- function(a, b) {
  a^2
}

f2 <- function(a, b) {
  a^2
  b
}

# no error due to Lazy evaluation
f(2)

##  LAZY EVALUATION:  args are checked when are required in the function

# here is the error
f2(2)




#################

# ... ---> var no. of args
myplot <- function(x, y, type = '1', ...) {
  plot(x, y, type = type, ...)
}

#mean
UseMethod("mean")