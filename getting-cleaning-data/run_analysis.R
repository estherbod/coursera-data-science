library(data.table)
library(dplyr)

# This function merges the subject, X and y files into one dataframe. The argument 'dataset' specifies
# whether the 'train' or 'test' files must be merged. The first column of the resulting dataframe contains
# the subjects; the second column contains the activities and the other columns contain the features.
merge_files <- function(dataset) {
  subjects <- as.numeric(readLines(paste0("UCI HAR Dataset/", dataset, "/subject_", dataset, ".txt")))
  activities <- readLines(paste0("UCI HAR Dataset/", dataset, "/y_", dataset, ".txt"))
  features <- read.table(paste0("UCI HAR Dataset/", dataset, "/X_", dataset, ".txt"), sep = "")
  cbind(subjects, activities, features)
}

run_analysis <- function() {
  # Read the features
  features <- read.table("UCI HAR Dataset/features.txt", sep = " ", stringsAsFactors = FALSE)
  # Read the activity labels
  activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", sep = " ")

  # Read the test and training data and merge them into one dataset
  data <- rbind(merge_files("train"), merge_files("test"))
  
  # Set the column names
  names(data) <- make.names(names=c("subject", "activity", features[,2]), unique=TRUE, allow_ = TRUE)

  aggregate_data <- 
      # Select the features with on mean and standard deviation and restrict the data. Keep the subject and activity columns.
      select(data, "subject", "activity", contains("mean..", ignore.case = FALSE), 
          contains("std..", ignore.case = FALSE)) %>%
      # Make the column names more descriptive
      rename_all(funs(
      gsub("\\.\\.", "",
          gsub("^t", "time", 
              gsub("^f", "frequency", 
                  gsub("Acc", "Acceleration", 
                     gsub("Gyro", "AngularVelocity", 
                        gsub("Mag", "Magnitude",
                           gsub("BodyBody", "Body", .))))))))) %>%
      # In the second column of the data, replace the activity numbers by their names
      mutate(activity = sapply(activity, function(a) { 
          activity_labels[which(activity_labels[,1] == a ),][[2]]})) %>%
      # Compute the average of each features per subject and activity
      group_by(subject, activity) %>%
      summarise_all(mean) %>%
      arrange(subject, activity)

    # Write the data frame with averages to a file
  write.table(aggregate_data, file="./averages.txt", row.names=FALSE)
}
