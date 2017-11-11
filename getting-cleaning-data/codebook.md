# Code book

## Description of the dataset
The dataset is a tidied version of the UCI HAR Dataset[1].
The dataset contains measurements on 30 subjects performing 6 activities. Each subject performed each activity multiple times. Several features were measured during the activity, 66 of which are included in this dataset. This dataset contains the average value of the features for each subject and activity. All data is stored in one table. The dataset contains one row for each subject and activity, hence 180 rows in total.

## Study design

The following is information is taken from the file `README.txt` in the UCI HAR Dataset[1]:
*'The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.'*
 
The next part is taken from the file `features_info.txt` in the UCI HAR Dataset[1] :
*'The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.'*

The following signals were measured:

*'tBodyAcc-XYZ, tGravityAcc-XYZ, tBodyAccJerk-XYZ, tBodyGyro-XYZ, tBodyGyroJerk-XYZ, tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag, fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccMag, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag
The set of variables that were estimated from these signals are: 
mean(): Mean value, std(): Standard deviation [...]'*

In the UCI HAR Dataset, some more variables were estimated. They are not in the tidied dataset.

## Creating the tidied dataset
To recreate the tidy dataset, perform these steps:
1. download the script and the dataset and place them in the same directory;
2. load the script into R using `source("run_analysis.R")`;
3. execute the script by calling the function `run_analysis()`;

## Cleaning of the data
The raw data contains multiple measurements on each subject and activity. Many features are included that are not of interest to us here. The dataset is cleaned by keeping the features on the mean and standard deviation of each measurement only.
The features names are changed to be more descriptive and readable: the `()` after `mean` and `std` are removed; all '-' are replaced by '.'; the `t` and `f` at the start of the name are replaced by `time` and `frequency`, respectively; `Acc` is replaced by `Acceleration`; `Gyro` is replaced by `AngularVelocity`; `Mag` is replaced by `Magnitude`; and `BodyBody` is replaced by `Body` because this duplication seems to be a typo in the original dataset.
Then the rows are grouped together by subject and activity and the average for each feature is computed per group. The tidied dataset contains one row for each subject and activity with these averages.
The raw dataset has no missing values, so no cleaning is required to handle NA's.

## Description of the variables
In the current dataset, the features are averaged per subject and activity. This leads to a dataset with 180 rows (one for each subject and activity) and 68 columns. Features are normalized and bounded within [-1,1]. 
The columns of the dataset are:

|Column  |Name                                            |Description                                                                                                         |Unit                      |
|--------|------------------------------------------------|--------------------------------------------------------------------------------------------------------------------|--------------------------|
|1.      |`subject`                                       |identifiers with values 1, 2, ..., 30                                                                               |-                         |
|2.      |`activity`                                      |values LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS and WALKING_UPSTAIRS                                  |-                         |
|3.      |`timeBodyAcceleration.mean.X`                   |mean value of the body acceleration in the X direction                                                              |standard gravity units `g`|
|4.      |`timeBodyAcceleration.mean.Y`                   |mean value of the body acceleration in the Y direction                                                              |standard gravity units `g`|
|5.      |`timeBodyAcceleration.mean.Z`                   |mean value of the body acceleration in the Z direction                                                              |standard gravity units `g`|
|6.      |`timeGravityAcceleration.mean.X`                |mean value of the gravitational acceleration in the X direction                                                     |standard gravity units `g`|
|7.      |`timeGravityAcceleration.mean.Y`                |mean value of the gravitational acceleration in the Y direction                                                     |standard gravity units `g`|
|8.      |`timeGravityAcceleration.mean.Z`                |mean value of the gravitational acceleration in the Z direction                                                     |standard gravity units `g`|
|9.      |`timeBodyAccelerationJerk.mean.X`               |mean value of the Jerk signal of the body acceleration in the X direction                                           |`m/s^3`                   |
|10.     |`timeBodyAccelerationJerk.mean.Y`               |mean value of the Jerk signal of the body acceleration in the Y direction                                           |`m/s^3`                   |
|11.     |`timeBodyAccelerationJerk.mean.Z`               |mean value of the Jerk signal of the body acceleration in the Z direction                                           |`m/s^3`                   |
|12.     |`timeBodyAngularVelocity.mean.X`                |mean value of the angular body velocity in the X direction                                                          |`radians/s`               |
|13.     |`timeBodyAngularVelocity.mean.Y`                |mean value of the angular body velocity in the Y direction                                                          |`radians/s`               |
|14.     |`timeBodyAngularVelocity.mean.Z`                |mean value of the angular body velocity in the Z direction                                                          |`radians/s`               |
|15.     |`timeBodyAngularVelocityJerk.mean.X`            |mean value of the Jerk signal of the angular body velocity in the X direction                                       |`radians/s^2`             |
|16.     |`timeBodyAngularVelocityJerk.mean.Y`            |mean value of the Jerk signal of the angular body velocity in the Y direction                                       |`radians/s^2`             |
|17.     |`timeBodyAngularVelocityJerk.mean.Z`            |mean value of the Jerk signal of the angular body velocity in the Z direction                                       |`radians/s^2`             |
|18.     |`timeBodyAccelerationMagnitude.mean`            |mean value of the magnitude of the body acceleration                                                                |standard gravity units `g`|
|19.     |`timeGravityAccelerationMagnitude.mean`         |mean value of the magnitude of the gravitational acceleration                                                       |standard gravity units `g`|
|20.     |`timeBodyAccelerationJerkMagnitude.mean`        |mean value of the magnitude of the Jerk signal of the body acceleration                                             |`m/s^3`                   |
|21.     |`timeBodyAngularVelocityMagnitude.mean`         |mean value of the magnitude of the angular body velocity                                                            |`radians/s`               |
|22.     |`timeBodyAngularVelocityJerkMagnitude.mean`     |mean value of the magnitude of the Jerk signal of the angular body velocity                                         |`radians/s^2`             |
|23.     |`frequencyBodyAcceleration.mean.X`              |mean value of the result of applying an FFT to the body acceleration in the X direction                             |standard gravity units `g`|
|24.     |`frequencyBodyAcceleration.mean.Y`              |mean value of the result of applying an FFT to the body acceleration in the Y direction                             |standard gravity units `g`|
|25.     |`frequencyBodyAcceleration.mean.Z`              |mean value of the result of applying an FFT to the body acceleration in the Z direction                             |standard gravity units `g`|
|26.     |`frequencyBodyAccelerationJerk.mean.X`          |mean value of the result of applying an FFT to the Jerk signal of the body acceleration in the X direction          |`m/s^3`                   |
|27.     |`frequencyBodyAccelerationJerk.mean.Y`          |mean value of the result of applying an FFT to the Jerk signal of the body acceleration in the Y direction          |`m/s^3`                   |
|28.     |`frequencyBodyAccelerationJerk.mean.Z`          |mean value of the result of applying an FFT to the Jerk signal of the body acceleration in the Z direction          |`m/s^3`                   |
|29.     |`frequencyBodyAngularVelocity.mean.X`           |mean value of the result of applying an FFT to the angular body velocity in the X direction                         |`radians/s`               |
|30.     |`frequencyBodyAngularVelocity.mean.Y`           |mean value of the result of applying an FFT to the angular body velocity in the Y direction                         |`radians/s`               |
|31.     |`frequencyBodyAngularVelocity.mean.Z`           |mean value of the result of applying an FFT to the angular body velocity in the Z direction                         |`radians/s`               |
|32.     |`frequencyBodyAccelerationMagnitude.mean`       |mean value of the result of applying an FFT to the magnitude of the body acceleration                               |standard gravity units `g`|
|33.     |`frequencyBodyAccelerationJerkMagnitude.mean`   |mean value of the result of applying an FFT to the magnitude of the Jerk signal of the body acceleration            |`m/s^3`                   |
|34.     |`frequencyBodyAngularVelocityMagnitude.mean`    |mean value of the result of applying an FFT to the magnitude of the angular body velocity                           |`radians/s`               |
|35.     |`frequencyBodyAngularVelocityJerkMagnitude.mean`|mean value of the result of applying an FFT to the magnitude of the Jerk signal of the angular body velocity        |`radians/s^2`             |
|36.     |`timeBodyAcceleration.std.X`                    |standard deviation of the body acceleration in the X direction                                                      |standard gravity units `g`|
|37.     |`timeBodyAcceleration.std.Y`                    |standard deviation of the body acceleration in the Y direction                                                      |standard gravity units `g`|
|38.     |`timeBodyAcceleration.std.Z`                    |standard deviation of the body acceleration in the Z direction                                                      |standard gravity units `g`|
|39.     |`timeGravityAcceleration.std.X`                 |standard deviation of the gravitational acceleration in the X direction                                             |standard gravity units `g`|
|40.     |`timeGravityAcceleration.std.Y`                 |standard deviation of the gravitational acceleration in the Y direction                                             |standard gravity units `g`|
|41.     |`timeGravityAcceleration.std.Z`                 |standard deviation of the gravitational acceleration in the Z direction                                             |standard gravity units `g`|
|42.     |`timeBodyAccelerationJerk.std.X`                |standard deviation of the Jerk signal of the body acceleration in the X direction                                   |`m/s^3`                   |
|43.     |`timeBodyAccelerationJerk.std.Y`                |standard deviation of the Jerk signal of the body acceleration in the Y direction                                   |`m/s^3`                   |
|44.     |`timeBodyAccelerationJerk.std.Z`                |standard deviation of the Jerk signal of the body acceleration in the Z direction                                   |`m/s^3`                   |
|45.     |`timeBodyAngularVelocity.std.X`                 |standard deviation of the angular body velocity in the X direction                                                  |`radians/s`               |
|46.     |`timeBodyAngularVelocity.std.Y`                 |standard deviation of the angular body velocity in the X direction                                                  |`radians/s`               |
|47.     |`timeBodyAngularVelocity.std.Z`                 |standard deviation of the angular body velocity in the X direction                                                  |`radians/s`               |
|48.     |`timeBodyAngularVelocityJerk.std.X`             |standard deviation of the Jerk signal of the angular body velocity in the X direction                               |`radians/s^2`             |
|49.     |`timeBodyAngularVelocityJerk.std.Y`             |standard deviation of the Jerk signal of the angular body velocity in the Y direction                               |`radians/s^2`             |
|50.     |`timeBodyAngularVelocityJerk.std.Z`             |standard deviation of the Jerk signal of the angular body velocity in the Z direction                               |`radians/s^2`             |
|51.     |`timeBodyAccelerationMagnitude.std`             |standard deviation of the magnitude of the body acceleration                                                        |standard gravity units `g`|
|52.     |`timeGravityAccelerationMagnitude.std`          |standard deviation of the magnitude of the gravitational acceleration                                               |standard gravity units `g`|
|53.     |`timeBodyAccelerationJerkMagnitude.std`         |standard deviation of the magnitude of the Jerk signal of the body acceleration                                     |`m/s^3`                   |
|54.     |`timeBodyAngularVelocityMagnitude.std`          |standard deviation of the magnitude of the angular body velocity                                                    |`radians/s`               |
|55.     |`timeBodyAngularVelocityJerkMagnitude.std`      |standard deviation of the magnitude of the Jerk signal of the angular body velocity                                 |`radians/s^2`             |
|56.     |`frequencyBodyAcceleration.std.X`               |standard deviation of the result of applying an FFT to the body acceleration in the X direction                     |standard gravity units `g`|
|57.     |`frequencyBodyAcceleration.std.Y`               | standard deviation of the result of applying an FFT to the body acceleration in the Y direction                    |standard gravity units `g`|
|58.     |`frequencyBodyAcceleration.std.Z`               |standard deviation of the result of applying an FFT to the body acceleration in the Z direction                     |standard gravity units `g`|
|59.     |`frequencyBodyAccelerationJerk.std.X`           |standard deviation of the result of applying an FFT to the Jerk signal of the body acceleration in the X direction  |`m/s^3`                   |
|60.     |`frequencyBodyAccelerationJerk.std.Y`           |standard deviation of the result of applying an FFT to the Jerk signal of the body acceleration in the Y direction  |`m/s^3`                   |
|61.     |`frequencyBodyAccelerationJerk.std.Z`           |standard deviation of the result of applying an FFT to the Jerk signal of the body acceleration in the Z direction  |`m/s^3`                   |
|62.     |`frequencyBodyAngularVelocity.std.X`            |standard deviation of the result of applying an FFT to the angular body velocity in the X direction                 |`radians/s`               |
|63.     |`frequencyBodyAngularVelocity.std.Y`            |standard deviation of the result of applying an FFT to the angular body velocity in the Y direction                 |`radians/s`               |
|64.     |`frequencyBodyAngularVelocity.std.Z`            |standard deviation of the result of applying an FFT to the angular body velocity in the Z direction                 |`radians/s`               |
|65.     |`frequencyBodyAccelerationMagnitude.std`        |standard deviation of the result of applying an FFT to the magnitude of the body acceleration                       |standard gravity units `g`|
|66.     |`frequencyBodyAccelerationJerkMagnitude.std`    |standard deviation of the result of applying an FFT to the magnitude of the Jerk signal of the body acceleration    |`m/s^3`                   |
|67.     |`frequencyBodyAngularVelocityMagnitude.std`     |standard deviation of the result of applying an FFT to the magnitude of the angular body velocity                   |`radians/s`               |
|68.     |`frequencyBodyAngularVelocityJerkMagnitude.std` |standard deviation of the result of applying an FFT to the magnitude of the Jerk signal of the angular body velocity|`radians/s^2`             |
 
## References

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012