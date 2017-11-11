# Getting and Cleaning Data Course Project

The goal of the project is to tidy the UCI HAR Dataset[1] and create a second dataset with averages measurements from it.
The analysis and cleanup is performed by a single script: run_analysis.R. To run the analysis, perform these steps:

1. download the script and the dataset and place them in the same directory;
2. load the script into R using `source("run_analysis.R")`;
3. execute the script by calling the function `run_analysis()`;

The script will read the `subject_train.txt`, `X_train.txt`, `y_train.txt`, `subject_test.txt`, `X_test.txt` and `y_test.txt` files from the UCI HAR Dataset and merge them into one dataframe, with one column for the subjects, one column for the activities and one column for each feature. The values from `y_train.txt` and `y_test.txt` are replaced by the activity names as specified in `activity_labels.txt`. The dataframe is restricted to the features on the mean and standard deviation of each measurement. The column names are set to a more descriptive version of the feature names. See the codebook for more details. 

A second dataframe is computed from this, containing the average value of each feature for each subject and activity. This dataframe has the same columns as the first one, but there is exactly one row for each subject and activity. The rows are ordered by subject id and activity name. It is stored in the file `averages.txt`.
You can read this dataframe back into R using `read.table("./averages.txt", header=TRUE, sep="")`.

## References

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012