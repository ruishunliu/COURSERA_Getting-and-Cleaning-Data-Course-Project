library(plyr)
# Downloading data.
if(!file.exists("./newdata")){dir.create("./newdata")}
setwd(paste0(getwd(),"/newdata"))
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dataname<-"dataset.zip"
download.file(fileUrl,dataname,method = "curl")
# unzip dataset
unzip(zipfile="dataset.zip")
# 1.Merges the training and the test sets to create one data set.
#   Reading data.
setwd(paste0(getwd(),"/UCI HAR Dataset"))
x_train_data<-read.table("./train/X_train.txt")
y_train_data<-read.table("./train/y_train.txt")
subject_train_data<-read.table("./train/subject_train.txt")
x_test_data<-read.table("./test/X_test.txt")
y_test_data<-read.table("./test/y_test.txt")
subject_test_data<-read.table("./test/subject_test.txt")
features_data<-read.table("features.txt")
activity_labels_data<-read.table("activity_labels.txt")
# Assigning column names
colnames(x_train_data)<-features_data[,2]
colnames(y_train_data)<-"activityID"
colnames(subject_train_data)<-"subjectID"
colnames(x_test_data)<-features_data[,2]
colnames(y_test_data)<-"activityID"
colnames(subject_test_data)<-"subjectID"
colnames(activity_labels_data)<-c('activityID','activityType')
# Merging all data
merge_train<-cbind(y_train_data,subject_train_data,x_train_data)
merge_test<-cbind(y_test_data,subject_test_data,x_test_data)
allData<-rbind(merge_train,merge_test)
# 2.Extracts only the measurements on the mean and standard deviation for
# each measurement.
colNAMES<-colnames(allData)
mean_std_data<-(grepl("activityID",colNAMES) |
                grepl("subjectID",colNAMES) |
                grepl("mean..",colNAMES) |
                grepl("std..",colNAMES))
setdata_Mean_Std<-allData[,mean_std_data==TRUE]

# 3.Uses descriptive activity names to name the activities in the data set.
setdata_ActivityNames<-merge(setdata_Mean_Std,activity_labels_data,
                             by="activityID",
                             all.x=TRUE)

# 4.Appropriately labels the data set with descriptive variable names.
# This step was made in previos steps.

# 5.From the data set in step 4, creates a second, independent tidy data set
# with the average of each variable for each activity and each subject.
secTidyDataset<-aggregate(. ~subjectID + activityID,setdata_ActivityNames,mean)
secTidyDataset<-secTidyDataset[order(secTidyDataset$subjectID,secTidyDataset$activityID),]

write.table(secTidyDataset,"secTidyDataset.txt",row.names = FALSE)