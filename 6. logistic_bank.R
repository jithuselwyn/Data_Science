#################### -- Bank Data --######################

banks <-bank.full
View(banks)
sum(is.na(banks)) 
attach(banks)
colnames(banks)
summary(banks)


library(plyr)
banks$marital <- as.factor(revalue(banks$marital, c("single" = 1, "married" = 2, "divorced" = 3)))
banks$education <- as.factor(revalue(banks$education, c("unknown" = 0, "primary" = 1, "secondary" = 2, "tertiary" = 3)))
banks$default <- as.factor(revalue(banks$default, c("yes" = 1, "no" = 0)))
banks$housing <- as.factor(revalue(banks$housing, c("yes" = 1, "no" = 0)))
banks$loan <- as.factor(revalue(banks$loan, c("yes" = 1, "no" = 0)))
banks$contact <- as.factor(revalue(banks$contact, c("unknown" = 0, "telephone" = 1, "cellular" = 2)))
banks$month <- as.factor(revalue(banks$month, c("jan" = 1, "feb" = 2, "mar" = 3, "apr" = 4, "may" = 5, "jun" = 6, "jul" = 7, "aug" = 8, "sep" = 9, "oct" = 10, "nov" = 11, "dec" = 12)))
banks$poutcome <- as.factor(revalue(banks$poutcome, c("failure" = -1, "unknown" = 0, "success" = 1, "other" = 2)))
banks$y <- as.factor(revalue(banks$y, c("yes" = 1, "no" = 0)))
View(banks)

banks_main <- banks[,-2] 
View(banks_main)

model <- glm(y~., data=banks_main, family = "binomial") # Building Model based on all independent variables except "job description"

exp(coef(model)) # Exponential of Coefficient of the built model

prob <- predict(model,type=c("response"),banks_main)
summary(model)

confusion <- table(prob>0.5, banks_main$y) # Confusion Matrix based on threshold greater than 0.5
confusion

accuracy <- sum(diag(confusion)/sum(confusion)) # Accuracy of the built model
accuracy # 90% Accurate model

pred_values <- NULL
yes_no <- NULL

pred_values <- ifelse(prob>=0.5, 1, 0)
yes_no <- ifelse(prob>=0.5, "yes", "no")


banks_main[,"prob"] <- prob
banks_main[,"pred_values"] <- pred_values
banks_main[,"yes_no"] <- yes_no

View(banks_main)

##################################Credit Card#################

credit <-creditcard[,-1]
View(credit)

colnames(credit)
summary(credit)


library(plyr)

credit$owner <- as.factor(revalue(credit$owner, c("yes" = 1, "no" = 0)))
credit$selfemp <- as.factor(revalue(credit$selfemp, c("yes" = 1, "no" = 0)))
credit$card <- as.factor(revalue(credit$card, c("yes" = 1, "no" = 0)))
View(credit)

model <- glm(card~.,family = "binomial", data=credit)

exp(coef(model))
prob <- predict(model,type=c("response"),credit)
summary(model)


confusion <- table(prob>0.5, credit$card) # Confusion Matrix based on threshold greater than 0.5
confusion

accuracy <- sum(diag(confusion)/sum(confusion)) # Accuracy of the built model
accuracy # 86% Accurate model

pred_values <- NULL
yes_no <- NULL

pred_values <- ifelse(prob>=0.5, 1, 0)
yes_no <- ifelse(prob>=0.5, "yes", "no")

credit[,"prob"] <- prob
credit[,"pred_values"] <- pred_values
credit[,"yes_no"] <- yes_no


View(credit)
