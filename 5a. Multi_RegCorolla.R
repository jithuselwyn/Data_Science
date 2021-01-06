
toyota_r<-ToyotaCorolla
#toyota_r<-Toyota
#check if na values are there
colSums(is.na(toyota_r))
toyota<-na.omit(toyota_r)
colnames(toyota)
toyota<-toyota_r[,c(3,4,7,9,16,13,14,17,18)]


#Scatter Plot Matrix:
pairs(toyota)
#Correlation Matrix:
cor(toyota)
#Regression Model and Summary
model.car<-lm(Price~.,data = toyota)
summary(model.car)

#Multi-colinearity
install.packages("car")
library(car)
car::vif(model.car)
#########Model Validation
#Diagnostic Plots:
#Residual Plots, QQ-Plos, Std. Residuals vs Fitted
plot(model.car) 
#Residuals vs Regressors

residualPlots(model.car)
#Added Variable Plots
avPlots(model.car)
#QQ plots of studentized residuals
qqPlot(model.car)
#Deletion Diagnostics
influenceIndexPlot(model.car) # Index Plots of the influence measures
####Iteration 1 

toyota1<-toyota[-c(81),]
toyota['Age2']<-toyota$Age_08_04*toyota$Age_08_04
toyota['hp2']<-toyota$HP*toyota$HP
model.car1<-lm(Price~.,data = toyota1)
summary(model.car1)


plot(model.car1) 
residualPlots(model.car1)
qqPlot(model.car1)
influenceIndexPlot(model.car1)

########
toyota2<-toyota[-c(81,222,961),]

model.car2<-lm(Price~.,data = toyota2)
summary(model.car2)

plot(model.car2) 
residualPlots(model.car2)
qqPlot(model.car2)
influenceIndexPlot(model.car2)


###Final
toyota3<-toyota[-c(81,222,961),-7]
model.car3<-lm(Price~.,data = toyota3)
summary(model.car3)
qqPlot(model.car3)
influenceIndexPlot(model.car3)
##Predict for new data
testdata<-data.frame(Age_08_04=23,KM =46986,HP =90,Gears =5,cc=2000,
                     Quarterly_Tax=210,Weight=1165,Age2=529,hp2=8100)

predict(model.car3,testdata)
pred<-predict(model.car3)
new<-data.frame(toyota$Price-pred)
View(new)
