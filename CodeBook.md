# Code Book for run_analysis.R


## Pre-Requisite: 
* Download file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
* unzip to a directory
* set the working directory as the unzipped directory

## Code Description

## Reading part
1. Read the datasets into train.x & test.x
2. Read subject (train & test) into trainSubject and testSubject
3. Read Lables (train & test) into train.y and test.y
4. Read the feature names into features.names
5. Read activity labels into activity.labels

## Processing

**Note: Steps here are the steps from the project assignment.
Since it made sense to me do step 4 before step 3 they are swapped**

### Step 1: 
1. Merge Train & Test datasets
2. Assign names from features file 

### Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
1. Get position of columns that have mean or standard deviation
2. Create new dataset with mean and sd values

### Step 4: Appropriately labels the data set with descriptive variable names. 
1. Get names of the columns - for cleaning and assigning descriptive names
2. Make sure there are no duplicate names (there are duplicates in orginal)
3. Expand Definitions to make it readable (makes it very long but thats what is asked in this assignment)
4. Remove special characters to make it usable name get rid of ( , - 
5. Assign cleand column names back to the data set
6. Merge and add the subject column to the dataset

### Step 3: Uses descriptive activity names to name the activities in the data set
1. Assign proper labels to each of the activity
2. Add the Activity column to our dataset

### Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
1. Done with aggregate function
3. write out the tidyData.txt





