# reading data from different sources

# Working dir
newDir = "~/Documents/Data-Science-in-R/Getting and Cleaning Data/week2"
setwd(newDir)

## HDF5  :   can be a collection or group of data-frames
# datasets are multidimentional array of elements along with matadata
# hdfgroup.org


############################

# Installing Bioconductor
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install()


# r hdf5 pkg is installed from bioconductor
source("https://bioconductor.org/biocLite.R")
biocLite("rhdf5")

############################


# library
library(rhdf5)

# Creatinf an hdf5 file
created = h5createFile("example.h5")
created



######################################################

# Writing the data


# groups in hdf5 file
created = h5createGroup("example.h5", "foo")
created = h5createGroup("example.h5", "baa")
created = h5createGroup("example.h5", "foo/foobaa")

## kinda multidimentional arrays
h5ls("example.h5")


# wrinting to groups
A = matrix(1:10, nr=5, nc=2)
h5write(A, "example.h5", "foo/A") # writing matrix

B = array(seq(0.1, 2.0, by=0.1), dim=c(5,2,2))
attr(A, "scale") <- "liters" # adding attributes
h5write(B, "example.h5", "foo/foobaa/B") # writing attr

h5ls("example.h5")

#  these groups are kinda building blocks for a dataset


# writing: a dataset directly
df = data.frame(
        sno = c(1:5),
        name = c('a', 'b', 'c', 'd', 'e')
     )
h5write(df, "example.h5", "df")     # writing a complete data frame

h5ls("example.h5")


######################################################

# Reading the datasets

readA = h5read("example.h5", "foo/A")
readB = h5read("example.h5", "foo/foobaa/B")
readdf = h5read("example.h5", "df")

readA



######################################################

# Reading and Writing chunks or parts

h5write(c(12, 13, 14), "example.h5", "foo/A", index=list(1:3, 1))  # writing at specified place in the selected dataset (i.e. group) using index
hrread("example.h5", "foo/A")


