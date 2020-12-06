---
title: "README"
author: "Yisu"
date: "06/12/2020"
output:
  pdf_document: default
  html_document: default
---

The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

  1) a tidy data set as described below, 
  2) a code book that describes the variables, the data, and any transformations or work that I performed to clean up the data called CodeBook.md. 
  3) a README.md explains how all of the scripts work and how they are connected.

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

I created one R script called run_analysis.R that does the following.

  Step 1. Merges the training and the test sets to create one data set.
  
  Step 2. Extracts only the measurements on the mean and standard deviation for each measurement.
  
  Step 3. Uses descriptive activity names to name the activities in the data set
  
  Step 4. Appropriately labels the data set with descriptive variable names.
  
  Step 5. From the data set in step 4, creates a second, named as tidy_Data_2.txt, independent tidy data set with the average of each variable for each activity and each subject.



