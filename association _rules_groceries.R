groceries<-read.csv(file.choose())
View(groceries)

groceries[]<-lapply(groceries,as.character)

paste_fun <- function(i){
  return (paste(as.character(i),collapse=" "))
}
groceries["combination"] <- apply(groceries,1,paste_fun)

library(tm)
x <- Corpus(VectorSource(groceries$combination))
x <- tm_map(x,stripWhitespace)
dtm0 <- t(TermDocumentMatrix(x))
groceries_dtm <- data.frame(as.matrix(dtm0))
View(groceries_dtm)

detach(package:tm, unload = TRUE)
library("arules")
library("arulesViz")

rules_groceries<-apriori(as.matrix(groceries_dtm),parameter= list(support=0.01,confidence=0.5,minlen=2))
inspect(rules_groceries)
rules_sorted<-sort(rules_groceries,by="lift")
inspect(rules_sorted[1:10])
# people who buy {plants} are highly likely to buy {pot}  lift ratio=89.97 confidence=1 given support>0.01

rules_groceries<-apriori(as.matrix(groceries_dtm),parameter = list(support = 0.02,confidence = 1,minlen=2))
rules_sorted<-sort(rules_groceries,by="lift")
inspect(rules_sorted[1:10])
# people who buy {articles} are highly likely to buy {hygiene}  lift ratio=47.20 confidence=1 given support>0.02

rules_groceries<-apriori(as.matrix(groceries_dtm),parameter = list(support = 0.02,confidence = 1,minlen=3))
rules_sorted<-sort(rules_groceries,by="lift")
inspect(rules_sorted[1:10])
# people who buy {long,product} are highly likely to buy {life}  lift ratio=41.56 confidence=1 given support>0.02

plot(rules_sorted)
plot(rules_sorted,method = "grouped")
plot(rules_sorted,method = "graph")
