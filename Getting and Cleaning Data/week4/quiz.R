# RegEx

# setting the working dir
newDir = "~/Documents/Data-Science-in-R/Getting and Cleaning Data/week4"
setwd(newDir)

###################################

# Question 1
# 
# The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
#   
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv
# 
# and load the data into R. The code book, describing the variable names is here:
#   
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf
# 
# Apply strsplit() to split all the names of the data frame on the characters “wgtp”.
# 
# What is the value of the 123 element of the resulting list?

Q1Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
Q1 <- read.csv(Q1Url)
View(Q1)

Q1_colnames <- names(Q1)
strsplit(Q1_colnames, "^wgtp")[[123]]   # SOLUTION


###################################

# Question 2
# 
# Load the Gross Domestic Product data for the 190 ranked countries in this data set:
#   
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv
# 
# Remove the commas from the GDP numbers in millions of dollars and average them. What is the average?
#   
#   Original data sources:
#   
#   http://data.worldbank.org/data-catalog/GDP-ranking-table

Q2_Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
Q2_Path <- "assgData/Q3GDP.csv"
download.file(Q2_Url, Q2_Path, method = "curl")

Q2_File <- read.csv(Q2_Path, nrow = 190, skip = 4)
Q2_File <- Q2_File[,c(1, 2, 4, 5)]
colnames(Q2_File) <- c("CountryCode", "Rank", "Country", "Total")
View(Q2_File)

Q2_File$Total <- as.integer(gsub(",", "", Q2_File$Total))
mean(Q2_File$Total, na.rm = T)  # SOLUTION


#############################



# Question 3
# 
# In the data set from Question 2 what is a regular expression that would allow you to count the number of countries whose name begins with “United”? Assume that the variable with the country names in it is named countryNames. How many countries begin with United?

Q2_File$Country <- as.character(Q2_File$Country)
Q2_File$Country[99] <- "Côte d’Ivoire"
Q2_File$Country[186] <- "São Tomé and Príncipe"

Q2_File$Country[grep("^United", Q2_File$Country)]

#############################

# Question 4
# 
# Load the Gross Domestic Product data for the 190 ranked countries in this data set:
#   
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv
# 
# Load the educational data from this data set:
#   
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv
# 
# Match the data based on the country shortcode. Of the countries for which the end of the fiscal year is available, how many end in June?
#   
#   Original data sources:
#   
#   http://data.worldbank.org/data-catalog/GDP-ranking-table
# 
# http://data.worldbank.org/data-catalog/ed-stats

library(data.table)

Q4GDP_Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
Q4GDP_Path <- "../week3/assgData/Q3GDP.csv"
Q4Edu_Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
Q4Edu_Path <- "../week3/assgData/Q3Edu.csv"

download.file(Q4GDP_Url, Q4GDP_Path, method = "curl")
download.file(Q4Edu_Url, Q4Edu_Path, method = "curl")


Q4GDP <- fread(Q4GDP_Path, skip = 5, nrows = 190, select = c(1, 2, 4, 5), col.names = c("CountryCode", "Rank", "Economy", "Total"))
Q4Edu <- fread(Q4Edu_Path)
Q4_Merge <- merge(Q4GDP, Q4Edu, by = 'CountryCode')
View(Q4_Merge)

FiscalJune <- grep("Fiscal year end: June", Q4_Merge$`Special Notes`)

# nrow() works same
NROW(FiscalJune)  # SOLUTION


################################


# Question 5
# 
# You can use the quantmod (http://www.quantmod.com/) package to get historical stock prices for publicly traded companies on the NASDAQ and NYSE. Use the following code to download data on Amazon’s stock price and get the times the data was sampled.
# 
# library(quantmod)
# amzn = getSymbols("AMZN", auto.assign=FALSE)
# sampleTimes = index(amzn)
# 
# How many values were collected in 2012? How many values were collected on Mondays in 2012?

library(quantmod)
library(lubridate)
amzn = getSymbols("AMZN", auto.assign=FALSE)
sampleTimes = index(amzn)

amzn2012 <- sampleTimes[grep("^2012", sampleTimes)]
nrow(amzn2012)

nrow(amzn2012[weekdays(amzn2012) == "Monday"])

















