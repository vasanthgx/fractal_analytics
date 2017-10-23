train3$Category_2[which(is.na(train3$Category_2))] <- 4

train3 <- train[,names_wo_id_and_sales]
summary(train3)
glm.fit1 <- glm(Price ~ ., train3, family = gaussian)
train4 <- train[,names_wo_id_and_price]
summary(train4)
glm.fit2 <- glm(Number_Of_Sales~., train4, family = gaussian)
glm.pred1_price <- predict(glm.fit1,test)
glm.pred2_sales <- predict(glm.fit2,test)
summary(glm.pred1_price)
glm.pred1_price[which(is.na(glm.pred1_price))] <- 4.96
summary(glm.pred2_sales)
glm.pred2_sales[which(is.na(glm.pred2_sales))] <- 955

MySubmission = data.frame(ID = testID, Number_Of_Sales= glm.pred2_sales,Price= glm.pred1_price)

#MySubmission = data.frame(ID = test$Item_ID, Number_Of_Sales= glm.pred2_sales,Price= glm.pred1_price)

summary(MySubmission)
write.csv( MySubmission, "Recommendaton2.csv" , row.names = FALSE)

