# scopin rules

lm <- function(x) {
  x * x
}

# not uses linear model function of stats package
lm(5)


# ------>
# the function is first search in this globalEnvt, then in package:stats.... all the way to pkg:base(at last) 


# uncomment following to see the searching sequence of searcing sequence 
#search() # this list is configurable as per the user as well

########################


# lexical or static scoping   ~    dynamic scoping of other langs
fun <- function(x, y) {
  x^y + y/z         #  z is the free variable 
}

# here lexical scoping is how val of Z assigned
# --------> if anything like Z is there in envt, it'll be applied

#  ~ to the Global Variables used in the languages like C++ etc..

# matched in -->
#### ENVIRNMENT:
    # GLOBAL Envt.. (workspace)
        # Parent etc...

make.pow <- function(n){
  pow <- function(x) {
    x^n
  }
  
  pow
}


square <- make.pow(2)  # returns a function square
cube <- make.pow(3)    # returns a function cube
cube(5)









