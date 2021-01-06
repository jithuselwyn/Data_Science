startup<-`50_Startups`
#install.packages('fastDummies')
#library('fastDummies')
#startup_dumm<-dummy_cols(startup, select_columns= 'State')
startup<-startup[,-4]

pairs(startup)

cor(startup)

model1<-lm(Profit~.,data=startup)
summary(model1)

library(car)

car::vif(model1)


library(MASS)
stepAIC(model1)


plot(model1)

residualPlots(model1)

#Added Variable Plots
avPlots(model1)

#QQ plots of studentized residuals
qqPlot(model1)

#Deletion Diagnostics
influenceIndexPlot(model1)


startup1<-startup[-c(46,50)]

model2<-lm(Profit~.,data=startup1)
summary(model2)


plot(model2) 
residualPlots(model2)
qqPlot(model2)
influenceIndexPlot(model2)

testdata<-data.frame(R.D.Spend=166000,Administration=151380,Marketing.Spend=192890)

pred<-predict(model2,testdata)
predicted_profit<-predict(model2)

finalstartup<-data.frame(startup,predicted_profit,"Error"= startup$Profit-predicted_profit)
