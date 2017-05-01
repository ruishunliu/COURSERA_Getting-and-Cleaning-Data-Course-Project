# CODE BOOK

# How to use?
Performing the R script named run_analysis.R, then getting the result named secTidyDataset.txt who is a tidy data set.

# Source data set
A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

About R script
* `Download data set`
* `Unzip data set`
* `1.Merges the training and the test sets to create one data set.`
* `Reading data`
* `Assigning column names`
* `Merging all data`
* `2.Extracts only the measurements on the mean and standard deviation for each measurement.`
* `3.Uses descriptive activity names to name the activities in the data set.`
* `4.Appropriately labels the data set with descriptive variable names. This step was made in previos steps.`
* `5.From the data set in step 4, creates a second, independent tidy data set`
* `With the average of each variable for each activity and each subject.`

# Variables:
* `x_train_data`, `y_train_data`, `x_test_data`, `y_test_data`, `subject_train_data` and `subject_test_data` contain the data from the downloaded files.
* 'merge_train`, `merge_test` and `allData` merge the previous datasets to further analysis.
* `secTidyDataset` contains the result data, which is a tidy data set.
