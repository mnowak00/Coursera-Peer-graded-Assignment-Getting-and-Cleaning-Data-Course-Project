## DATA CLEANING PROJECT

## Loads the dplyr package which will be needed in this script
library(dplyr)

## **********************************************************************************************
## Part 1. Merges the training and the test sets to create one data set.
## **********************************************************************************************

## Reads the training dataset, labels and subjects files into three dataframes
train_set <- read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE)
train_labels <- read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE)
train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)

## Merges the training data into one dataframe
train <- cbind(train_subject,train_labels,train_set)

## Reads the training dataset, labels and subjects files into three dataframes
test_set <- read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE)
test_labels <- read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE)
test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)

## Merges the training data into one dataframe
test <- cbind(test_subject,test_labels,test_set)

## Merges the training and test data
data <- rbind(train,test)

## Assigns variable names to the train and test data
## This is done by first reading the features names from the features.txt file in a valid format
features_names <- read.table("./UCI HAR Dataset/features.txt",header=FALSE)
valid_features_names <- make.names(names=features_names$V2, unique=TRUE, allow_ = TRUE)
names(data) <- c("subject","activity",valid_features_names)

## **********************************************************************************************
## Part 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## **********************************************************************************************

## Using the dplyr package, selects the subject, activities and appropriate columns mean and std
## calculated columns. The "." before and after mean and std ensures the selection of only those
## columns for which mean and std has been calculated

clean_data <- select(data,subject,activity,contains(".mean."),contains(".std."))

## **********************************************************************************************
## Part 3. Uses descriptive activity names to name the activities in the data set
## **********************************************************************************************

## Reads the activity labels table storing it into a dataframe
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

## Looks up and replaces the activity number with the appropriate label
clean_data$activity <- activity_labels$V2[match(clean_data$activity,activity_labels$V1)]

## **********************************************************************************************
## Part 4. Appropriately labels the data set with descriptive variable names.
## **********************************************************************************************

## Adds descriptive names by replacing the original column names
names(clean_data)[3:68] <- gsub("^t","Time_",names(clean_data)[3:68])
names(clean_data)[3:68] <- gsub("^f","Frequency_",names(clean_data)[3:68])
names(clean_data)[3:68] <- gsub("Acc","_Acceleration",names(clean_data)[3:68])
names(clean_data)[3:68] <- gsub("Gyro","_Gyroscope",names(clean_data)[3:68])
names(clean_data)[3:68] <- gsub("Mag","_Magnitude",names(clean_data)[3:68])

## Writes the dataframe into a .csv file
clean_data %>% write.csv("clean_data.csv")

## **********************************************************************************************
## Part 5. From the data set in step 4, creates a second, independent tidy data set with the 
## average of each variable for each activity and each subject.
## **********************************************************************************************

## Groups by subject and activities, then summarizes the dataframe by averages of variables
summarized_data <- clean_data %>% group_by(subject,activity) %>% summarize_all(funs(mean))

## Writes the dataframe into a .csv file
summarized_data %>% write.csv("summarized_data.csv")



