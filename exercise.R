## Import libraries
library(knitr)
library(readr)
library(caret)
library(rpart)
library(randomForest)
library(ggplot2)
library(cowplot)

## Import data
train.df <- read_csv("~/Desktop/pml-training.csv", na = c("", "NA", "#DIV/0!"))
test.df <- read_csv("~/Desktop/pml-testing.csv", na = c("", "NA", "#DIV/0!"))

## Set seed
set.seed(639)

## Reformat classe variable as factor variable
train.df$classe <- as.factor(train.df$classe)

## Reformat predictor variables to factor for Random Forest Classifcation
train.df$user_name <- as.factor(train.df$user_name)
train.df$cvtd_timestamp <- as.factor(train.df$cvtd_timestamp)
train.df$new_window <- as.factor(train.df$new_window)

test.df$user_name <- as.factor(test.df$user_name)
test.df$cvtd_timestamp <- as.factor(test.df$cvtd_timestamp)
test.df$new_window <- as.factor(test.df$new_window)

## Remove rows with only NA values
na.cols <- colSums(is.na(train.df)) < (nrow(train.df) * 0.6) # remove columns that are 60% NA
train.df <- train.df[,na.cols]
test.df <- test.df[,na.cols] # remove same cols from test that were removed form train

## Remove columns of indices and useless timestamps
train.df <- train.df[,-c(1,5)]
test.df <- test.df[,-c(1,5,60)]

## Ensure same amount of levels for factor variables
levels(test.df$new_window) <- levels(train.df$new_window)

## Ensure data frame format
train.df <- data.frame(train.df)
test.df <- data.frame(test.df)

## Split the training dataset
inTrain <- createDataPartition(train.df$classe, p = 0.7, list = FALSE)
trainCV <- train.df[inTrain,]
validateCV <- train.df[-inTrain,]

## Plot arm accelaration
plot1 <- qplot(accel_arm_x, accel_arm_y, col = classe, data = trainCV)

## Plot belt accelaration
plot2 <- qplot(accel_belt_x, accel_belt_y, col = classe, data = trainCV)

## Plot dumbbell accelaration
plot3 <- qplot(accel_forearm_x, accel_forearm_y, col = classe, data = trainCV)

## Plot dumbbell accelaration
plot4 <- qplot(accel_dumbbell_x, accel_dumbbell_y, col = classe, data = trainCV)

## Plot total accelaration
plot5 <- qplot(total_accel_dumbbell, total_accel_arm, col = classe, data = trainCV)

## Plot total accelaration
plot6 <- qplot(total_accel_belt, total_accel_forearm, col = classe, data = trainCV)

## Arrange plots
plot_grid(plot1, plot2, plot3, plot4, plot5, plot6, ncol = 2)

## Use model to predict classe of testing dataset
t.model <- rpart(classe ~ ., data = trainCV, method = "class")
pred <- predict(t.model, validateCV, type = "class")

## Produce a confusion matrix
confusionMatrix(pred, validateCV$classe)

## Use model to predict classe of testing dataset
rf.data <- rfImpute(classe ~ ., data = trainCV)
rf.model <- randomForest(classe ~ ., data = rf.data)
pred <- predict(rf.model, validateCV, type = "class")

## Produce a confusion matrix
confusionMatrix(pred, validateCV$classe)

## Plot data that were incorrectly predicted
validateCV$isGoodPred <- validateCV$classe == pred
qplot(accel_arm_x, accel_arm_y, col = isGoodPred, data = validateCV)

## Predict "classe" from the testing dataset
predict(rf.model, test.df)
