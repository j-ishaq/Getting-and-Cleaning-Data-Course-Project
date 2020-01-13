# Getting-and-Cleaning-Data-Course-Project
This file briefly introduces the course project work carried out under "Getting and Cleaning Data" course by Coursera. The files created and the tasks performed during this project are described below. For reference, course information is also provided.

## Course Information
- Course: Getting and Cleaning Data
- Specialization: Data Science and Data Science: Foundations using R
- Offered by Coursera &amp; Johns Hopkins University
- Link: https://www.coursera.org/learn/data-cleaning

## Project Files:
- run_analysis.R (R script for extracting the data and making a new dataset)
- codebook (Codebook containing the description of all the variables defined in the R script)
- README.md (File providing the brief description of the files created and all the steps performed to complete this project)

## Project Tasks:
- Analyse and extract data from an untidy dataset
- Perform some processing on the dataset (merging, labeling, filtering)
- Making a new tidy dataset

## Main steps in the script file (run_analysis.R):
- Define paths to the main folder, "train" dataset folder and "test" dataset folder
- Extract test variables from "features.txt" file and define indices for mean and standard deviation tests
- Extract values from "X_train.txt", "y_train.txt" and "subject_train.txt" files
- Extract values from "X_test.txt", "y_test.txt" and "subject_test.txt" files
- Merge train and test datasets and label all the variables
- Extract mean and standard deviation test measurements from the merged dataset
- Define data frames for activity labels, subjects and activity description
- Define the dataset which contains subjects, activity labels, activity description and mean and standard deviation test measurements
- Create a grouped dataset which contains the the grouping of the original dataset by subject and by activity
- Create a new dataset calculating the average of all mean and std variables for each subject and for each activity
