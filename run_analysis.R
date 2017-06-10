# Installs used libraries if they're not installed yet

if(!isTRUE(require(tidyr))) {install.packages("tidyr")}

if(!isTRUE(require(dplyr))) {install.packages("dplyr")}
  

require(tidyr)
require(dplyr)

# Checks if directory is created and, if not, it creates one and then downloads the zip file in it

if(!file.exists("./Getting and cleaning data project")) {
  
  dir.create("./Getting and cleaning data project")
  
} 

if(!file.exists("./Getting and cleaning data project/project.zip")) {
  
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "./Getting and cleaning data project/project.zip")
  
} 


unzip("./Getting and cleaning data project/project.zip",exdir= "./Getting and cleaning data project")

# Reading data

# Reading "test" related data
test_x <- read.table("./Getting and cleaning data project/UCI HAR Dataset/test/X_test.txt")
test_y <- read.table("./Getting and cleaning data project/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./Getting and cleaning data project/UCI HAR Dataset/test/subject_test.txt")

# Reading "train" related data
train_x <- read.table("./Getting and cleaning data project/UCI HAR Dataset/train/X_train.txt")
train_y <- read.table("./Getting and cleaning data project/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./Getting and cleaning data project/UCI HAR Dataset/train/subject_train.txt")

# Reading data related to both

variable_names <- read.table("./Getting and cleaning data project/UCI HAR Dataset/features.txt")
activity_labels<- read.table("./Getting and cleaning data project/UCI HAR Dataset/activity_labels.txt")

# Getting "variable_names" on a vector and assigning it as dataset's variable names

variable_names_vector <- as.character(variable_names[,2])
names(test_x) <- variable_names_vector
names(train_x) <- variable_names_vector

# Creating "subject" column

subject_test_vector <- as.factor(subject_test[,1])


subject_train_vector <- as.factor(subject_train[,1])


# Creating "activity" column

activity_test_vector <- as.factor(test_y[,1])


activity_train_vector <- as.factor(train_y[,1])


activity_labels_vector <- activity_labels[,2]

levels(activity_test_vector) <- activity_labels_vector
levels(activity_train_vector) <- activity_labels_vector

# Creating "Test" and "Train" dataset
test_dataset <- cbind(test_x,subject_test_vector,activity_test_vector)
colnames(test_dataset)[562] <- "Subject"
colnames(test_dataset)[563] <- "Activity"

train_dataset <- cbind(train_x,subject_train_vector,activity_train_vector)
colnames(train_dataset)[562] <- "Subject"
colnames(train_dataset)[563] <- "Activity"

# Merging both datasets

unified_dataset <- rbind(test_dataset,train_dataset)

# Extracting only the important columns
relevant_variables <- c(grep("mean\\(\\)|std\\(\\)",variable_names_vector),562,563)
relevant_unified_dataset <- unified_dataset[,relevant_variables]

# Giving descriptive variable names


names(relevant_unified_dataset) <- gsub("Acc", "Accelerometer", names(relevant_unified_dataset))
names(relevant_unified_dataset) <- gsub("Gyro", "Gyroscope", names(relevant_unified_dataset))
names(relevant_unified_dataset) <- gsub("Mag", "Magnitude", names(relevant_unified_dataset))
names(relevant_unified_dataset) <- gsub("mean\\(\\)","Mean", names(relevant_unified_dataset))
names(relevant_unified_dataset) <- gsub("std\\(\\)","StandardDeviation",names(relevant_unified_dataset))                  
names(relevant_unified_dataset) <- gsub("^t", "Time", names(relevant_unified_dataset))
names(relevant_unified_dataset) <- gsub("^f", "Frequency", names(relevant_unified_dataset))
names(relevant_unified_dataset) <- gsub("-", "_", names(relevant_unified_dataset))


# Creating a second dataset with the means of each variable, for each subject and each activity

second_dataset <- group_by(relevant_unified_dataset,Subject ,Activity)
second_dataset_summarized <- summarise_each(second_dataset,funs(mean))

write.table(second_dataset_summarized,file = "independent_tidy_dataset.txt",row.names = FALSE)


  
        
  

