# Coursera-Peer-graded-Assignment-Getting-and-Cleaning-Data-Course-Project

## Repository content
The repository consists of the following files:
* README.md - text file describing the repo content, problem and solution
* UCI HAR Dataset - folder containing the raw dataset
* run_analysis.R - R script processing the multiple datasets into a clean data
* clean_data.txt - text file containing the clean data
* summarized_data.txt - text file containing the clean data summarized by average
for each groups (subject and activity)

## Problem Summary
The purpose of the project is to clean data collected by wearable device. The data is
composed of multiple dataset, split into train and test category. The objective of the
exercise is to combine the various datasets into a clean table selecting mean and
standard deviation variables. An additional objective is to summarize the average values 
of variables grouped by subject and by activity.

## Processing
The run_analysis.R script will read and process the raw dataset by compiling the train and test
data, selecting only mean and standard deviation calculations and adding descriptive variable names.
Finally it summarizes the data by the average of the variables for two groups: by subject and by activity.
There are two outputs generated the the script:
* a clean data .txt file named "clean_data.txt"
* a summarized data .txt file of the clean data named "summarized_data.txt"

## Raw data
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 
The raw dataset includes the following files:
* 'README.txt'
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.
The following files are available for the train and test data. Their descriptions are equivalent. 
* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
* 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
* 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 
