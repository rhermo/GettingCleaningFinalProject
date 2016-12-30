# File: run_analysis.R
# Author: Raul Hermosa
# Date: Dec 29, 2016
# Description: R script for Final Project of Course Getting And  Cleaning Data

fileZip <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileZip, "data.zip", mode ="wb")
doc <-unzip("data.zip")


#reading data from files
activity <- read.csv(doc[1], sep = "", header = FALSE)

test_subject <- read.csv(doc[14], sep = "", header = FALSE)
test_labels <- read.csv(doc[16], sep = "", header = FALSE)
test_data <- read.csv(doc[15], sep = "", header = FALSE)
train_subject <- read.csv(doc[26], sep = "", header = FALSE)
train_labels <- read.csv(doc[28], sep = "", header = FALSE)
train_data <- read.csv(doc[27], sep = "", header = FALSE)

## STEP 1
#merging training and testing data
ncol_test_data <- ncol(test_data)
test_data[,ncol_test_data+1] <- test_labels
test_data[,ncol_test_data+2] <- test_subject

ncol_test_train_data <-ncol(train_data)
train_data[,ncol_test_train_data+1] <- train_labels
train_data[,ncol_test_train_data+2] <- train_subject

data <- rbind(train_data, test_data)

## STEP 2
#extracting mean and std dev for every measurement
features <- read.csv(doc[2], sep = "", header = FALSE)
cols_to_remain <- grep(".*mean.*|.*std.*", features[,2])
features <- features[cols_to_remain,]
# adding activity labels and  to cols to remain
cols_to_remain <- c(cols_to_remain, ncol_test_data+1, ncol_test_data+2 )
data <- data[, cols_to_remain]

## STEP 3
#using descriptive activity names in activty variable of data set
#repalcing to literals of activity labels
num_cols <- ncol(data)
colnames(data)[num_cols -1]<-"activity"

curr_act <- 1 
for (curr_act_l in activity$V2) {
        data$activity <- gsub(curr_act, curr_act_l, data$activity) 
        curr_act <- curr_act + 1 
}

## STEP 4
# features V2 is a factor variable
feat_str <- as.character(features$V2)
# generating vector to repalce names, features only had valid columns
z<-c(feat_str, "activity", "subject")
#cleaning -() and to lower letters
z <- gsub("[-()]", "", z)
z <- tolower(z)

colnames(data) <- z

## STEP 5
# transforming variables to factor, so they will be use in the command
data$activity <- as.factor(data$activity)
data$subject <- as.factor(data$subject)

avg_data <- aggregate(data, by=list(factactivity = data$activity, factorsubject=data$subject), mean)
# removing columns without sense activity and subject (2 last)
col_cut <- ncol(avg_data) -2 
avg_data <- avg_data[, 1:col_cut]

write.csv(avg_data, "avg_data.csv")

# end of Script