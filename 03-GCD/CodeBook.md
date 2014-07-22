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
4. Transforms the textual column headings where necessary to increase reability and R-friendliness
5. Merges the three component datasets into one large data set.
6. Subsets the large data set to contain only mean and standard deviation features.
7. Computes the means of each feature, grouped by subject and activity.
8. Makes the new data set tidy and narrow.
9. Saves this tidy data set as `har_tidy_narrow.csv`.

#####Notes:
* Step 4: I have maintained the overall structure of the variable textual names provided in the `features.txt` file. I removed the parentheses and dashes from the variables names to make them more R-friendly. I think these variable names are descriptive enough that an experience user of this data set could reasoanbly be expected to understand the variable names with abbrevations. Further details about each is given in the Variable Description section below. 
* Step 6: Using the grep() function, two types of features that contain a mean could be recovered: mean() and meanFreq(). The latter is a mean of all the frequency domain signals, rather than a mean of each pattern (wether time domain or frequency domain). I have chosen to only retain the former mean values and ignore the meanFreq() values. 

Output
-----------
One file, `har_tidy_narrow.csv`, is output by the script. 

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
  <td>har_tidy_narrow.csv</td>
  <td>11880 x 4</td>
  <td>Tidy data set of the mean per activity, per subject of the mean and Standard deviation of the Human Activity Recognition Using Smartphones Dataset</td>
 </tr>
 </table>

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
  <td>variable</td>
  <td>The name of the feature variable.</td>
 </tr>
  <tr>
  <td>mean_value</td>
  <td>The computed mean of the feature variable for each subject and activity.</td>
 </tr>
 </table>
Variable Description
-----------

There are three categories of variables: features, activities, and subjects. This section provides an explanation of each variable as it is provided in the tidy output data set

##### Subjects
There were 30 subjects, identified by a numeric code between 1-30.

##### Activities
Physical activities were classified by charcter strings:

* walking
* walking_upstairs
* walking_downstairs
* sitting
* standing
* laying 

##### Features
Original descirption of how each feature was derived:
> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

> These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
Descriptions of the variables found in the har_tidy_narrow.csv dataset:

The Features described above:

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

<table>
 <col>
 <col>
 <col>
 <tr>
  <td>Variable</td>
  <td>Unit</td>
  <td>Description</td>
 </tr>
 <tr>
  <td>subject_id</td>
  <td></td>
  <td></td>
 </tr>
 <tr>
  <td>activity_id</td>
  <td></td>
  <td></td>
 </tr>
 <tr>
  <td>activity</td>
  <td></td>
 </tr>
 <tr>
  <td>tBodyAccMeanX</td>
  <td></td>
 </tr>
 <tr>
  <td>tBodyAccMeanY</td>
  <td></td>
 </tr>
 <tr>
  <td>tBodyAccMeanZ</td>
  <td></td>
 </tr>
 <tr>
  <td>tGravityAccMeanX</td>
  <td></td>
 </tr>
 <tr>
  <td>tGravityAccMeanY</td>
  <td></td>
 </tr>
 <tr>
  <td>tGravityAccMeanZ</td>
  <td></td>
 </tr>
 <tr>
  <td>tBodyAccJerkMeanX</td>
  <td></td>
 </tr>
 <tr>
  <td>tBodyAccJerkMeanY</td>
  <td></td>
 </tr>
 <tr>
  <td>tBodyAccJerkMeanZ</td>
  <td></td>
 </tr>
 <tr>
  <td>tBodyGyroMeanX</td>
  <td></td>
 </tr>
 <tr>
  <td>tBodyGyroMeanY</td>
  <td></td>
 </tr>
 <tr>
  <td>tBodyGyroMeanZ</td>
  <td></td>
 </tr>
 <tr>
  <td>tBodyGyroJerkMeanX</td>
  <td></td>
 </tr>
 <tr>
  <td>tBodyGyroJerkMeanY</td>
  <td></td>
 </tr>
 <tr>
  <td>tBodyGyroJerkMeanZ</td>
  <td></td>
 </tr>
 <tr>
  <td>tBodyAccMagMean</td>
  <td></td>
 </tr>
 <tr>
  <td>tGravityAccMagMean</td>
  <td></td>
 </tr>
 <tr>
  <td>tBodyAccJerkMagMean</td>
  <td></td>
 </tr>
 <tr>
  <td>tBodyGyroMagMean</td>
  <td></td>
 </tr>
 <tr>
  <td>tBodyGyroJerkMagMean</td>
  <td></td>
 </tr>
 <tr>
  <td>fBodyAccMeanX</td>
  <td></td>
 </tr>
 <tr>
  <td>fBodyAccMeanY</td>
  <td></td>
 </tr>
 <tr>
  <td>fBodyAccMeanZ</td>
  <td></td>
 </tr>
 <tr>
  <td>fBodyAccJerkMeanX</td>
  <td></td>
 </tr>
 <tr>
  <td>fBodyAccJerkMeanY</td>
  <td></td>
 </tr>
 <tr>
  <td>fBodyAccJerkMeanZ</td>
  <td></td>
 </tr>
 <tr>
  <td>fBodyGyroMeanX</td>
  <td></td>
 </tr>
 <tr>
  <td>fBodyGyroMeanY</td>
  <td></td>
 </tr>
 <tr>
  <td>fBodyGyroMeanZ</td>
  <td></td>
 </tr>
 <tr>
  <td>fBodyAccMagMean</td>
  <td></td>
 </tr>
 <tr>
  <td>fBodyAccJerkMagMean</td>
  <td></td>
 </tr>
 <tr>
  <td>fBodyGyroMagMean</td>
  <td></td>
 </tr>
 <tr>
  <td>fBodyGyroJerkMagMean</td>
  <td></td>
 </tr>
 <tr>
  <td>tBodyAccstdX</td>
  <td></td>
 </tr>
 <tr>
  <td>tBodyAccstdY</td>
  <td></td>
 </tr>
 <tr>
  <td>tBodyAccstdZ</td>
  <td></td>
 </tr>
 <tr>
  <td>tGravityAccstdX</td>
  <td></td>
 </tr>
 <tr>
  <td>tGravityAccstdY</td>
  <td></td>
 </tr>
 <tr>
  <td>tGravityAccstdZ</td>
  <td></td>
 </tr>
 <tr>
  <td>tBodyAccJerkstdX</td>
  <td></td>
 </tr>
 <tr>
  <td>tBodyAccJerkstdY</td>
  <td></td>
 </tr>
 <tr>
  <td>tBodyAccJerkstdZ</td>
  <td></td>
 </tr>
 <tr>
  <td>tBodyGyrostdX</td>
  <td></td>
 </tr>
 <tr>
  <td>tBodyGyrostdY</td>
  <td></td>
 </tr>
 <tr>
  <td>tBodyGyrostdZ</td>
  <td></td>
 </tr>
 <tr>
  <td>tBodyGyroJerkstdX</td>
  <td></td>
 </tr>
 <tr>
  <td>tBodyGyroJerkstdY</td>
  <td></td>
 </tr>
 <tr>
  <td>tBodyGyroJerkstdZ</td>
  <td></td>
 </tr>
 <tr>
  <td>tBodyAccMagstd</td>
  <td></td>
 </tr>
 <tr>
  <td>tGravityAccMagstd</td>
  <td></td>
 </tr>
 <tr>
  <td>tBodyAccJerkMagstd</td>
  <td></td>
 </tr>
 <tr>
  <td>tBodyGyroMagstd</td>
  <td></td>
 </tr>
 <tr>
  <td>tBodyGyroJerkMagstd</td>
  <td></td>
 </tr>
 <tr>
  <td>fBodyAccstdX</td>
  <td></td>
 </tr>
 <tr>
  <td>fBodyAccstdY</td>
  <td></td>
 </tr>
 <tr>
  <td>fBodyAccstdZ</td>
  <td></td>
 </tr>
 <tr>
  <td>fBodyAccJerkstdX</td>
  <td></td>
 </tr>
 <tr>
  <td>fBodyAccJerkstdY</td>
  <td></td>
 </tr>
 <tr>
  <td>fBodyAccJerkstdZ</td>
  <td></td>
 </tr>
 <tr>
  <td>fBodyGyrostdX</td>
  <td></td>
 </tr>
 <tr>
  <td>fBodyGyrostdY</td>
  <td></td>
 </tr>
 <tr>
  <td>fBodyGyrostdZ</td>
  <td></td>
 </tr>
 <tr>
  <td>fBodyAccMagstd</td>
  <td></td>
 </tr>
 <tr>
  <td>fBodyAccJerkMagstd</td>
  <td></td>
 </tr>
 <tr>
  <td>fBodyGyroMagstd</td>
  <td></td>
 </tr>
 <tr>
  <td>fBodyGyroJerkMagstd</td>
  <td></td>
 </tr>
</table>




[john gruber]:http://daringfireball.net/
[@thomasfuchs]:http://twitter.com/thomasfuchs
[1]:http://daringfireball.net/projects/markdown/
[marked]:https://github.com/chjj/marked
[Ace Editor]:http://ace.ajax.org
[node.js]:http://nodejs.org
[Twitter Bootstrap]:http://twitter.github.com/bootstrap/
[keymaster.js]:https://github.com/madrobby/keymaster
[jQuery]:http://jquery.com
[@tjholowaychuk]:http://twitter.com/tjholowaychuk
[express]:http://expressjs.com
