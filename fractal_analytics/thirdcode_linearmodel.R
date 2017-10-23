train$Category_2[which(is.na(train3$Category_2))] <- 2.76
test1$Category_2[which(is.na(test1$Category_2))] <- 3

train5 <- train[,names_wo_id_and_sales]
summary(train5)
lm.fit1 <- lm(Price ~ ., train5)
train6 <- train[,names_wo_id_and_price]
summary(train6)
price_probs1 <- predict(lm.fit1,test1)
summary(price_probs1)
lm.fit2 <- lm(Number_Of_Sales ~ ., train6)
summary(lm.fit2)
sales_probs1 <- predict(lm.fit2,test1)
summary(sales_probs1)

MySubmission = data.frame(ID = testID, Number_Of_Sales= sales_probs1,Price= price_probs1)
write.csv( MySubmission, "Recommendaton3.csv" , row.names = FALSE)
