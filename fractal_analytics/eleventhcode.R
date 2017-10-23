train1$Category_2[which(is.na(train1$Category_2))] <- 3
test1 <- test
test1$Category_2[which(is.na(test1$Category_2))] <- 3


summary(train1)
glm.fit2 <- glm(Price ~ ., train1, family = gaussian)

summary(train2)
glm.fit3 <- glm(Number_Of_Sales~., train2, family = gaussian)
glm.pred2_price <- predict(glm.fit2,test1)
glm.pred2_sales <- predict(glm.fit3,test1)
summary(glm.pred2_price)

summary(glm.pred2_sales)

MySubmission = data.frame(ID = test$ID, Number_Of_Sales= glm.pred2_sales,Price= glm.pred2_price)
#MySubmission1 = data.frame(ID = test$Item_ID, Number_Of_Sales= glm.pred2_sales,Price= glm.pred2_price)

summary(MySubmission)
write.csv( MySubmission, "Recommendaton10.csv" , row.names = FALSE)

