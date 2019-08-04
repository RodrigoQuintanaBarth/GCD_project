--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------

Goal
----

Automating the process of getting raw data ready for analysis

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------

 Requirements
------------

Given data stored at
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>
Perform the following steps:

Create one R script called run\_analysis.R that does the following:

1.  Merges the training and the test sets to create one data set.
2.  Extracts only the measurements on the mean and standard deviation
    for each measurement.
3.  Uses descriptive activity names to name the activities in the data
    set
4.  Appropriately labels the data set with descriptive variable names.
5.  From the data set in step 4, creates a second, independent tidy data
    set with the average of each variable for each activity and
    each subject.

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------

 Script explanation
------------------

### Setting up the environment and storing the files

Our first goal is to read the data inside the zip file in order to get
what we need to format it into a dataframe (typical R structure for tidy
datsets)

First, we need to check if the environment for storing the raw files and
for processing them is ready. If not, we perform the tasks to make sure
it is

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

### Selecting and reading into R the relevant files for transforming txt files into a raw dataframe

After we have everything locally stored, we proceed to read the files
we'll need for building a dataset from the txt files into R objects for
further processing. We know what files are relevant because:

1.  Step 1 from the course's requirements states that we need to merge
    data related to "training" and "test"
2.  After reading the README file for the raw dataset, we get to know
    exactly what txt file belongs to wich dataset

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

### Creating independent "Training" and "Test" datasets

After observing the text files, I noticed there were structured
similarly for test and train datasets, yet it seemed easier to tackle
the next "merging" problem if all the labeling for variables, the class
change for subjects and activities from numeric to factor, as well as
giving activities a more descriptive name (using activity\_labels.txt)
where done independently, creating an intermediate group of raw datasets
for "train" and "test" before the merge.

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
        

### Merging both sub-datasets and making sure it's as tidy as possible

After the previous steps, we had to merge both datasets. It seemd
logically to approach this problem as a vertical merge, as both datasets
shared variable structure (Same amount of columns corresponding to the
same messurement )

The only relevant messures where "mean" and "standard deviation", So
after the merge, I only selected the ones representing those observation
(using a regex to set the rule)

In order to check for tidyness, we needed to make sure that:

1.  Each row represents and observation
2.  Each column represents a variable

In this case, each row represents a unique observation of a unique
Subject, performing a unique activity, and the mean and std of each
messured variable appear in different columns, representing a single
variable, thus, it mostly achieves tidyness.

One of the requirements is that the variables have descriptive names. I
found that the current labels for variables were a little over
abbreviated. Reading features\_info.txt you get to know what does every
abbreviation mean (ex. "t" for "time", "f" for "frequency"). I concluded
that variable names would be more descriptive if I get rid of every
short name and change it for its full name.

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
        

### Creating a second, tidy dataset that shows the average of each variable, for each subject and each activity

For this last part, as all the heavy lifting is already done, it seamed
pretty straight forward to achieve using dyplr functionalities for
grouping observations by factors and then checking if it remains tidy.

        # Creating a second dataset with the means of each variable, for each subject and each activity
        
        second_dataset <- group_by(relevant_unified_dataset,Subject ,Activity)
        second_dataset_summarized <- summarise_each(second_dataset,funs(mean))
        
        write.table(second_dataset_summarized,file = "independent_tidy_dataset.txt",row.names = FALSE)
