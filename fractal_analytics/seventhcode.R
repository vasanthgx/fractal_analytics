train1$Category_2[which(is.na(train1$Category_2))] <- 3
test1 <- test
test1$Category_2[which(is.na(test1$Category_2))] <- 3
train2$Category_2[which(is.na(train2$Category_2))] <- 3
library(randomForest)


train.rf <- sample(1:20000,10000)
rfprice <- randomForest(Price~.,data = train1,subset = train.rf, mtry = 5, importance = TRUE)


rfprice_predict_test <- predict(rfprice, newdata = test1)
rfsales <- randomForest(Number_Of_Sales~.,data = train2,subset = train.rf, mtry = 5, importance = TRUE)
rfsales_predict_test <- predict(rfsales, newdata = test1)

rfprice
rfsales
summary(rfsales_predict_test)
summary(rfprice_predict_test)




MySubmission = data.frame(ID = test1$ID, Number_Of_Sales= rfsales_predict_test,Price= rfprice_predict_test)
write.csv( MySubmission, "Recommendaton7.csv" , row.names = FALSE)
