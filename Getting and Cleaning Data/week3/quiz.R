# Quiz: Week-3

# setting the working dir
newDir = "~/Documents/Data-Science-in-R/Getting and Cleaning Data/week3"
setwd(newDir)

###################################

# Question 1
# 
# The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
# 
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv
# 
# and load the data into R. The code book, describing the variable names is here:
#   
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf
# 
# Create a logical vector that identifies the households on greater than 10 acres who sold more than $10,000 worth of agriculture products. Assign that logical vector to the variable agricultureLogical. Apply the which() function like this to identify the rows of the data frame where the logical vector is TRUE.
# 
# which(agricultureLogical)
# 
# What are the first 3 values that result?

Q1Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
Q1 <- read.csv(Q1Url)
View(Q1)

agricultureLogical <- Q1$ACR == 3 & Q1$AGS == 6
which(agricultureLogical)   # SOLUTION


###################################

# Question 2
# 
# Using the jpeg package read in the following picture of your instructor into R
# 
# https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg
# 
# Use the parameter native=TRUE. What are the 30th and 80th quantiles of the resulting data? (some Linux systems may produce an answer 638 different for the 30th quantile)

library(jpeg)

Q2Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
Q2Path = 'assgData/Q2.jpg'
download.file(Q2Url, Q2Path, mode = 'wb')
Q2 <- readJPEG(Q2Path, native = TRUE)

quantile(Q2, probs = c(0.3, 0.8))

# ‘some Linux systems may produce an answer 638 different for the 30th quantile.’
# Mine is Linux, so…

paste(quantile(Q2, probs = 0.3) - 638, quantile(Q2, probs = 0.8))  # SOLUTION


#############################



# Question 3
# 
# Load the Gross Domestic Product data for the 190 ranked countries in this data set:
#   
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv
# 
# Load the educational data from this data set:
#   
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv
# 
# Match the data based on the country shortcode. How many of the IDs match?
#   
#   Sort the data frame in descending order by GDP rank (so United States is last). What is the 13th country in the resulting data frame?
#   
#   Original data sources:
#   
#   http://data.worldbank.org/data-catalog/GDP-ranking-table
# 
# http://data.worldbank.org/data-catalog/ed-stats

library(dplyr)
library(data.table)

Q3GDP_Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
Q3GDP_Path <- "assgData/Q3GDP.csv"
Q3Edu_Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
Q3Edu_Path <- "assgData/Q3Edu.csv"

download.file(Q3GDP_Url, Q3GDP_Path, method = "curl")
download.file(Q3Edu_Url, Q3Edu_Path, method = "curl")

Q3GDP <- fread(Q3GDP_Path, skip = 5, nrows = 190, select = c(1, 2, 4, 5), col.names = c("CountryCode", "Rank", "Economy", "Total"))
Q3Edu <- fread(Q3Edu_Path)

View(Q3GDP)
View(Q3Edu)

Q3_Merge <- merge(Q3GDP, Q3Edu, by = 'CountryCode')
Q3_Merge <- Q3_Merge %>% arrange(desc(Rank))

View(Q3_Merge)

paste(nrow(Q3_Merge), " matches, 13th country is ", Q3_Merge$Economy[13])


#############################

# Question 4
# 
# What is the average GDP ranking for the “High income: OECD” and “High income: nonOECD” group?

Q3_Merge %>% group_by(`Income Group`) %>%
  filter("High income: OECD" %in% `Income Group` | "High income: nonOECD" %in% `Income Group`) %>%
  summarize(Average = mean(Rank, na.rm = T)) %>%
  arrange(desc(`Income Group`))  # SOLUTION


################################


# Question 5
# 
# Cut the GDP ranking into 5 separate quantile groups. Make a table versus Income.Group. How many countries are Lower middle income but among the 38 nations with highest GDP?

Q3_Merge$RankGroups <- cut(Q3_Merge$Rank, breaks = 5)
vs <- table(Q3_Merge$RankGroups, Q3_Merge$`Income Group`)
View(vs)

vs[1, "Lower middle income"]  # SOLUTION















