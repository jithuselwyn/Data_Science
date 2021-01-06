library(recommenderlab)
library(caTools)


book <- read.csv(file.choose())
View(book)
attach(book)

book <- book[,-1]
book <- book[-4901,]
View(book)

str(book)

hist(ratings)


table(ratings)

book_matrix <- as(book,'realRatingMatrix')
View(book_matrix)

 
book_recommend_model <- Recommender(book_matrix, method='UBCF')
recommended_items <- predict(book_recommend_model, book_matrix[1209],n=5)
as(recommended_items,'list')



book_recommend_model1 <- Recommender(book_matrix, method='POPULAR')
recommended_items1 <- predict(book_recommend_model1, book_matrix[3210:3211],n=10)
as(recommended_items1,'list')



book_recommend_model2 <- Recommender(book_matrix, method='RANDOM')
recommended_items2 <- predict(book_recommend_model2, book_matrix[560],n=12)
as(recommended_items2,'list')


 

book_recommend_model3 <- Recommender(book_matrix, method='ALS')
recommended_items3 <- predict(book_recommend_model3, book_matrix[1000],n=15)
as(recommended_items3,'list')


book_recommend_model4 <- Recommender(book_matrix, method='SVDF')
recommended_items4 <- predict(book_recommend_model4, book_matrix[2461:2462],n=6)
as(recommended_items4,'list')


