setwd("~/Coursera/Data Science/datasciencecoursera/Johns Hopkins University/R Programming/week3/")

library(datasets)
library(stringr)
data(iris)

#  1
library(data.table)
iris_dt <- as.data.table(iris)
iris_dt[Species == "virginica",round(mean(Sepal.Length)) ]


#  2
apply(iris[, 1:4], 2, mean)


#  3
library(datasets)
data(mtcars)

?mtcars

with(mtcars, tapply(mpg, cyl, mean))

#  4
mtcars_dt <- as.data.table(mtcars)
mtcars_dt <- mtcars_dt[,  .(mean_cols = mean(hp)), by = cyl]
round(abs(mtcars_dt[cyl == 4, mean_cols] - mtcars_dt[cyl == 8, mean_cols]))

#  5
debug(ls)
