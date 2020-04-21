currDir = getwd()
newDir = paste(currDir, "", sep = "/Getting and Cleaning Data/week1")
setwd(newDir)

## Downloading Data

# dir to store downloaded data
if(!file.exists("downloaded")){
  dir.create("downloaded")
}

fileCSV = "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"   # csv
fileXCL = "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"  # excel
fileXML = "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xml?accessType=DOWNLOAD"   # xml
fileJSON = "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.json?accessType=DOWNLOAD" # json

download.file(fileCSV, destfile = "./downloaded/cameras.csv", method = "curl")
download.file(fileXCL, destfile = "./downloaded/cameras.xlsx", method = "curl")
download.file(fileXML, destfile = "./downloaded/cameras.xml", method = "curl")
download.file(fileJSON, destfile = "./downloaded/cameras.json", method = "curl")

###############################

list.files("./downloaded")

dateDownloaded <- date()
dateDownloaded

