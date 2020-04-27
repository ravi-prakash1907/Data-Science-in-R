## using Application Programming Interfaces of twitter - Twitter API

## Getting the secret keys and tockens

# reading tockens and key holder file
APIdata = read.csv("../../secrets.csv")

# storing data
yourConsumerKey = as.character(APIdata$API.key[1])
yourConsumerSecret = as.character(APIdata$API.secret.key[1])
yourToken = as.character(APIdata$Access.token[1])
yourTokenSecret = as.character(APIdata$Access.token.secret[1])


#################

library(httr)
library(jsonlite)


## authenticating
myapp = oauth_app("twitter",
                  key = yourConsumerKey,
                  secret = yourConsumerSecret
        )
sign = sign_oauth1.0(
                  myapp,
                  token = yourToken,
                  token_secret = yourTokenSecret
       )


## getting the data returned by twitter API (JSON)

# url format:  "https://<API url>/<API's version>/<required content>/<parent data holder>"
homeTL = GET("https://api.twitter.com/1.1/statuses/home_timeline.json", sign)

################################

# extracion of recieved JSON data

json1 = content(homeTL)
json2 = fromJSON(toJSON(json1))

json2[1, 1:4]


















