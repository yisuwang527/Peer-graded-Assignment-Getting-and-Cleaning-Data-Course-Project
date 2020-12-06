library(dplyr)

#Step 0. Downloading and unzipping dataset

#the data for the project were downloaded and unzipped in working directory:
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")
unzip(zipfile="./data/Dataset.zip",exdir="./data")

#=========================================================

#Step 1.Merges the training and the test sets to create one data set.

# 1.a Reading files

# Read trainings data:
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

# Read testing data:
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# Read the list of feature vector:
features <- read.table('./data/UCI HAR Dataset/features.txt')

# Read the list of activity labels:
activityLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt')

# # 1.b Assign column names 

# column in x_ set are from the list of feature vector:
colnames(x_train) <- features[,2]
colnames(x_test) <- features[,2]

# name other sets:
colnames(y_train) <-"activityId"
colnames(y_test) <- "activityId"
colnames(subject_train) <- "subjectId"
colnames(subject_test) <- "subjectId"
colnames(activityLabels) <- c('activityId','activityType')

#1.c combine training and test data set into one data set callled allData:
x_all <- rbind(x_train, x_test)
y_all <- rbind(y_train, y_test)
subject_all <- rbind(subject_train, subject_test)
combined_data <- cbind(subject_all, y _all, x_all)

#=========================================================

#Step 2.-Extracts only the measurements on the mean and standard deviation for each measurement.

tidy_Data <- combined_data %>% select(subjectId, activityId, contains("mean"), contains("std"))

#=========================================================

#Step 3. Uses descriptive activity names to name the activities in the data set

tidy_Data$activityId <-activityLabels[tidy_Data$activityId, 2]

#=========================================================

#Step 4. Appropriately labels the data set with descriptive variable names.

names(tidy_Data)<-gsub("activityId", "activity", names(tidy_Data))
names(tidy_Data)<-gsub("Acc", "Accelerometer", names(tidy_Data))
names(tidy_Data)<-gsub("Gyro", "Gyroscope", names(tidy_Data))
names(tidy_Data)<-gsub("angle", "Angle", names(tidy_Data))
names(tidy_Data)<-gsub("gravity", "Gravity", names(tidy_Data))
names(tidy_Data)<-gsub("^t", "Time", names(tidy_Data))
names(tidy_Data)<-gsub("^f", "Frequency", names(tidy_Data))
names(tidy_Data)<-gsub("BodyBody", "Body", names(tidy_Data))
names(tidy_Data)<-gsub("tBody", "TimeBody", names(tidy_Data))
names(tidy_Data)<-gsub("Mag", "Magnitude", names(tidy_Data))
names(tidy_Data)<-gsub("-freq()", "Frequency", names(tidy_Data), ignore.case = TRUE)
names(tidy_Data)<-gsub("-mean()", "Mean", names(tidy_Data), ignore.case = TRUE)
names(tidy_Data)<-gsub("-std()", "STD", names(tidy_Data), ignore.case = TRUE)

#=========================================================

#Step 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#5.a Making a second tidy data set
tidy_Data_2 <- tidy_Data %>% group_by(subjectId, activity) %>% summarise_all(funs(mean))

#5.b Writing second tidy data set in txt file
write.table(tidy_Data_2, "tidy_Data_2.txt", row.name=FALSE)




