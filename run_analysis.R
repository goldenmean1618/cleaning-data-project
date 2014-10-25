
library(plyr)
library(dplyr)

activity.labels <- read.table("UCI_HAR_Dataset/activity_labels.txt")
test.x <- read.table("UCI_HAR_Dataset/test/X_test.txt")
test.y <- read.table("UCI_HAR_Dataset/test/y_test.txt")
test.subject.list <- read.table("UCI_HAR_Dataset/test/subject_test.txt")
features <- read.table("UCI_HAR_Dataset/features.txt")


names(activity.labels) <- c("act", "activity")
names(test.y) <- "act"
names(test.subject.list) <- "subject"

feat <- select(features, V2)
feature.t <- t(feat)
names(test.x) <- feature.t




test.with.activities <- cbind(test.y, test.x)

test.with.activities.and.names <- join(activity.labels, test.with.activities)

test.data <- cbind(test.subject.list,test.with.activities.and.names)

train.x <- read.table("UCI_HAR_Dataset/train/X_train.txt")
train.y <- read.table("UCI_HAR_Dataset/train/y_train.txt")
train.subject.list <- read.table("UCI_HAR_Dataset/train/subject_train.txt")

names(train.y) <- "act"
names(train.subject.list) <- "subject"
names(train.x) <- feature.t


train.with.activities <- cbind(train.y, train.x)

train.with.activities.and.names <- join(activity.labels, train.with.activities)

train.data <- cbind(train.subject.list,train.with.activities.and.names)

total.data <- rbind(train.data,test.data)

total.data <- select(total.data, -act)

mean.std.data <- select(total.data, subject,activity, contains("mean"), contains("std"))

mean.std.data
