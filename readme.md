### Introduction

This is the project for the Data Cleaning Course on Coursera. Contained in this repo is this file (README.md), a code book (**), and a function called run_analysis.R that performs the 5 requirements for this project.

The following is copied from https://class.coursera.org/getdata-031/human_grading/view/courses/975115/assessments/3/submissions, describing the data for the project and the 5 requirements:

"One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The R script called run_analysis.R should do the following: 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject."

This dataset comes from following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012


### About MY run_analysis.R

I wrote this script as a function that downloads the zip file containing the data (if not already downloaded into a subdirectory of the working directory called data) and then unzips the file, and reads the resulting files into R.  The code assumes that the data is already downloaded if the directory ./data/UCI HAR Dataset exists as this is a resulting directory from the unzip of the data file.  To run this function type:

run_analysis()

The function returns the tidy data set as described in step 5 above, so you may want to assign the output to a variable as in:

tidydata <-run_analysis()

It also writes the data into a spaced delimited file called tidydata.txt.  This file can be read in to R using the following command:

tidydata <-read.table("tidydata.txt",header=TRUE)

The script is heavily commented, describing the steps taken to complete each of the 5 tasks.  They are not, however, done in order because some I had completed before I saw that was a future task.  However, I did label where each task is performed.

### About the resulting tidy data set

This data set has 180 rows of 68 variables.  The 180 rows consists of 6 rows for each of 30 study participants, where each of the 6 rows corresponds to one of the activities the participant engaged in while wearing a smartphone (Samsung Galaxy S II) on their waist that had an embedded accelerometer and gyroscope. The first two variables consist of a participant ID ("subject") and an activity identifier (walking, walking upstairs, walking_downstairs, sitting, standing, laying). The next 66 are averages across that participant and that activity for each of 66 measurements compiled from each paricipant's smartphone data (see codebook for more detailed information about the variables.)

Note that this data set meets the principles of a tidy data set because:

1. Each row corresponds to one observation (person/activity as each person does 6 activities)
2. Each column corresponds to one variable: the average of that person/activity across all of his or her values for that variables as contained in the original data files. Each person had different values for the same activity as each value corresponds to a different time window.
3. There is one table only, with no duplicate columns
