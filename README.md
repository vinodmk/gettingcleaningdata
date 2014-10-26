# Getting and Cleaning Data

## Description
Part of Getting and Cleaning Data - Coursera course - project (peer assessment)

## Course Project

You should create one R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Files 
* README.md - This file :)
* run_analysis.R - File with actual R Code
* CodeBook.md - Contains the code description for run_analysis.R

## How run_analysis Works

### Pre-Requisite: 
* Download file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
* unzip to a directory
* set the working directory as the unzipped directory

### Script Steps
1. set working directory to data directory
2. Run run_analysis.R
3. This will create a file tidyData.txt with the average of each variable for each activity and each subject.


