# Code Book

## Study

The source data are from the Human Activity Recognition Using Smartphones Dataset. Measurements were collected using the accelerometer and gyroscope of a Samsung Galaxy S smartphone.

The experiment included 30 subjects performing six different activities.

## Activities

The activity variable contains one of the following descriptive activity labels:

- WALKING
- WALKING\_UPSTAIRS
- WALKING\_DOWNSTAIRS
- SITTING
- STANDING
- LAYING

## Subject

subject identifies the participant in the experiment.

Possible values range from 1 through 30.

## Measurement Selection

The original dataset contains 561 measurement variables.

For this project, only features containing either:

- mean()
- std()

in the original feature name were retained.

This results in 66 measurement variables.

## Variable Naming

Original abbreviated feature names were converted to more descriptive names using the following transformations:

- t at the beginning of a measurement → Time
- f at the beginning of a measurement → Frequency
- Acc → Accelerometer
- Gyro → Gyroscope
- Mag → Magnitude
- mean() → Mean
- std() → StandardDeviation

Hyphens and parentheses were removed from the variable names.

For example:

- tBodyAcc\-mean()\-X becomes TimeBodyAccelerometerMeanX
- tBodyAcc\-std()\-X becomes TimeBodyAccelerometerStandardDeviationX

The suffixes X, Y, and Z indicate the measurement axis where applicable.

## Units and Values

The original measurement variables supplied in the UCI HAR dataset are normalized and bounded within [\-1, 1].

The variables in tidyData.txt are averages of the corresponding selected measurements for each subject/activity combination. Therefore, the summarized measurement values retain the scale of the source measurements.

subject is an identifier and has no physical unit.

activity is a categorical variable and has no physical unit.

## Transformations

The analysis performs the following transformations:

1. The training and test measurement datasets are combined using row binding.
2. Training and test activity identifiers are combined.
3. Training and test subject identifiers are combined.
4. Only features whose original names contain mean() or std() are retained.
5. Subject, activity, and selected measurement data are combined into one dataset.
6. Numeric activity identifiers are replaced with descriptive activity names using activity\_labels.txt.
7. Measurement variables are assigned descriptive names.
8. Data are grouped by subject and activity.
9. The arithmetic mean of each of the 66 selected measurement variables is calculated for every subject/activity combination.

## Final Tidy Dataset

tidyData.txt contains 180 observations and 68 variables.

Each row represents one unique combination of:

- subject
- activity

There are:

- 30 subjects
- 6 activities
- 30 × 6 = 180 subject/activity combinations

The first two variables are subject and activity. The remaining 66 variables contain the mean of each selected measurement for that subject and activity.