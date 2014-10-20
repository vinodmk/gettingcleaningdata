
#Runs from "UCI HAR Dataset" directory
#Setup working directoy
# setwd('/Coursera/UCI HAR Dataset')

##  Read all of the required files 
#Read the data sets (train & test)
train.x<-read.table('train/X_train.txt')
test.x<-read.table('test/X_test.txt')

# Read subject (train & test)
trainSubject <- read.table("train/subject_train.txt")
testSubject <- read.table("test/subject_test.txt")

# Read Lables (train & test)
train.y<-read.table('train/Y_train.txt')
test.y<-read.table('test/Y_test.txt')

#Read the feature names
features.names<-read.table('features.txt',stringsAsFactors=FALSE)

#Read activity labels
activity.labels<-read.table('activity_labels.txt',stringsAsFactors=FALSE)


# Step 1: Merge Train & Test
combined.x<-rbind(train.x,test.x)
#Give Names as in Features
names(combined.x)<-features.names[,2]

#Step  2: Extracts only the measurements on the mean and standard deviation for each measurement. 
#Get position of columns that have mean or standard deviation
mean.sd.pos<-which(grepl("-mean|-std",features.names[,2]))

# Create new dataset with mean and sd values
combined.mean.sd<-combined.x[,mean.sd.pos]

# Get names of the columns - for cleaning and assigning descriptive names
names.data<-names(combined.mean.sd)

# Make sure there are no duplicate names (there are duplicates in orginal)
sum(duplicated(names.data))

#Expand Definitions to make it readable
names.data<-sub("^[t]","time",names.data)
names.data<-sub("^[f]","frequency",names.data)
names.data<-sub("Acc","Accelerometer",names.data)
names.data<-sub("Gyro","Gyroscope",names.data)
names.data<-sub("Mag","Magnitude",names.data)

# Remove special characters to make it usable name
#remove '()'
names.data<-gsub("\\(|\\)","",names.data)
#remove , and - replace them with a . (dot)
names.data<-gsub(",|-",".",names.data)

#Assign cleand column names back to the data set
names(combined.mean.sd) <-names.data

# Merge the subject 
combined.subject <- rbind(trainSubject,testSubject)
names(combined.subject)<- c("subject")

# Add the subject column to the dataset
combined.mean.sd <- cbind(combined.mean.sd,combined.subject)


# Step 3: Uses descriptive activity names to name the activities in the data set
combined.y<-rbind(train.y,test.y)
names(combined.y)<-c("ActivityNo")

#Assign proper labels to each of the activity
combined.y$activity<-activity.labels[combined.y$ActivityNo,2]

#Drop the ActivityNo column as its not needed 
combined.y<-subset(combined.y,select = -c(ActivityNo))

# Add the Activity column to our dataset
combined.mean.sd<-cbind(combined.mean.sd,combined.y)

# Step 5: From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
tidyData <- aggregate(. ~ subject + activity, combined.mean.sd, mean)
write.table(tidyData, "tidyData.txt",row.names=FALSE)

