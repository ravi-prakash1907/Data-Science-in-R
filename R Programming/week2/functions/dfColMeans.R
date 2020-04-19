colmean <- function(y) {
  nc <- ncol(y)
  
  means <- numeric(nc)
  for (i in 1:nc) {
    means[i] = mean(y[, i])
  }
  means
}

colmean2 <- function(y, removeNA = T) {
  nc <- ncol(y)
  
  means <- numeric(nc)
  for (i in 1:nc) {
    means[i] = mean(y[, i])
  }
  means
}

colmean2(airquality)