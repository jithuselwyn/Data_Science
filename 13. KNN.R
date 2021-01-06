 #### Zoo####

zoo <- read.csv(file.choose())
View(zoo)
str(zoo) 
attach(zoo)

zoo$type <- as.factor(type)
zoo <- zoo[,-1] 
View(zoo)

zoo_inputs <- zoo[,-c(17)] 
zoo_inputs

norm <- function(x){ 
  return((x-min(x))/(max(x)-min(x)))
}

zoo_inputs <- as.data.frame(lapply(zoo_inputs, norm)) 
View(zoo_inputs)
summary(zoo_inputs)

zoo$type <- factor(zoo$type, levels = c("1","2","3","4","5","6","7"),
                   labels = c("type1","type2","type3","type4","type5","type6","type7")) 


zoo_train <- zoo_inputs[1:70,] 
zoo_test <- zoo_inputs[71:101,]

zoo_train_lbs <- zoo[1:70,17] 
zoo_test_lbs <- zoo[71:101,17]


sqrt_n = ceiling(round(sqrt(nrow(zoo_train)))) 
View(sqrt_n)
library(class)
model_knn <- knn(train = zoo_train,test = zoo_test, cl= zoo_train_lbs,k=sqrt_n) 

library(gmodels)
CrossTable( x =  zoo_test_lbs, y = model_knn) 
table(zoo_test_lbs)



# -- glass --

glass <- read.csv(file.choose()) 
View(glass)
str(glass) 
attach(glass)



glass_inputs <- glass[,-c(10)] 


norm <- function(x){ 
  return((x-min(x))/(max(x)-min(x)))
}

glass_inputs <- as.data.frame(lapply(glass_inputs, norm)) 
View(glass_inputs)
summary(glass_inputs)

glass$Type <- factor(glass$Type, levels = c("1","2","3","4","5","6","7"),
                     labels = c("type1","type2","type3","type4","type5","type6","type7")) 


library(caret)
split=0.70 # Specifing Split Ratio
trainIndex <- createDataPartition(glass$Type, p=split, list=FALSE) 

glass_train <- glass_inputs[ trainIndex,] 
glass_test <- glass_inputs[-trainIndex,] 

glass_train_lbs <- glass[ trainIndex,10] 
glass_test_lbs <- glass[-trainIndex,10] 



table(glass_train_lbs)
table(glass_test_lbs) 

sqrt_n = ceiling(round(sqrt(length(glass_train)))) # Finding optimal K value using square root of the total number of observations

library(class)
model_knn <- knn(train = data.frame(glass_train),test = data.frame(glass_test), cl= glass_train_lbs,k=sqrt_n) # Model Building

library(gmodels)
CrossTable( x =  glass_test_lbs, y = model_knn) # Cross table of predicted values and actual values

