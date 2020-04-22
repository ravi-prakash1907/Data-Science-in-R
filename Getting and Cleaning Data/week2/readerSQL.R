# reading the data

currDir = getwd()
newDir = paste(currDir, "", sep = "/Getting and Cleaning Data/week2")
setwd(newDir)


################################################
#     Reading from MySQL Server
################################################

## Library
library(RMySQL)

# connecting to server
ucscDb <- dbConnect(MySQL(), user="genome", host="genome-mysql.cse.ucsc.edu")

# executing query and disconnecting
result <- dbGetQuery(ucscDb, "show databases;"); dbDisconnect(ucscDb);

result # list of the databases

#----------------------------------#

# connecting to specifically 1 database     ---->     hg19
hg19 <- dbConnect(MySQL(), user="genome", db="hg19", host="genome-mysql.cse.ucsc.edu")
allTables = dbListTables(hg19)

# HG19  :   It's a particular build of the Human Gemone

# about the available tables
length(allTables)
class(allTables)
head(allTables)
allTables[11:15]

# finding the Fields in a table of the current database
dbListFields(hg19, "affyCytoScan")
dbListFields(hg19, "affyU133Plus2")

# dimentions
dbGetQuery(hg19, "select count(*) from affyCytoScan")
dbGetQuery(hg19, "select count(*) from affyU133Plus2")


# reading a TABLE
affyData <- dbReadTable(hg19, "affyU133Plus2")
class(affyData)
head(affyData)

##################################

# subset data
query <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")
affyMis <- fetch(query, n=10); quantile(affyMis$misMatch) # still reading and will return other o/p when run again

affyMisSmall <- fetch(query, n=10); dbClearResult(query)  # clears query and goes away from server

dim(affyMisSmall) # has really fetched only top 10 records


##################################

# closing the connection
dbDisconnect(hg19)







