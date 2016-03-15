
## Read Me First

The files in this repository represent the output from the final assignment for the Getting and Cleaning Data Course from Johns Hopkins and Coursera.org.

The objective of this assignment was to begin with raw data from a human factors study conducted in 2012 by researchers in Italy, and process said data into two usable 'tidy' data sets.

Both of these tidy datasets are in the repository.

*   "tidy_data_full.csv": 
    * Within this dataset are 10299 records and 84 columns of data (Please refer to the CODEBOOK.md file within this repository for a detailed description of this data set)

*   "tidy_data_small.csv":
    * With only 180 records of data, this summary file represents the average of each measurement of the 'full' file for each activity and each subject.
    
Other files in the repository:

*  "run_analysis.R":
    * This is the script file that organizes the full data into the two tidy data sets.
    
*   "CODEBOOK.md":
    * This file details each variable in the two data sets.

The original study is described here:

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

In brief, movement data was collected for 30 research participants performing six different activities.  A massive amount of data was captured and processed during the study and stored in a number of data files.

The assignment was to write an R script to read in the appropriate data, process it, and output to the two tidy sets described above.

To read in the appropriate data seven files were accessed:

      x_test <- read.table("./UCI HAR Dataset/test/X_test.txt", quote="\"", comment.char="")
      y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", quote="\"", comment.char="")  
      subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", quote="\"", comment.char="") 
      x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", quote="\"", comment.char="")
      y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", quote="\"", comment.char="")  
      subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", quote="\"", comment.char="")
      features <- read.csv("./UCI HAR Dataset/features.txt", sep="", header=FALSE, stringsAsFactors=FALSE)

Originally, researchers had broken their data out into separate "test" and "train" folders.  

"X_test"" and "X_train" contain data on which activity was performed

"subject_test" and "subject_train" contain data on which subject did the test

"y_test"" and "y_train" contain raw calculated data based on the measurements made during the tests

The assignment contained several specific tasks intended to make the data more useable:

* Combine the "test" and "train" data sets
* Combine the raw data, subject ID and activity ID into one large table
* Add descriptive titles to the columns
* Remove many of the data columns, leaving only columns that included mean or standara deviation measurements
     

### Notes and Dependancies

The "run_analysis.R" script requires that that the full UCI HAR data set reside in the users R working directory in a folder named "UCI HAR Dataset"

That data is available at the following link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The script assumes that the user has the 'DPLYR' package installed on his/her system.


Use of this dataset is acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

