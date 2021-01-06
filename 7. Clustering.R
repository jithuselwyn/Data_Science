#  Heirarchical Clustering

crimes<-read.csv(file.choose())
View(crimes)
attach(crimes)

summary(crimes)
boxplot(Rape,horizontal=T)
boxplot(Assault,horizontal=T)
boxplot(Murder,horizontal=T)
boxplot(UrbanPop,horizontal=T)


std_crimes<-scale(crimes[,-c(1)])
View(std_crimes)

distance<-dist(std_crimes,method = "euclidean")
fit<-hclust(distance,method = "complete")

plot(fit,hang = -1)

rect.hclust(fit,k=4,border = "blue")
group<-cutree(fit,k=4)

crimes["Group"]<-group

?aggregate()
aggregate(crimes[,-1],by=list(crimes$Group),mean)

#  Inference -->  group 2 has highest crime rate then 1 then 3 and last 4

#  K-means 

wssplot<-function(data,kmax=10){
  wss<-(nrow(data)-1)*sum(apply(data,2,var))
  for(i in 2:kmax) wss[i]=sum(kmeans(data,centers = i)$withinss)
  plot(1:kmax,wss,type = "b")
}

twss <- NULL
twssplot<-function(standardized_data,kmax=15){
  for (i in 2:kmax){
    twss <- c(twss,kmeans(standardized_data,i)$tot.withinss)
  }
  plot(2:kmax,twss,type="o")
}

wssplot(std_crimes,kmax=10)
twssplot(std_crimes,kmax=15)

km<-kmeans(std_crimes,3)
str(km)
crimes["groups"]<-km$cluster

aggregate(crimes[,-1],by=list(crimes$groups),mean)

#Inference --> group 2 has highest crime rate then group 1, then 3







airlines<-read.csv(file.choose())
View(airlines)

summary(airlines)

std_airlines<-data.frame(scale(airlines[,-1]))
View(std_airlines)
attach(std_airlines)

boxplot(Balance,horizontal = T)
boxplot(Qual_miles,horizontal = T)
boxplot(Bonus_miles,horizontal = T)
boxplot(Flight_miles_12mo,horizontal = T)
boxplot(Days_since_enroll,horizontal = T)

distance<-dist(std_airlines,method = "euclidean")

fit<-hclust(distance,method = "complete")
plot(fit,hang=-1)                        # not clearly visible due to high number of records
rect.hclust(fit,k=5,border = "red")

groups<-cutree(fit,k=3)

airlines["Groups"]<-groups

aggregate(airlines[,-1],by=list(airlines$Groups),mean)

#  K-Means 

wssplot<-function(data,kmax){
  wss= (nrow(data)-1)*sum(apply(data,2,var))
  for(i in 2:kmax) wss[i]=sum(kmeans(data,centers=i)$withinss)
  plot(1:kmax,wss,type="b")
}

wssplot(std_airlines,20)  # max slope at 2,3,6,7 clusters

install.packages("kselection")
library("kselection")
install.packages("doParallel")
library("doParallel")

registerDoParallel(cores=4)
k <- kselection(airlines[,-1], parallel = TRUE, k_threshold = 0.9, max_centers=12)
k  # f(k) finds 2 clusters

fit<-kmeans(std_airlines,3)
str(fit)
group<-fit$cluster

airlines["Group"]<-group

aggregate(airlines[,-c(1,13)],by=list(airlines$Group),mean)

#Inference -> group 1 are most frequent flyers; group 3 least flyers.