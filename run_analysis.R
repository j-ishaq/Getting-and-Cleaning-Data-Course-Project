library(dplyr)

# rm(list=ls()) # remove all objects from the working environment

path_main <- "" # Provide the path to the main folder containing all files
path_train <- "" # Provide the path to "train" dataset folder
path_test <- "" # Provide the path to "test" dataset folder

setwd(path_main)

f <- read.table("features.txt") # Extract test variables from "features.txt" file
features <- as.character(f$V2)

mean_ind <- grep("mean", features) # indices for mean() tests
std_ind <- grep("std", features) # indices for std() tests
freq_ind <- grep("Freq", features) # indices for meanFreq() tests
mean_ind <- mean_ind[-(which(mean_ind %in% freq_ind))] # remove meanFreq variables

setwd(path_train)
xtrain <- read.table("X_train.txt") # read values from "X_train.txt" file
ytrain <- read.table("y_train.txt") # read values from "y_train.txt" file
subtrain <- read.table("subject_train.txt") # read values from "subject_train.txt" file

setwd(path_test)
xtest <- read.table("X_test.txt") # read values from "X_test.txt" file
ytest <- read.table("y_test.txt") # read values from "y_test.txt" file
subtest <- read.table("subject_test.txt") # read values from "subject_test.txt" file

tests <- rbind(xtrain, xtest) # merge train and test datasets
names(tests) <- features # label the variables
tests_mean_std <- tests[c(mean_ind, std_ind)] # extract mean and standard deviation test measurements

act_labels <- rbind(ytrain, ytest) # data frame containing the activity labels (1-6) for all test measurements
subjects <- rbind(subtrain, subtest) # data frame containing the subjects (1-30) for all test measurements

# Assign description to all activity labels (extract description from "activity_labels.txt" file)
act_desc <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING") # Activities description vector
activity <- c()
for (i in 1:nrow(act_labels)) {
    if (act_labels$V1[i]==1){
        act <- act_desc[1]
    } else if (act_labels$V1[i]==2){
        act <- act_desc[2]
    } else if (act_labels$V1[i]==3){
        act <- act_desc[3]
    } else if (act_labels$V1[i]==4){
        act <- act_desc[4]
    } else if (act_labels$V1[i]==5){
        act <- act_desc[5]
    } else {
        act <- act_desc[6]
    }
    activity <- c(activity, act)
}
activity <- as.data.frame(activity)

names(subjects) <- "SUBJECT"
names(act_labels) <- "ACTIVITY LABEL"
names(activity) <- "ACTIVITY"

# Create a dataset containing following items:
    # subjects,
    # activity labels & their description,
    # mean and standard deviation test measurements
dataset <- cbind(subjects, act_labels, activity, tests_mean_std)
dataset <- arrange(dataset, dataset$SUBJECT, dataset$`ACTIVITY LABEL`) # arrange the dataset w.r.t. SUBJECT and ACTIVITY LABEL

# Group the dataset by subject and activity
dataset_grouped <- dataset %>% group_by(dataset$SUBJECT, dataset$ACTIVITY)

# calculate average of the grouped dataset; average is calculated for all mean and std variables
dataset_mean <- summarise_at(dataset_grouped, c(4:69), mean)
