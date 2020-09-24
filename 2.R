airquality <- datasets::airquality
df <- airquality[,-5]

head(airquality,20)
tail(airquality,5)

d1<-airquality[,c(1,4)]
d2<-airquality[,c(-2,-3,-6)]
d3<-airquality$Solar.R


summary(airquality)
summary(airquality[,-5])
summary(airquality$Ozone)





plot(airquality$Wind)
plot(airquality$Temp,airquality$Wind,type="p")
plot(airquality)

 
plot(airquality$Wind, type= "l") # p: points, l: lines,b: both
plot(airquality$Wind, xlab = 'No of Instances', 
     ylab = 'wind values', main = 'wind levels in NY city',
     col = 'blue')


# Horizontal bar plot
barplot(airquality$Ozone, main = 'Ozone Concenteration in air',
        ylab = 'ozone levels', col= 'blue',horiz = T,axes=T)


#Histogram
hist(airquality$Temp)
hist(airquality$Temp, 
     main = 'Solar Radiation values in air',
     xlab = 'Solar rad.', col='blue')

#Single box plot
boxplot(airquality$Temp,main="Boxplot")

# Multiple box plots
boxplot(airquality[,1:4],main='Multiple')

#margin of the grid(mar), 
#no of rows and columns(mfrow), 
#whether a border is to be included(bty) 
#and position of the 
#labels(las: 1 for horizontal, las: 0 for vertical)
#bty - box around the plot

par(mfrow=c(3,3),mar=c(2,5,2,1),  las=1, bty="n")

plot(airquality$Ozone)
plot(airquality$Ozone, airquality$Wi
     