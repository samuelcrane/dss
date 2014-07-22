library("plyr")
library("reshape2")

# Step 1: Load input files
X_train <- read.table('UCI_HAR_Dataset/train/X_train.txt')
X_test <- read.table('UCI_HAR_Dataset/test/X_test.txt')
y_train <- read.table('UCI_HAR_Dataset/train/y_train.txt')
y_test <- read.table('UCI_HAR_Dataset/test/y_test.txt')
subject_train <- read.table('UCI_HAR_Dataset/train/subject_train.txt')
subject_test <- read.table('UCI_HAR_Dataset/test/subject_test.txt')
activities <- read.table('UCI_HAR_Dataset/activity_labels.txt')
features <- read.table('UCI_HAR_Dataset/features.txt')

# Step 2: Merge train and test data sets
X <- rbind(X_train,X_test)
y <- rbind(y_train,y_test)
subject <- rbind(subject_train,subject_test)

#Step 3: Assign column headers
colnames(features) <- c('id','name')
colnames(X) <- features$name
colnames(y) <- 'activity_id'
colnames(activities) <- c('activity_id','activity')
y <- join(y,activities)
colnames(subject) <- 'subject_id'

# Step 4: Subset features by mean() and std()
X_mean_std <- X[,grep("mean\\(\\)|std\\(\\)", colnames(X))]

# Step 5: Transform column headers to make descriptive
y$activity <- tolower(y$activity)
variable_names <- colnames(X_mean_std)
variable_names <- sub("-mean\\(\\)","Mean",variable_names)
variable_names <- sub("-std\\(\\)","Std",variable_names)
variable_names <- sub("-X","X",variable_names)
variable_names <- sub("-Y","Y",variable_names)
variable_names <- sub("-Z","Z",variable_names)
variable_names <- sub("fBodyBody","fBody",variable_names)
colnames(X_mean_std) <- variable_names

# Step 6: Merge into one data set
har <- cbind(subject,y,X_mean_std)

# Step 7: Compute mean of each feature for each subject and activity combination. 
variables <- colnames(har[4:69])
har_narrow <- melt(har,id=c("subject_id","activity_id","activity"),measure.vars=variables)
har_tidy_wide <- dcast(har_narrow, subject_id + activity  ~ variable,mean)

# Step 8: Make data set tidy and narrow
har_tidy_narrow <- melt(har_tidy_wide,id=c("subject_id","activity"),measure.vars=colnames(har_tidy_wide[3:68]))
colnames(har_tidy_narrow) <- c("subject_id","activity","feature","mean_value")

# Step 9: Save output
write.csv(har_tidy_narrow, file = "har_tidy_narrow.txt", row.names=FALSE)
