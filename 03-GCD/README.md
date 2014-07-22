03-GCD: Getting and Cleaning Data Coursera Class
=========

This repo contains files pertaining to the Course Project for the Getting and Cleaning Data course of the Coursera Data Science Specialization. I participated in the July 2014 (005) offering of this course. 

This project contains one R script, `run_analysis.R`, which will calculate means per activity, per subject of the mean and Standard deviation of the Human Activity Recognition Using Smartphones Dataset Version 1.0 [1]. 

Data processing steps are explained in the [CookBook.md](CookBook.md)


Assignment Requirements
-----------

The R script must accomplish these goals:

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Repo Files
--------------

##### Files and Directories:

* [README.md] - This file.
* [CodeBook.md] - File describing the data in HAR-tidy.csv
* [/UCI_HAR_Dataset] - Directory containing the original dataset
* [run_analysis.R] - This is an R scipt containing the commands used to processing the data in /UCI_HAR_Dataset and produce the HAR_tidy.csv file.
* [HAR_tidy_narrow.csv] - The output tidy dataset, containing the averages of mean and std for each subject and activity. 

Original Data Source
----

[Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) from the UCI Machine Learning Repository [1].

## References

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012. 

## Required R Packages

The R packages `plyr` and `reshape2` are required to run this script. Package installation:

```{r}
install.package("plyr")```

```{r}
install.package("reshape2")```



[README.md]:https://github.com/samuelcrane/dss/tree/master/03-GCD
[/UCI_HAR_Dataset]:https://github.com/samuelcrane/dss/tree/master/03-GCD/UCI_HAR_Dataset
[run_analysis.R]:https://github.com/samuelcrane/dss/blob/master/03-GCD/run_analysis.R