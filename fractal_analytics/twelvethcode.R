train1$Category_2[which(is.na(train1$Category_2))] <- 3
test1 <- test
test1$Category_2[which(is.na(test1$Category_2))] <- 3
train2$Category_2[which(is.na(train2$Category_2))] <- 3
library(gbm)


train.rf <- sample(1:20000,10000)
boost.price <- gbm(Price~.-Datetime,data = train1[train.rf,],distribution="gaussian",n.trees=5000,interaction.depth=4)
summary(boost.price)

price_boost_pred=predict(boost.price,newdata=test1,n.trees=5000)
summary(price_boost_pred)

boost.sales <- gbm( Number_Of_Sales ~.-Datetime,data = train2[train.rf,],distribution="gaussian",n.trees=5000,interaction.depth=4)

sales_boost_pred=predict(boost.sales,newdata=test1,n.trees=5000)

summary(sales_boost_pred)



MySubmission = data.frame(ID = test1$ID, Number_Of_Sales= sales_boost_pred,Price= price_boost_pred)
write.csv( MySubmission, "Recommendaton11.csv" , row.names = FALSE)
