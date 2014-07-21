03-GCD
=========

This repo contains files pertaining to the Course Project for the Getting and Cleaning Data course of the Coursera Data Science Specialization. 


Original Data Source
----

[Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) from the UCI Machine Learning Repository.

Assignment Requirements
-----------

The R script must accomplish these goals:

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Files
--------------

##### Files and Directories:

* [README.md] - This file.
* [CodeBook.md] - File describing the data in HAR-tidy.csv
* [/UCI_HAR_Dataset] - Directory containing the original dataset
* [run_analysis.R] - This is an R scipt containing the commands used to processing the data in /UCI_HAR_Dataset and produce the HAR_tidy.csv file.
* [HAR_tidy.csv] - The output tidy dataset, containing the averages of mean and std for each subject and activity. 