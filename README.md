# Getting and Cleaning Data Course Project

## Overview

This repository contains the course project for the Getting and Cleaning Data course. The project processes data collected from the accelerometers of the Samsung Galaxy S smartphone as part of the Human Activity Recognition Using Smartphones Dataset.

The analysis combines the training and test datasets, extracts measurements related to means and standard deviations, assigns descriptive activity and variable names, and creates an independent tidy dataset containing the average of each selected measurement for each subject and activity.

## Files

- run\_analysis.R – R script that performs all data cleaning and transformation steps.
- tidyData.txt – Final tidy dataset containing average values for each subject and activity.
- CodeBook.md – Describes the source data, variables, and transformations.
- README.md – Explains the project and how the analysis is performed.

## Source Data

The analysis uses the UCI Human Activity Recognition Using Smartphones Dataset.

The original dataset contains measurements from 30 subjects performing six activities while wearing a Samsung Galaxy S smartphone.

The six activities are:

1. WALKING
2. WALKING\_UPSTAIRS
3. WALKING\_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

## Analysis

The run\_analysis.R script performs the following steps:

1. Reads the feature names and activity labels.
2. Reads the training measurement, activity, and subject files.
3. Reads the test measurement, activity, and subject files.
4. Merges the training and test observations into common datasets.
5. Extracts only measurements containing mean() or std().
6. Combines the subject identifiers, activity identifiers, and selected measurements.
7. Replaces numeric activity identifiers with descriptive activity names.
8. Replaces abbreviated measurement names with more descriptive variable names.
9. Groups the observations by subject and activity.
10. Calculates the mean of every selected measurement for each subject/activity combination.
11. Writes the resulting tidy dataset to tidyData.txt.

## Output

The final tidyData.txt dataset contains:

- 30 subjects
- 6 activities per subject
- 180 rows representing all subject/activity combinations
- 66 summarized measurement variables
- 68 columns in total, including subject and activity

Each measurement column in the final dataset contains the average of that measurement for one subject performing one activity.

## Running the Analysis

Place the extracted UCI HAR Dataset directory in the R working directory and run:

source("run\_analysis.R")

The script creates tidyData.txt in the current working directory.