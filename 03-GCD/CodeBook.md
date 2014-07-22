CodeBook
=========

This document describes the input data, transformations performed to the input data, and the expected structure of the output data. More detailed information about the original data, including collection method and preprocessing steps, can be found in the References section of the [README.md](README.md) file. 

Input: Description of the Original Data
----
The original data had three components that have been processed here. 

1. Feature variable values
2. Physical activity types
3. Human volunteer subject IDs

Each componenet was split into 70% training and 30% test samples and is a separate input file. See the Variable Description section below for more detailed information about each variable. 

<table>
 <col>
 <col>
 <col>
 <tr>
  <td>Input File</td>
  <td>Dimensions (rows by columns)</td>
  <td>Description</td>
 </tr>
 <tr>
  <td>X_train.txt</td>
  <td>7352 x 561</td>
  <td>A 561-feature vector per line with
  time and frequency domain variables training set.</td>
 </tr>
 <tr>
  <td>X_test.txt</td>
  <td>2947 x 561</td>
  <td>A 561-feature vector per line with
  time and frequency domain variables test set.</td>
 </tr>
 <tr>
  <td>y_train.txt</td>
  <td>7352 x 1</td>
  <td>Activity labels using a numeric
  class between 1-6 training set.</td>
 </tr>
 <tr>
  <td>y_test.txt</td>
  <td>2947 x 1</td>
  <td>Activity labels using a numeric
  class between 1-6 test set.</td>
 </tr>
 <tr>
  <td>subject_train.txt</td>
  <td>7352 x 1</td>
  <td>Each line identifies the subject
  who performed the activity for each window sample. Its range is from 1 to 30.
  Training set.</td>
 </tr>
 <tr>
  <td>subject_test.txt</td>
  <td>2947 x 1</td>
  <td>Each line identifies the subject
  who performed the activity for each window sample. Its range is from 1 to 30.
  Test set.</td>
 </tr>
 <tr>
  <td>activity_labels.txt</span></td>
  <td>6 x 2</td>
  <td>Look up table for the activity name
  and numeric class used in the y train and test files.</td>
 </tr>
 <tr>
  <td>features.txt</td>
  <td>561 x 2</td>
  <td>List of all feature names.
 </tr>
</table>


Data Processing Steps
--------------
#####The script performs the following steps:

1. Loads the input files into R
2. Merges the three test and three train files into a single data table for each component
3. Uses the look up tables where necessary to assign textual columns headings
4. Subsets the large data set to contain only mean and standard deviation features.
5. Transforms the textual column headings to make them more readable and descriptive.
6. Merges the three component datasets into one large data set.
7. Computes the means of each feature, grouped by subject and activity.
8. Makes the new data set tidy and narrow.
9. Saves this tidy data set as `har_tidy_narrow.csv`.

#####Notes:
* Step 4: Using the grep() function, two types of features that contain a mean could be recovered: mean() and meanFreq(). The latter is a mean of all the frequency domain signals, rather than a mean of each pattern (wether time domain or frequency domain). I have chosen to only retain the former mean values and ignore the meanFreq() values. 
* Step 5: I have maintained the overall structure of the variable textual names provided in the `features.txt` file. I removed the parentheses and dashes from the variables names to make them more R-friendly. I think these variable names are descriptive enough that an experience user of this data set could reasoanbly be expected to understand the variable names with abbrevations. These coumn header names are more descriptive than the default ones created by R (V1, etc) and have the added value of being easiy cross referenced against the original database. Further details about each is given in the Variable Description section below. 
* Step 7: One mean value is produced for each activity performed by each person. 


Output
--------------
One file, `har_tidy_narrow.txt`, is output by the script. 

<table>
 <col>
 <col>
 <col>
 <tr>
  <td>Output File</td>
  <td>Dimensions (rows by columns)</td>
  <td>Description</td>
 </tr>
 <tr>
  <td>har_tidy_narrow.txt</td>
  <td>11880 x 4</td>
  <td>Tidy, comma-seprated data set of the mean per activity, per subject of the mean and Standard deviation of the Human Activity Recognition Using Smartphones Dataset</td>
 </tr>
</table>
 

#####Description of columns in output file:
<table>
 <col>
 <col>
 <tr>
  <td>Column name</td>
  <td>Description</td>
 </tr>
 <tr>
  <td>subject_id</td>
  <td>One number per volunteer subject</td>
 </tr>
  <tr>
  <td>activity</td>
  <td>Name of the activity</td>
 </tr>
  <tr>
  <td>feature</td>
  <td>The name of the feature variable.</td>
 </tr>
 <tr>
  <td>mean_value</td>
  <td>The computed mean of the feature variable for each subject and activity.</td>
 </tr>
</table>
 

Variable Description
--------------

There are three categories of variables: features, activities, and subjects. This section provides an explanation of each variable as it is provided in the tidy output data file.

### Subjects
There were 30 subjects, identified by a numeric code between 1-30.

### Activities
Physical activities are classified by charcter strings:

* walking
* walking_upstairs
* walking_downstairs
* sitting
* standing
* laying 

### Features
See the [UCI HAR documentation](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) for information about how each feature variable was collected and processed. The table below describes the features in the variables column of the output data. 

**A note about units:** As per the original data source, all feature variables are normalized and bounded within [-1,1]

<table>
 <col>
 <col>
 <tr>
  <td>Feature</td>
  <td>Description</td>
 </tr>
 <tr>
  <td>tBodyAccMeanX</td>
  <td>Time Body Signals Acceleration Mean X Axis</td>
 </tr>
 <tr>
  <td>tBodyAccMeanY</td>
  <td>Time Body Signals Acceleration Mean Y Axis</td>
 </tr>
 <tr>
  <td>tBodyAccMeanZ</td>
  <td>Time Body Signals Acceleration Mean Z Axis</td>
 </tr>
 <tr>
  <td>tBodyAccStdX</td>
  <td>Time Body Signals Acceleration std X Axis</td>
 </tr>
 <tr>
  <td>tBodyAccStdY</td>
  <td>Time Body Signals Acceleration std Y Axis</td>
 </tr>
 <tr>
  <td>tBodyAccStdZ</td>
  <td>Time Body Signals Acceleration std Z Axis</td>
 </tr>
 <tr>
  <td>tGravityAccMeanX</td>
  <td>Time Gravity Signals Acceleration Mean X Axis</td>
 </tr>
 <tr>
  <td>tGravityAccMeanY</td>
  <td>Time Gravity Signals Acceleration Mean Y Axis</td>
 </tr>
 <tr>
  <td>tGravityAccMeanZ</td>
  <td>Time Gravity Signals Acceleration Mean Z Axis</td>
 </tr>
 <tr>
  <td>tGravityAccStdX</td>
  <td>Time Gravity Signals Acceleration std X Axis</td>
 </tr>
 <tr>
  <td>tGravityAccStdY</td>
  <td>Time Gravity Signals Acceleration std Y Axis</td>
 </tr>
 <tr>
  <td>tGravityAccStdZ</td>
  <td>Time Gravity Signals Acceleration std Z Axis</td>
 </tr>
 <tr>
  <td>tBodyAccJerkMeanX</td>
  <td>Time Body Signals Acceleration Jerk Signals Mean X Axis</td>
 </tr>
 <tr>
  <td>tBodyAccJerkMeanY</td>
  <td>Time Body Signals Acceleration Jerk Signals Mean Y Axis</td>
 </tr>
 <tr>
  <td>tBodyAccJerkMeanZ</td>
  <td>Time Body Signals Acceleration Jerk Signals Mean Z Axis</td>
 </tr>
 <tr>
  <td>tBodyAccJerkStdX</td>
  <td>Time Body Signals Acceleration Jerk Signals std X Axis</td>
 </tr>
 <tr>
  <td>tBodyAccJerkStdY</td>
  <td>Time Body Signals Acceleration Jerk Signals std Y Axis</td>
 </tr>
 <tr>
  <td>tBodyAccJerkStdZ</td>
  <td>Time Body Signals Acceleration Jerk Signals std Z Axis</td>
 </tr>
 <tr>
  <td>tBodyGyroMeanX</td>
  <td>Time Body Signals Gyroscope Mean X Axis</td>
 </tr>
 <tr>
  <td>tBodyGyroMeanY</td>
  <td>Time Body Signals Gyroscope Mean Y Axis</td>
 </tr>
 <tr>
  <td>tBodyGyroMeanZ</td>
  <td>Time Body Signals Gyroscope Mean Z Axis</td>
 </tr>
 <tr>
  <td>tBodyGyroStdX</td>
  <td>Time Body Signals Gyroscope std X Axis</td>
 </tr>
 <tr>
  <td>tBodyGyroStdY</td>
  <td>Time Body Signals Gyroscope std Y Axis</td>
 </tr>
 <tr>
  <td>tBodyGyroStdZ</td>
  <td>Time Body Signals Gyroscope std Z Axis</td>
 </tr>
 <tr>
  <td>tBodyGyroJerkMeanX</td>
  <td>Time Body Signals Gyroscope Jerk Signals Mean X Axis</td>
 </tr>
 <tr>
  <td>tBodyGyroJerkMeanY</td>
  <td>Time Body Signals Gyroscope Jerk Signals Mean Y Axis</td>
 </tr>
 <tr>
  <td>tBodyGyroJerkMeanZ</td>
  <td>Time Body Signals Gyroscope Jerk Signals Mean Z Axis</td>
 </tr>
 <tr>
  <td>tBodyGyroJerkStdX</td>
  <td>Time Body Signals Gyroscope Jerk Signals std X Axis</td>
 </tr>
 <tr>
  <td>tBodyGyroJerkStdY</td>
  <td>Time Body Signals Gyroscope Jerk Signals std Y Axis</td>
 </tr>
 <tr>
  <td>tBodyGyroJerkStdZ</td>
  <td>Time Body Signals Gyroscope Jerk Signals std Z Axis</td>
 </tr>
 <tr>
  <td>tBodyAccMagMean</td>
  <td>Time Body Signals Acceleration Magnitude Mean</td>
 </tr>
 <tr>
  <td>tBodyAccMagStd</td>
  <td>Time Body Signals Acceleration Magnitude std</td>
 </tr>
 <tr>
  <td>tGravityAccMagMean</td>
  <td>Time Gravity Signals Acceleration Magnitude Mean</td>
 </tr>
 <tr>
  <td>tGravityAccMagStd</td>
  <td>Time Gravity Signals Acceleration Magnitude std</td>
 </tr>
 <tr>
  <td>tBodyAccJerkMagMean</span></td>
  <td>Time Body Signals Acceleration Jerk Signals Magnitude Mean</span></td>
 </tr>
 <tr>
  <td>tBodyAccJerkMagStd</td>
  <td>Time Body Signals Acceleration Jerk Signals Magnitude std</span></td>
 </tr>
 <tr>
  <td>tBodyGyroMagMean</td>
  <td>Time Body Signals Gyroscope Magnitude Mean</td>
 </tr>
 <tr>
  <td>tBodyGyroMagStd</td>
  <td>Time Body Signals Gyroscope Magnitude std</td>
 </tr>
 <tr>
  <td>tBodyGyroJerkMagMean</span></td>
  <td>Time Body Signals Gyroscope Jerk Signals Magnitude Mean</span></td>
 </tr>
 <tr>
  <td>tBodyGyroJerkMagStd</td>
  <td>Time Body Signals Gyroscope Jerk Signals Magnitude std</td>
 </tr>
 <tr>
  <td>fBodyAccMeanX</td>
  <td>Frequency Body Signals Acceleration Mean X Axis</td>
 </tr>
 <tr>
  <td>fBodyAccMeanY</td>
  <td>Frequency Body Signals Acceleration Mean Y Axis</td>
 </tr>
 <tr>
  <td>fBodyAccMeanZ</td>
  <td>Frequency Body Signals Acceleration Mean Z Axis</td>
 </tr>
 <tr>
  <td>fBodyAccStdX</td>
  <td>Frequency Body Signals Acceleration std X Axis</td>
 </tr>
 <tr>
  <td>fBodyAccStdY</td>
  <td>Frequency Body Signals Acceleration std Y Axis</td>
 </tr>
 <tr>
  <td>fBodyAccStdZ</td>
  <td>Frequency Body Signals Acceleration std Z Axis</td>
 </tr>
 <tr>
  <td>fBodyAccJerkMeanX</td>
  <td>Frequency Body Signals Acceleration Jerk Signals Mean X Axis</span></td>
 </tr>
 <tr>
  <td>fBodyAccJerkMeanY</td>
  <td>Frequency Body Signals Acceleration Jerk Signals Mean Y Axis</span></td>
 </tr>
 <tr>
  <td>fBodyAccJerkMeanZ</td>
  <td>Frequency Body Signals Acceleration Jerk Signals Mean Z Axis</span></td>
 </tr>
 <tr>
  <td>fBodyAccJerkStdX</td>
  <td>Frequency Body Signals Acceleration Jerk Signals std X Axis</span></td>
 </tr>
 <tr>
  <td>fBodyAccJerkStdY</td>
  <td>Frequency Body Signals Acceleration Jerk Signals std Y Axis</span></td>
 </tr>
 <tr>
  <td>fBodyAccJerkStdZ</td>
  <td>Frequency Body Signals Acceleration Jerk Signals std Z Axis</span></td>
 </tr>
 <tr>
  <td>fBodyGyroMeanX</td>
  <td>Frequency Body Signals Gyroscope Mean X Axis</td>
 </tr>
 <tr>
  <td>fBodyGyroMeanY</td>
  <td>Frequency Body Signals Gyroscope Mean Y Axis</td>
 </tr>
 <tr>
  <td>fBodyGyroMeanZ</td>
  <td>Frequency Body Signals Gyroscope Mean Z Axis</td>
 </tr>
 <tr>
  <td>fBodyGyroStdX</td>
  <td>Frequency Body Signals Gyroscope std X Axis</td>
 </tr>
 <tr>
  <td>fBodyGyroStdY</td>
  <td>Frequency Body Signals Gyroscope std Y Axis</td>
 </tr>
 <tr>
  <td>fBodyGyroStdZ</td>
  <td>Frequency Body Signals Gyroscope std Z Axis</td>
 </tr>
 <tr>
  <td>fBodyAccMagMean</td>
  <td>Frequency Body Signals Acceleration Magnitude Mean</td>
 </tr>
 <tr>
  <td>fBodyAccMagStd</td>
  <td>Frequency Body Signals Acceleration Magnitude std</td>
 </tr>
 <tr>
  <td>fBodyAccJerkMagMean</span></td>
  <td>Frequency Body Signals Acceleration Jerk Signals Magnitude Mean</span></td>
 </tr>
 <tr>
  <td>fBodyAccJerkMagStd</td>
  <td>Frequency Body Signals Acceleration Jerk Signals Magnitude std</span></td>
 </tr>
 <tr>
  <td>fBodyGyroMagMean</td>
  <td>Frequency Body Signals Gyroscope Magnitude Mean</td>
 </tr>
 <tr>
  <td>fBodyGyroMagStd</td>
  <td>Frequency Body Signals Gyroscope Magnitude std</td>
 </tr>
 <tr>
  <td>fBodyGyroJerkMagMean</span></td>
  <td>Frequency Body Signals Gyroscope Jerk Signals Magnitude Mean</span></td>
 </tr>
 <tr>
  <td>fBodyGyroJerkMagStd</td>
  <td>Frequency Body Signals Gyroscope Jerk Signals Magnitude std</span></td>
 </tr>
</table>
