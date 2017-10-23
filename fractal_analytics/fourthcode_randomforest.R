train$Category_2[which(is.na(train3$Category_2))] <- 2.76
test1$Category_2[which(is.na(test1$Category_2))] <- 3



train.rf <- sample(1:1000,500)
rfprice <- randomForest(Price~.,data = train5,subset = train.rf, mtry = 5, importance = TRUE)
rfprice_predict_test <- predict(rfprice, newdata = test1)
rfsales <- randomForest(Number_Of_Sales~.,data = train6,subset = train.rf, mtry = 5, importance = TRUE)
rfsales_predict_test <- predict(rfsales, newdata = test1)
summary(rfsales_predict_test)
summary(rfprice_predict_test)




MySubmission = data.frame(ID = test1$ID, Number_Of_Sales= rfsales_predict_test,Price= rfprice_predict_test)
write.csv( MySubmission, "Recommendaton4.csv" , row.names = FALSE)
