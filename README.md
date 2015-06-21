# Introduction
  This is a repo for https://class.coursera.org/getdata-015 's course project.


1. You have to download
   "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
   and extract the zip file to the same directory with
   "run_analysis.R". Once you have done, you directory sturcture shall be:
   + CodeBook.md
   + README.md
   + run_analysis.R
   + UCI HAR Dataset

2. Run "source run_analysis.R" in R, which will generate a file named
"result.txt" in the current directory.

## What does run_analysis.R do
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Codebook
See Codebook.md for more details.
