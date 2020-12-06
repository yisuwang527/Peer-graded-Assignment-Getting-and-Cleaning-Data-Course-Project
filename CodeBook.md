---
title: "CodeBook"
author: "Yisu"
date: "06/12/2020"
output: pdf_document
---
The run_analysis.R script is written following the 5 steps described in the "Getting and Cleaning Data Course Project" requirements:

#### Preparation
  * Datasets were downloaded and unzipped under the working directory folder.
  * The data files were assigned to variables:

    + features <- features.txt :The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
    + subject_train <- test/subject_train.txt : contains train data of 21/30 volunteer subjects being observed
    + activityLabels <- activity_labels.txt : List of activities performed when the corresponding measurements were taken and its codes (labels)
    + subject_test <- test/subject_test.txt :contains test data of 9/30 volunteer test subjects being observed
    + x_test <- test/X_test.txt : contains recorded features test data
    + y_test <- test/y_test.txt : contains test data of activities’code labels
    + x_train <- test/X_train.txt : contains recorded features train data
    + y_train <- test/y_train.txt : contains train data of activities’code labels

#### Step 1. Merges the training and the test sets to create one data set
  * x_all: combined x_train and x_test via rbind() function
  * y_all: combined y_train and y_test via rbind() function
  * subject_all: combined subject_train and subject_test via rbind() function
  * combined_data: combined subject_all, x_all and y_all via cbind() function

#### Step 2. Extracts only the measurements on the mean and standard deviation for each measurement
  * tidy_Data: subseted combined_data, selecting only columns: subjectId, activityId and the measurements on the mean and standard deviation (std) for each measurement.

#### Step 3. Uses descriptive activity names to name the activities in the data set
The activity id numbers in the tidy_Data were converted onto corresponding activity names according to the id-name table in activityLabels

#### Step 4. Appropriately labels the data set with descriptive variable names
  * activityId column in tidy_Data was renamed as activities
  * Acc in column name was replaced by Accelerometer
  * Gyro in column name was replaced by Gyroscope
  * BodyBody in column name was replaced by Body
  * Mag in in column name was replaced by Magnitude
  * column names start with character f was replaced by Frequency
  * column names start with character t was replaced by Time

#### Step 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
  * tidy_Data_2 was created by sumarizing tidy_Data with the means of each variable for each activity and each subject, after grouping by subject and activity.
  * tidy_Data_2 was exported as tidy_Data_2.txt file in the working directory.