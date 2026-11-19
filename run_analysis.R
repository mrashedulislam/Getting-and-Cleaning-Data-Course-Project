# Getting and Cleaning Data Course Project
# run_analysis.R

# Dataset location
data_dir <- "UCI HAR Dataset"

# Read feature names and activity labels
features <- read.table(
  file.path(data_dir, "features.txt"),
  stringsAsFactors = FALSE
)

activities <- read.table(
  file.path(data_dir, "activity_labels.txt"),
  stringsAsFactors = FALSE
)

# Read training data
x_train <- read.table(
  file.path(data_dir, "train", "X_train.txt")
)

y_train <- read.table(
  file.path(data_dir, "train", "y_train.txt")
)

subject_train <- read.table(
  file.path(data_dir, "train", "subject_train.txt")
)

# Read test data
x_test <- read.table(
  file.path(data_dir, "test", "X_test.txt")
)

y_test <- read.table(
  file.path(data_dir, "test", "y_test.txt")
)

subject_test <- read.table(
  file.path(data_dir, "test", "subject_test.txt")
)

# Apply feature names
names(x_train) <- features[, 2]
names(x_test) <- features[, 2]

# ------------------------------------------------------------
# 1. Merge the training and test sets
# ------------------------------------------------------------

x_all <- rbind(x_train, x_test)
y_all <- rbind(y_train, y_test)
subject_all <- rbind(subject_train, subject_test)

# ------------------------------------------------------------
# 2. Extract measurements on mean and standard deviation
# ------------------------------------------------------------

# Keep only features containing mean() or std()
mean_std_cols <- grep("mean\\(\\)|std\\(\\)", features[, 2])

x_mean_std <- x_all[, mean_std_cols]

# Add subject and activity identifiers
names(subject_all) <- "subject"
names(y_all) <- "activity"

merged_data <- cbind(
  subject_all,
  y_all,
  x_mean_std
)

# ------------------------------------------------------------
# 3. Use descriptive activity names
# ------------------------------------------------------------

# Replace activity IDs with descriptive activity labels
merged_data$activity <- activities[
  match(merged_data$activity, activities[, 1]),
  2
]

# Convert activity to a factor
merged_data$activity <- factor(
  merged_data$activity,
  levels = activities[, 2]
)

# ------------------------------------------------------------
# 4. Appropriately label the data set with descriptive names
# ------------------------------------------------------------

old_names <- names(merged_data)
new_names <- old_names

# Expand abbreviations
new_names <- gsub("^t", "Time", new_names)
new_names <- gsub("^f", "Frequency", new_names)
new_names <- gsub("Acc", "Accelerometer", new_names)
new_names <- gsub("Gyro", "Gyroscope", new_names)
new_names <- gsub("Mag", "Magnitude", new_names)
new_names <- gsub("BodyBody", "Body", new_names)

# Make mean and standard deviation explicit
new_names <- gsub("mean\\(\\)", "Mean", new_names)
new_names <- gsub("std\\(\\)", "StandardDeviation", new_names)

# Remove punctuation
new_names <- gsub("-", "", new_names)
new_names <- gsub("\\(|\\)", "", new_names)

names(merged_data) <- new_names

# ------------------------------------------------------------
# 5. Create an independent tidy data set with the average
#    of each variable for each activity and each subject
# ------------------------------------------------------------

tidy_data <- aggregate(
  merged_data[, -(1:2)],
  by = list(
    subject = merged_data$subject,
    activity = merged_data$activity
  ),
  FUN = mean
)

# Order by subject and activity
tidy_data <- tidy_data[
  order(tidy_data$subject, tidy_data$activity),
]

row.names(tidy_data) <- NULL

# Write the final tidy data set
write.table(
  tidy_data,
  file = "tidyData.txt",
  row.names = FALSE
)
