library("plyr")
library("reshape2")

setwd('~/Dropbox/dss/03-GCD/')

# Merge X train and X test datasets, label variables
X_test <- read.table('UCI_HAR_Dataset/test/X_test.txt')
X_train <- read.table('UCI_HAR_Dataset/train/X_train.txt')
X <- rbind(X_train,X_test)
# REQUIREMENT: Appropriately labels the data set with descriptive variable names. 
features <- read.table('UCI_HAR_Dataset/features.txt')
colnames(features) <- c('id','name')
colnames(X) <- features$name

# Merge y train and y test datasets, add activity names
y_test <- read.table('UCI_HAR_Dataset/test/y_test.txt')
y_train <- read.table('UCI_HAR_Dataset/train/y_train.txt')
y <- rbind(y_train,y_test)
colnames(y) <- 'activity_id'
# REQUIREMENT: Uses descriptive activity names to name the activities in the data set
activities <- read.table('UCI_HAR_Dataset/activity_labels.txt')
colnames(activities) <- c('activity_id','activity')
y <- join(y,activities)

# Merge X and y datasets, rename y variable name
YX <- cbind(y,X)

# Merge subject train and subject test datasets
subject_test <- read.table('UCI_HAR_Dataset/test/subject_test.txt')
subject_train <- read.table('UCI_HAR_Dataset/train/subject_train.txt')
subject <- rbind(subject_train,subject_test)
colnames(subject) <- 'subject_id'

# REQUIREMENT: Merges the training and the test sets to create one data set.
# Merge subject to data
HAR <- cbind(subject,YX)

# REQUIREMENT: Extracts only the measurements on the mean and standard deviation for each measurement. 
# Subset by mean and standard deviation
HAR_mean <- HAR[,grep("mean()", colnames(HAR), fixed=TRUE)]
HAR_std <- HAR[,grep("std()", colnames(HAR), fixed=TRUE)]
HAR_wide <- cbind(HAR[,(1:3)],HAR_mean,HAR_std)

# REQUIREMENT: Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# Melt wide dataset
variables <- colnames(HAR_wide[4:69])
HAR_narrow <- melt(HAR_wide,id=c("subject_id","activity_id","activity"),measure.vars=variables)

# Cast narrow dataset
HAR_subject <- dcast(HAR_narrow, subject_id ~ variable,mean)
HAR_activity <- dcast(HAR_narrow, activity ~ variable,mean)
HAR_subject_activity <- dcast(HAR_narrow, subject_id + activity  ~ variable,mean)

# Make the final dataset tidy and narrow
HAR_tidy_narrow <- melt(HAR_subject_activity,id=c("subject_id","activity"),measure.vars=colnames(HAR_subject_activity[3:68]))

write.csv(HAR_subject_activity, file = "HAR_tidy_wide.csv")
