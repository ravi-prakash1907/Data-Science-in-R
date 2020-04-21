currDir = getwd()
newDir = paste(currDir, "", sep = "/Getting and Cleaning Data/week1")
setwd(newDir)

# library
library(XML)
library(jsonlite)


## reading data
#cameraDataCSV <- read.csv("downloaded/cameras.csv")
cameraDataCSV <- read.table("downloaded/cameras.csv", sep = ",", header = TRUE)

c = 2:3
r = 1:4
cameraDataXCL <- read.xlsx("downloaded/cameras.xlsx", sheetIndex = "1", header = TRUE) # colIndex=c, rowIndex=r

# viewing
head(cameraDataCSV)

head(cameraDataXCL)



###############################
# JSON

cameraDataJSON <- fromJSON("https://api.github.com/users/ravi-prakash1907/repos")

names(cameraDataJSON)
names(cameraDataJSON$owner)
names(cameraDataJSON$owner$login)
#head(cameraDataJSON)

########################################

# converting to JSON
myjson <- toJSON(iris, pretty = T)
cat(myjson)





###############################
# XML
URL = "downloaded/simple.xml" 
#"http://www.w3schools.com/xml/simple.xml"  # this is used in the main lecture

#URL = "downloaded/cameras.xml"

cameraDataXML <- xmlTreeParse(URL, useInternal=TRUE)

rootNode <- xmlRoot(cameraDataXML) # FINDSthe root node of XML doc
xmlName(rootNode) # prints the root
#rootNode <- xmlRoot(rootNode) # going one more level down (for camera.xml only)

# prints the names of nodes next in the root
names(rootNode) # return as many time as ever inter nodes are

rootNode[[1]] # whole first instance of first internal node

rootNode[[1]][[1]]


######################
#rootNode2 = rootNode[[1]][[1]] # for camera.xml
 
# xmlSApply()    :      it returns the actual value of that node i.e. inside the XML tag
#xmlSApply(rootNode2, xmlValue)
xmlSApply(rootNode, xmlValue)

## Using XPath
#xpathSApply(rootNode, "/crossstreet", xmlValue)
xpathSApply(rootNode, "//name", xmlValue)

xpathSApply(rootNode, "//price", xmlValue)




###################################
###################################



# XML of any random page source code
URL = "http://espn.go.com/nfl/team/_/name/baltimore-ravens"
doc <- htmlTreeParse(URL, useInternal = TRUE)

# accessing list items with specified class name
score <- xpathApply(doc, "//li@class='score'", xmlValue)
teams <- xpathApply(doc, "//li@class='team-name'", xmlValue)

teams














