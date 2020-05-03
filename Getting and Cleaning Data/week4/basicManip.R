### Text manipulation

# setting the working dir
newDir = "~/Documents/Data-Science-in-R/Getting and Cleaning Data/week4"
setwd(newDir)

######################

library(stringr)

######################

cameraDataCSV <- read.table("../week1/downloaded/cameras.csv", sep = ",", header = TRUE)
names(cameraDataCSV)  # colnames() can also be used

### Converting to lowercase
tolower(names(cameraDataCSV))   # simalarlly toupper()


# spliting the strings
splitNum = strsplit(names(cameraDataCSV), "\\.")
splitNum[[5]]
splitNum[[6]]   # location is splitted now   --->    "Location" "1"  


splitNum[[6]][1]  # first indexed val

#### selecting only first element of all the columns ---->  obvisly now  splitted into list
firstElement <- function(x){x[1]}
sapply(splitNum, firstElement)


############################

sub("_", " ", "I_am_Ravi.")        ## substituting '_' with ' ' ----->  only first replaced
gsub("_", " ", "I_am_Ravi.")       ## replaced all '_'

############################

### DOWNLOAD dataset

# CPVID19.India = "https://raw.githubusercontent.com/ravi-prakash1907/COVID-19-India/master/india-today/cleaned/statewise_ready.csv"
# download.file(CPVID19.India, destfile = "./indiaData.csv")

indiaData = read.csv("indiaData.csv")

###########################

grep("Mizoram", indiaData$State)  #  Index of 'Mizoram'

table(grepl("Mizoram", indiaData$State))   # true for num of rows hold 'Mizoram'

data <- indiaData[!grepl("Mizoram", indiaData$State),]  # extracting all states except Miz..
data


grep("Mizoram", indiaData$State, value = T)  #  printing actual string including 'Mizoram' instead of Index 
length(grep("Mizoram", indiaData$State))   # nos. of occurances on Miz..

###########################


nchar("Ravi Prakash") # str len
substr("Ravi Prakash", 1, 4) # extract 'Ravi'

paste("Ravi", "Prakash", sep="-")    # by default sep is " "











