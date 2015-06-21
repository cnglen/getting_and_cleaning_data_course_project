## clean all objects
rm(list=ls())

## Merges the training and the test sets to create one data set.
X_test <- read.table('./UCI HAR Dataset/test/X_test.txt')
y_test <- read.table('./UCI HAR Dataset/test/y_test.txt')
subject_test <- read.table('./UCI HAR Dataset/test/subject_test.txt')
subject_train <- read.table('./UCI HAR Dataset/train/subject_train.txt')
X_train <- read.table('./UCI HAR Dataset/train/X_train.txt')
y_train <- read.table('./UCI HAR Dataset/train/y_train.txt')
X <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
names(subject) <- "subject"
X_names <- read.table('./UCI HAR Dataset/features.txt')
names(X_names) <- c("i_col", "name")
names(X) <- X_names$name
names(y) <- "activity"
X <- cbind(X, subject)

## Extracts only the measurements on the mean and standard deviation for each measurement.
i_mean <- grep("mean\\(\\)", names(X))
i_std <- grep("std\\(\\)", names(X))
i_mean_std <- sort(c(i_mean, i_std))
i_all <- c(i_mean_std, ncol(X))
X <- X[, i_all]

## Uses descriptive activity names to name the activities in the data set
## Alread done.

## Appropriately labels the data set with descriptive variable names.
activity_labels <- read.table('./UCI HAR Dataset/activity_labels.txt', stringsAsFactors=FALSE)
levels <- activity_labels[, 1]
labels <- activity_labels[, 2]
y$activity <- factor(y[, 1], levels = levels, labels = labels)

data_set <- cbind(X, y)

## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
my_mean <- function (x) {
    if (is.numeric(x)) {
        return (mean(x))
    } else {
        return (x[[1]])
    }
}

data_set_dummy <- data_set
data_set_dummy$activity <- as.character(data_set_dummy$activity)
data_set_2nd <- ddply(data_set_dummy, .(activity, subject), sapply, my_mean)
write.table(data_set_2nd, 'result.txt', row.name=FALSE)
