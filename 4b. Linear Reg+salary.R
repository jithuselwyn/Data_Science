
#Load data
salary<-read.csv("C:/Users/Jithu K Selwyn/Desktop/Data Science/Assignments/Simple Linear Regression/Salary_Data.csv")


# Visualization
install.packages("lattice")
library(lattice)

#for scatter plot
dotplot(salary$YearsExperience, main="Dot Plot of Exp",col="dodgerblue4")  
dotplot(salary$Salary, main="Dot Plot of salary", col="dodgerblue4")

# for Boxplot
boxplot(salary$YearsExperience,col="dodgerblue4")
boxplot(salary$Salary,col="dodgerblue4")

#Regression equation

model<- lm(Salary~YearsExperience,data =salary)
summary(model)

#The R2 value is less than 0.65, which is not a good value. It means years of exp is not the only factor
#needed to predict the salary.


#preparing new data frame with new data
new_sal=data.frame(YearsExperience=c(4.4,5.2)) 
#predict for new data
sal1=predict(model,new_sal)
#print predicted value
sal1

#predict for all datapoints
pred<-predict(model)
pred
#preparea new data frame with pred and error
finaldata<-data.frame(salary,pred,"Error"= salary$Salary-pred)


