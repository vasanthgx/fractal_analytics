train_impute <- train
names(train_impute)
train_impute_price <- train_impute[-c(1,8)]
names(train_impute_price)
train_impute_price$Category_2[which(is.na(train_impute_price$Category_2))] <- categ2_Price_pred
summary(train_impute_price)
names(train_impute)
train_impute_sales <- train_impute[-c(1,7)]
names(train_impute_sales)
summary(train_impute_sales)
train_impute_sales$Category_2[which(is.na(train_impute_sales$Category_2))] <- categ2_sales_pred
summary(train_impute_sales)
lm_fit_imputed_price <- lm(train_impute_price$Price~., train_impute_price)
summary(lm_fit_imputed_price)
lm_fit_imputed_sales <- lm(train_impute_sales$Number_Of_Sales~., train_impute_sales)
summary(lm_fit_imputed_sales)


lm_fit_imputed_sales_pred <- predict(lm_fit_imputed_sales,test1)
summary(lm_fit_imputed_sales_pred)
lm_fit_imputed_price_pred <- predict(lm_fit_imputed_price,test1)
summary(lm_fit_imputed_price_pred)
MySubmission = data.frame(ID = test$ID, Number_Of_Sales= lm_fit_imputed_sales_pred,Price= lm_fit_imputed_price_pred)
write.csv( MySubmission, "Recommendaton9.csv" , row.names = FALSE)
