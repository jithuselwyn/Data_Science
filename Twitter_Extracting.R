install.packages("twitteR")
library("twitteR")

install.packages("ROAuth")
library("ROAuth")

install.packages("base64enc")
library(base64enc)

install.packages("httpuv")
library(httpuv)
### https://apps.twitter.com/

cred <- OAuthFactory$new(consumerKey='fzbGLYrkRhFfvAEbpXZYby8rY',
                         consumerSecret='hcgXlwKaVvQ0mPRJiVtZsowdltj9c0NluVQNsYzJikEAWIaP3J',
                         requestURL='https://api.twitter.com/oauth/request_token',
                         accessURL='https://api.twitter.com/oauth/access_token',
                         authURL='https://api.twitter.com/oauth/authorize')
setup_twitter_oauth("fzbGLYrkRhFfvAEbpXZYby8rY", 
                    "hcgXlwKaVvQ0mPRJiVtZsowdltj9c0NluVQNsYzJikEAWIaP3J",
                    "524982315-jLAoDyex2Wahmzcoqc3sfCwTXVbj5S6tx3SeblP9", # Access token
                    "YkwU9VR24df2nITOC1lrW5IpiIj9BQ16HiKT5RjEUtMwJ")  # Access token secret key

Tweets <- userTimeline('narendramodi', n = 1000)

TweetsDF <- twListToDF(Tweets)
write.csv(TweetsDF, "Tweets_sarf.csv")

###Search with a key word

word_tweets<- searchTwitter('corona', n=100, lang="en", resultType = "recent")
TweetsDF <- twListToDF(word_tweets)


