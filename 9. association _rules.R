##books##
library(arules)
install.packages('arulesViz',dependencies=TRUE, repos='http://cran.rstudio.com')
library(arulesViz)
book <- read.csv(file.choose())
View(book)

barplot(sapply(book,sum),col = 1:10)

rules <- apriori(as.matrix(book),parameter = list(support=0.08,confidence=0.05,minlen=4))  
install.packages('tm',dependencies=TRUE, repos='http://cran.rstudio.com')
library(tm)                 

detach(package:tm, unload=TRUE)
inspect(rules)
plot(rules)

rules_conf <- sort(rules,by="confidence") 
inspect(rules_conf)

rules_lift <- sort(rules,by="lift")
inspect(rules_lift)

plot(rules,method = "graph") 



###movies###

movies <- read.csv(file.choose())

movies1 <- movies[6:15]
View(movies1)
barplot(sapply(movies1,sum),col=1:10)     

rules <- apriori(as.matrix(movies1),parameter = list(support=0.005,confidence=0.08,minlen=4)) 
library(tm)                 

detach(package:tm, unload=TRUE)
inspect(rules)
plot(rules)

rules_conf <- sort(rules,by="confidence") 
inspect(rules_conf)

rules_lift <- sort(rules,by="lift") 
inspect(rules_lift)

plot(rules,method = "graph") 



 ##### grocries###

groceries<-read.transactions(file.choose(),format="basket") 
inspect(groceries[1:10])
# count of each item from all the transactions 
itemFrequencyPlot(groceries,topN=20)
groceries_rules<-apriori(groceries,parameter = list(support = 0.004,confidence = 0.05,minlen=2))
inspect(groceries_rules)
plot(groceries_rules,method = "scatterplot")
plot(groceries_rules,method = "grouped")
plot(groceries_rules,method = "graph")
