Getting and Cleaning data project Codebook
==========================================

This codebook inteds to explain the structure of the tidy dataset
created in this project. File: independent\_tidy\_dataset.txt

Information about the methodology for collecting the data in the raw files
--------------------------------------------------------------------------

The experiments have been carried out with a group of 30 volunteers
within an age bracket of 19-48 years. Each person performed six
activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING,
STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the
waist. Using its embedded accelerometer and gyroscope, we captured
3-axial linear acceleration and 3-axial angular velocity at a constant
rate of 50Hz. The experiments have been video-recorded to label the data
manually. The obtained dataset has been randomly partitioned into two
sets, where 70% of the volunteers was selected for generating the
training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by
applying noise filters and then sampled in fixed-width sliding windows
of 2.56 sec and 50% overlap (128 readings/window). The sensor
acceleration signal, which has gravitational and body motion components,
was separated using a Butterworth low-pass filter into body acceleration
and gravity. The gravitational force is assumed to have only low
frequency components, therefore a filter with 0.3 Hz cutoff frequency
was used. From each window, a vector of features was obtained by
calculating variables from the time and frequency domain.

Variable's information
----------------------

The features selected for this dataset come from the accelerometer and
gyroscope 3-axial raw signals timeAccelerometer\_XYZ and
timeGyroscope\_XYZ. These time domain signals were captured at a
constant rate of 50 Hz. Then they were filtered using a median filter
and a 3rd order low pass Butterworth filter with a corner frequency of
20 Hz to remove noise. Similarly, the acceleration signal was then
separated into body and gravity acceleration signals
(timeBodyAccelerometer\_XYZ and timeGravityAccelerometer-XYZ) using
another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were
derived in time to obtain Jerk signals (timeBodyAccelerometerJerk\_XYZ
and timeBodyGyroscpeJerk\_XYZ). Also the magnitude of these
three-dimensional signals were calculated using the Euclidean norm
(timeBodyAccelerometerMag, timeGravityAccelerometerMagnitude,
timeBodyAccelerometerJerkMagnitude, timeBodyGyroscopeMagnitude,
timeBodyGyroscopeJerkMagnitude).

Finally a Fast Fourier Transform (FFT) was applied to some of these
signals producing frequencyBodyAccelerometer\_XYZ,
frequencyBodyAccelerometerJerk\_XYZ, frequencyBodyGyroscope\_XYZ,
frequencyBodyAccelerometerJerkMagnitude,
frequencyBodyGyroscopeMagnitude, frequencyBodyGyroscopeJerkMagnitude.

These signals were used to estimate variables of the feature vector for
each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

For each row in the tidy dataset it is provided:

1.  Messurements of the average for the mean and standard deviation,
    considering time and frequency of all the variables mentioned

2.  An identifier of the subject who carried out the experiment.

3.  Activity the subjects performed

Files used to extract relevant data
-----------------------------------

-   'features.txt': List of all features.

-   'activity\_labels.txt': Links the class labels with their
    activity name.

-   'train/X\_train.txt': Training set.

-   'train/y\_train.txt': Training labels.

-   'test/X\_test.txt': Test set.

-   'test/y\_test.txt': Test labels.

-   'train/subject\_train.txt': Each row identifies the subject who
    performed the activity for each window sample. Its range is from 1
    to 30.

-   'test/subject\_test.txt': Each row identifies the subject who
    performed the activity for each window sample. Its range is from 1
    to 30.

Detailed summary of variables
-----------------------------

\[1\] "Subject" : Factor ranging from 1 to 30. It identifies the subject
who performed the activity  
\[2\] "Activity" : Labeled factor ranging from 1 to 6. Identifies the
activities that the subject performed

Next variables (of numeric class) represent the average of each of the
messurements described by their names

\[3\] "TimeBodyAccelerometer\_Mean\_X"  
\[4\] "TimeBodyAccelerometer\_Mean\_Y"  
\[5\] "TimeBodyAccelerometer\_Mean\_Z"  
\[6\] "TimeBodyAccelerometer\_StandardDeviation\_X"  
\[7\] "TimeBodyAccelerometer\_StandardDeviation\_Y"  
\[8\] "TimeBodyAccelerometer\_StandardDeviation\_Z"  
\[9\] "TimeGravityAccelerometer\_Mean\_X"  
\[10\] "TimeGravityAccelerometer\_Mean\_Y"  
\[11\] "TimeGravityAccelerometer\_Mean\_Z"  
\[12\] "TimeGravityAccelerometer\_StandardDeviation\_X"  
\[13\] "TimeGravityAccelerometer\_StandardDeviation\_Y"  
\[14\] "TimeGravityAccelerometer\_StandardDeviation\_Z"  
\[15\] "TimeBodyAccelerometerJerk\_Mean\_X"  
\[16\] "TimeBodyAccelerometerJerk\_Mean\_Y"  
\[17\] "TimeBodyAccelerometerJerk\_Mean\_Z"  
\[18\] "TimeBodyAccelerometerJerk\_StandardDeviation\_X"  
\[19\] "TimeBodyAccelerometerJerk\_StandardDeviation\_Y"  
\[20\] "TimeBodyAccelerometerJerk\_StandardDeviation\_Z"  
\[21\] "TimeBodyGyroscope\_Mean\_X"  
\[22\] "TimeBodyGyroscope\_Mean\_Y"  
\[23\] "TimeBodyGyroscope\_Mean\_Z"  
\[24\] "TimeBodyGyroscope\_StandardDeviation\_X"  
\[25\] "TimeBodyGyroscope\_StandardDeviation\_Y"  
\[26\] "TimeBodyGyroscope\_StandardDeviation\_Z"  
\[27\] "TimeBodyGyroscopeJerk\_Mean\_X"  
\[28\] "TimeBodyGyroscopeJerk\_Mean\_Y"  
\[29\] "TimeBodyGyroscopeJerk\_Mean\_Z"  
\[30\] "TimeBodyGyroscopeJerk\_StandardDeviation\_X"  
\[31\] "TimeBodyGyroscopeJerk\_StandardDeviation\_Y"  
\[32\] "TimeBodyGyroscopeJerk\_StandardDeviation\_Z"  
\[33\] "TimeBodyAccelerometerMagnitude\_Mean"  
\[34\] "TimeBodyAccelerometerMagnitude\_StandardDeviation"  
\[35\] "TimeGravityAccelerometerMagnitude\_Mean"  
\[36\] "TimeGravityAccelerometerMagnitude\_StandardDeviation"  
\[37\] "TimeBodyAccelerometerJerkMagnitude\_Mean"  
\[38\] "TimeBodyAccelerometerJerkMagnitude\_StandardDeviation"  
\[39\] "TimeBodyGyroscopeMagnitude\_Mean"  
\[40\] "TimeBodyGyroscopeMagnitude\_StandardDeviation"  
\[41\] "TimeBodyGyroscopeJerkMagnitude\_Mean"  
\[42\] "TimeBodyGyroscopeJerkMagnitude\_StandardDeviation"  
\[43\] "FrequencyBodyAccelerometer\_Mean\_X"  
\[44\] "FrequencyBodyAccelerometer\_Mean\_Y"  
\[45\] "FrequencyBodyAccelerometer\_Mean\_Z"  
\[46\] "FrequencyBodyAccelerometer\_StandardDeviation\_X"  
\[47\] "FrequencyBodyAccelerometer\_StandardDeviation\_Y"  
\[48\] "FrequencyBodyAccelerometer\_StandardDeviation\_Z"  
\[49\] "FrequencyBodyAccelerometerJerk\_Mean\_X"  
\[50\] "FrequencyBodyAccelerometerJerk\_Mean\_Y"  
\[51\] "FrequencyBodyAccelerometerJerk\_Mean\_Z"  
\[52\] "FrequencyBodyAccelerometerJerk\_StandardDeviation\_X"  
\[53\] "FrequencyBodyAccelerometerJerk\_StandardDeviation\_Y"  
\[54\] "FrequencyBodyAccelerometerJerk\_StandardDeviation\_Z"  
\[55\] "FrequencyBodyGyroscope\_Mean\_X"  
\[56\] "FrequencyBodyGyroscope\_Mean\_Y"  
\[57\] "FrequencyBodyGyroscope\_Mean\_Z"  
\[58\] "FrequencyBodyGyroscope\_StandardDeviation\_X"  
\[59\] "FrequencyBodyGyroscope\_StandardDeviation\_Y"  
\[60\] "FrequencyBodyGyroscope\_StandardDeviation\_Z"  
\[61\] "FrequencyBodyAccelerometerMagnitude\_Mean"  
\[62\] "FrequencyBodyAccelerometerMagnitude\_StandardDeviation"  
\[63\] "FrequencyBodyBodyAccelerometerJerkMagnitude\_Mean"  
\[64\] "FrequencyBodyBodyAccelerometerJerkMagnitude\_StandardDeviation"
\[65\] "FrequencyBodyBodyGyroscopeMagnitude\_Mean"  
\[66\] "FrequencyBodyBodyGyroscopeMagnitude\_StandardDeviation"  
\[67\] "FrequencyBodyBodyGyroscopeJerkMagnitude\_Mean"  
\[68\] "FrequencyBodyBodyGyroscopeJerkMagnitude\_StandardDeviation"
