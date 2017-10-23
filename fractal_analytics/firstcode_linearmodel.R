library(tidyverse)
train <- read_csv("train.csv")
test <- read_csv("test.csv")
names(train)
names(test)
head(train)
str(train)
summary(train)
hist(train$Number_Of_Sales)
plot(train$Price,train$Number_Of_Sales)
attach(train)
names(train)
names_wo_id_and_sales <- names(train)[c(2:7)]
train1 <- train[,names_wo_id_and_sales]
names(train1)
lm_fit_price <- lm(Price~.,train1)
summary(lm_fit_price)
price_probs <- predict(lm_fit_price,test)
summary(price_probs)
price_probs[which(is.na(price_probs))] <- 4.96
summary(price_probs)

names_wo_id_and_price <- names(train)[c(2:6,8)]
names_wo_id_and_price

train2 <- train[,names_wo_id_and_price]
lm_fit_sales <- lm(Number_Of_Sales~.,train2)
summary(lm_fit_sales)
sales_probs <- predict(lm_fit_sales,test)
head(sales_probs)
summary(sales_probs)
sales_probs[which(is.na(sales_probs))] <- 900
summary(sales_probs)

testID <- test$ID
submit <- cbind(testID,sales_probs,price_probs)
head(submit)
dim(submit)


MySubmission = data.frame(ID = testID, Number_Of_Sales= sales_probs,Price= price_probs)
write.csv( MySubmission, "Recommendaton1.csv" , row.names = FALSE)


