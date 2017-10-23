train2015 <- train1[Datetime > "2015-01-01",]
summary(train2015)
length(train2015)
dim(train2015)
train2015price <- train1[Datetime > "2015-01-01",]
train2015sales <- train2[Datetime > "2015-01-01",]

lm_fit_price <- lm(Price~.,train2015price)
summary(lm_fit_price)
lm_fit_sales <- lm(Number_Of_Sales~.,train2015sales)
summary(lm_fit_sales)
summary(lm_fit_sales)



sales_probs <- predict(lm_fit_sales,test1)
summary(price_probs)
summary(sales_probs)
MySubmission = data.frame(ID = test$ID, Number_Of_Sales= sales_probs,Price= price_probs)
write.csv( MySubmission, "Recommendaton8.csv" , row.names = FALSE)
