## visit:  r-bloggers.com/?s=Web+Scraping

# setting the working dir
newDir = "~/Documents/Data-Science-in-R/Getting and Cleaning Data/week2"
setwd(newDir)

##############################################

########    METHOD 1    ##########

# Not so formatted output

# Connection Esteblishment
con = url("https://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")

# Reading the HTML
htmlCode = readLines(con)
close(con)

# viewing whats read
htmlCode


#############################################

########    METHOD 2    ##########
# Using XML

library(XML)
url = "https://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"
url = "https://google.com/"
html = htmlTreeParse(url, useInternalNodes = T)

# Viewing title content
xpathSApply(html, "//title", xmlValue)

# looking any particular element
xpathSApply(html, "//td[@id='cidet by']", xmlValue)



#############################################
###############    BEST    ##################
#############################################

#######         Method 3        #######


# using 'httr' package

library(httr)
url = "https://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"

html2 = GET(url)
content2 = content(html2, as='text')
parsedHTML = htmlParse(content2, asText = T)

xpathSApply(parsedHTML, "//title", xmlValue)


#############################################

# ACCESSING WEBSITE WITH USERNAME AND PASSWORD
# can save the authentication in cookies


# without authentication
pg = GET("https://httpbin.org/basic-auth/user/passwd")
pg

# with authentication
pg = GET("https://httpbin.org/basic-auth/user/passwd",
         authenticate("user", "passwd")
     )
pg

# components involved
names(pg)

# further :   'content()' function canbe used to extract the content


#################################

# using HANDLES :  cookies used that can be helpful

google = handle("https://google.com")

pg1 = GET(handle = google, path="/")
pg2 = GET(handle = google, path="search")





