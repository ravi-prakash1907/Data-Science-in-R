# setting the working directory
setwd("/home/ravi/Coursera/Data Science/datasciencecoursera/Johns Hopkins University/R Programming")

# loading provided data frames
df <- read.csv("hw1_data.csv")

###########   Solutions     ############

colnames(df)  # Q11

head(df, 2)   # Q12

nrow(df)      # Q13

tail(df, 2)   # Q14

df[47, "Ozone"]   # Q15


val = 0
for(i in df$Ozone) {
  if (is.na(i) == T) 
    val = val+1
}
val           # Q16


val = 0
temp = data.frame(df$Ozone)
for(i in 1:nrow(temp)) {
  if (is.na(temp[i,1]) == T) {
    val = val+1
    temp[i,1] = 0
  }
}
val = nrow(temp) - val
mean = sum(temp$df.Ozone)/val
mean                              # Q17


temp = subset(airquality, Temp > 90, select = c(colnames(df)))
temp = subset(temp, Ozone > 31, select = c(colnames(df)))
temp
max(temp$Ozone)
mean(temp$Solar.R)                   # Q18


temp = df[-c(1:nrow(df)),"Temp"]
for (i in 1:nrow(df)) {
  if(df[i,"Month"] == 6)
    temp = rbind(temp, df[i,"Temp"])
}
mean(temp[,1])  # Q19


temp = df[-c(1:nrow(df))]
for (i in 1:nrow(df)) {
  if(df[i,"Month"] == 5) {
    df[i,"Ozone"] = ifelse(is.na(df[i,"Ozone"]), 0, df[i,"Ozone"])
    temp = rbind(temp, df[i,"Ozone"])
  }
}
max(temp[,1])   # Q20













