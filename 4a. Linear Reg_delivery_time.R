
#Load data
deltime<-read.csv("C:/Users/Jithu K Selwyn/Desktop/Data Science/Assignments/Simple Linear Regression/delivery_time.csv")


# Visualization
install.packages("lattice")
library(lattice)

#for scatter plot
dotplot(deltime$Delivery.Time,col="dodgerblue4")  
dotplot(deltime$Sorting.Time,col="dodgerblue4")

# for Boxplot
boxplot(deltime$Delivery.Time,col="dodgerblue4")
boxplot(deltime$Sorting.Time,col="dodgerblue4")

#Regression equation

colnames(deltime)   #gives u the column names
model<- lm(Delivery.Time~Sorting.Time,data =deltime)
summary(model)
#preparing new data frame with new data
new_time=data.frame(Sorting.Time=c(6,7,10))
#predict for new data
time1=predict(model,new_time)
#print predicted value
time1

#predict for all datapoints (predicted value for to daily paper)
pred<-predict(model)
pred
#preparea new data frame with pred and error
finaldata<-data.frame(deltime,pred,"Error"= deltime$Delivery.Time-pred)
#print new dataset
finaldata

