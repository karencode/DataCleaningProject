Code Book for the data set :tidydata.txt: created in the course project for Coursera's Getting and Cleaning Data Course
by Karen Lowe (August 19,2015)

## Study Design

Information about the design of this study can be found on:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

In summary, 30 study participants wore a smartphone (Samsung Galaxy S II) on their waist that had an embedded accelerometer and gyroscope. This smartphone measured various aspects of the participant's body movement while the participant engaged in 6 different activities: walking, walking upstairs, walking_downstairs, sitting, standing, laying. Each participant had multiple measurements across many dimensions for each activity as the measurements were made in different time windows. 

The following (copied from the file features_info.txt) describes the processing of each variable (called here, a "feature"):
"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions."


The "tidy" dataset described here is an average across the multiple time windows for each of the various measurements for each participant and each activity, resulting in 6 observations for each of 30 participants (180 rows) for each of 66 variables.

These 66 variables are only a subset of the variables available in the original data files accessed from this link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

This particular file was created from the data downloaded on 8/19/2015 at 8:32AM.

In particular, they are the variables that were computed averages (had a mean() in the variable name) or standard deviations (had a std() in the variable name) across one window of time (for one participant engaged in one activity).

## Codebook
tidydata.txt  has 180 rows of 68 variables.  The 68 variables are as follows:

1. subject: a subject ID (1-30)
2. activity: a character string identifying the activity (Levels: WALKING WALKING_UPSTAIRS WALKING_DOWNSTAIRS SITTING STANDING LAYING)

Each of the following are the means of the body measurement for that subject & activity. Each value is continuous in the range of [-1,1]. However, since each was also normalized into the range [-1, 1], none of the following variables have units:


3. timeBodyAcceleration.mean.x: The mean body acceleration in the x direction    
4. timeBodyAcceleration.mean.y: The mean body acceleration in the y direction                             
5. timeBodyAcceleration.mean.z: The mean body acceleration in the z direction           
6. timeGravityAcceleration.mean.x: The mean gravity acceleration in the x direction                 
7. timeGravityAcceleration.mean.y:  The mean gravity acceleration in the y direction            
8. timeGravityAcceleration.mean.z:  The mean gravity acceleration in the z direction          
9. timeBodyAccelerationJerk.mean.x:  The mean body acceleration jerk in the x direction         
10. timeBodyAccelerationJerk.mean.y: The mean body acceleration jerk in the y direction          
11. timeBodyAccelerationJerk.mean.z: The mean body acceleration jerk in the z direction           
12. timeBodyGyroscope.mean.x: The mean angular velocity measured by the gyroscope in the x direction             
13. timeBodyGyroscope.mean.y: The mean angular velocity measured by the gyroscope in the y direction                 
14. timeBodyGyroscope.mean.z: The mean angular velocity measured by the gyroscope in the z direction  
15. timeBodyGyroscopeJerk.mean.x: The mean angular jerk measured by the gyroscope in the x direction           
16. timeBodyGyroscopeJerk.mean.y: The mean angular jerk measured by the gyroscope in the y direction          
17. timeBodyGyroscopeJerk.mean.z: The mean angular jerk measured by the gyroscope in the z direction         
18. timeBodyAccelerationMagnitude.mean: The mean magnitude of the three-dimensional body acceleration 
19. timeGravityAccelerationMagnitude.mean: The mean magnitude of the three-dimensional gravity acceleration 
20. timeBodyAccelerationJerkMagnitude.mean: The mean magnitude of the three-dimensional jerk acceleration
21.timeBodyGyroscopeMagnitude.mean: The mean magnitude of the three-dimensional angular velocity measured by the gyroscope      
22. timeBodyGyroscopeJerkMagnitude.mean: The mean magnitude of the three-dimensional angular jerk measured by the gyroscope 
23. freqBodyAcceleration.mean.x: The mean of the Fast Fourier Transform (FFT) applied to the body acceleration in the x direction producing a frequency domain signal          
24. freqBodyAcceleration.mean.y:  The mean of the frequency domain signal produced by the Fast Fourier Transform (FFT) applied to the body acceleration in the y direction         
25. freqBodyAcceleration.mean.z:  TThe mean of the frequency domain signal produced by the Fast Fourier Transform (FFT) applied to the body acceleration in the z direction           
26. freqBodyAccelerationJerk.mean.x: The mean of the frequency domain signal produced by the Fast Fourier Transform (FFT) applied to the body acceleration jerk in the x direction     
27. freqBodyAccelerationJerk.mean.y:  The mean of the frequency domain signal produced by the Fast Fourier Transform (FFT) applied to the body acceleration jerk in the y direction         
28. freqBodyAccelerationJerk.mean.z: The mean of the frequency domain signal produced by the Fast Fourier Transform (FFT) applied to the body acceleration jerk in the z direction         
29. freqBodyGyroscope.mean.x: The mean of the frequency domain signal produced by the Fast Fourier Transform (FFT) applied to the angular velocity measured by the gyroscope in the x direction                 
30. freqBodyGyroscope.mean.y: The mean of the frequency domain signal produced by the Fast Fourier Transform (FFT) applied to the angular velocity measured by the gyroscope in the y direction                
31. freqBodyGyroscope.mean.z: The mean of the frequency domain signal produced by the Fast Fourier Transform (FFT) applied to the angular velocity measured by the gyroscope in the z direction                
32. freqBodyAccelerationMagnitude.mean: The mean of the frequency domain signal produced by the Fast Fourier Transform (FFT) applied to magnitude of the three-dimensional body acceleration     
33. freqBodyAccelerationJerkMagnitude.mean: The mean of the frequency domain signal produced by the Fast Fourier Transform (FFT) applied to magnitude of the three-dimensional acceleration jerk
34. freqBodyGyroscopeMagnitude.mean: The mean of the frequency domain signal produced by the Fast Fourier Transform (FFT) applied to magnitude of the three-dimensional angular velocity measured by the gyroscope       
35. freqBodyGyroscopeJerkMagnitude.mean: The mean of the frequency domain signal produced by the Fast Fourier Transform (FFT) applied to magnitude of the three-dimensional angular jerk measured by the gyroscope   
36. timeBodyAcceleration.stdev.x: The standard deviation body acceleration in the x direction    
37. timeBodyAcceleration.stdev.y: The standard deviation body acceleration in the y direction                             
38. timeBodyAcceleration.stdev.z: The standard deviation body acceleration in the z direction           
39. timeGravityAcceleration.stdev.x: The standard deviation gravity acceleration in the x direction                 
40. timeGravityAcceleration.stdev.y:  The standard deviation gravity acceleration in the y direction            
41. timeGravityAcceleration.stdev.z:  The standard deviation gravity acceleration in the z direction          
42. timeBodyAccelerationJerk.stdev.x:  The standard deviation body acceleration jerk in the x direction         
43. timeBodyAccelerationJerk.stdev.y: The standard deviation body acceleration jerk in the y direction          
44. timeBodyAccelerationJerk.stdev.z: The standard deviation body acceleration jerk in the z direction           
45. timeBodyGyroscope.stdev.x: The standard deviation angular velocity measured by the gyroscope in the x direction             
46. timeBodyGyroscope.stdev.y: The standard deviation angular velocity measured by the gyroscope in the y direction                 
47. timeBodyGyroscope.stdev.z: The standard deviation angular velocity measured by the gyroscope in the z direction  
48. timeBodyGyroscopeJerk.stdev.x: The standard deviation angular jerk measured by the gyroscope in the x direction           
49. timeBodyGyroscopeJerk.stdev.y: The standard deviation angular jerk measured by the gyroscope in the y direction          
50. timeBodyGyroscopeJerk.stdev.z: The standard deviation angular jerk measured by the gyroscope in the z direction         
51. timeBodyAccelerationMagnitude.stdev: The standard deviation magnitude of the three-dimensional body acceleration 
52. timeGravityAccelerationMagnitude.stdev: The standard deviation magnitude of the three-dimensional gravity acceleration 
53. timeBodyAccelerationJerkMagnitude.stdev: The standard deviation magnitude of the three-dimensional jerk acceleration
54. timeBodyGyroscopeMagnitude.stdev: The standard deviation magnitude of the three-dimensional angular velocity measured by the gyroscope      
55. timeBodyGyroscopeJerkMagnitude.stdev: The standard deviation magnitude of the three-dimensional angular jerk measured by the gyroscope 
56. freqBodyAcceleration.stdev.x: The standard deviation of the Fast Fourier Transform (FFT) applied to the body acceleration in the x direction producing a frequency domain signal          
57. freqBodyAcceleration.stdev.y:  The standard deviation of the frequency domain signal produced by the Fast Fourier Transform (FFT) applied to the body acceleration in the y direction         
58. freqBodyAcceleration.stdev.z:  TThe standard deviation of the frequency domain signal produced by the Fast Fourier Transform (FFT) applied to the body acceleration in the z direction           
59. freqBodyAccelerationJerk.stdev.x: The standard deviation of the frequency domain signal produced by the Fast Fourier Transform (FFT) applied to the body acceleration jerk in the x direction     
60. freqBodyAccelerationJerk.stdev.y:  The standard deviation of the frequency domain signal produced by the Fast Fourier Transform (FFT) applied to the body acceleration jerk in the y direction         
61. freqBodyAccelerationJerk.stdev.z: The standard deviation of the frequency domain signal produced by the Fast Fourier Transform (FFT) applied to the body acceleration jerk in the z direction         
62. freqBodyGyroscope.stdev.x: The standard deviation of the frequency domain signal produced by the Fast Fourier Transform (FFT) applied to the angular velocity measured by the gyroscope in the x direction                 
63. freqBodyGyroscope.stdev.y: The standard deviation of the frequency domain signal produced by the Fast Fourier Transform (FFT) applied to the angular velocity measured by the gyroscope in the y direction                
64. freqBodyGyroscope.stdev.z: The standard deviation of the frequency domain signal produced by the Fast Fourier Transform (FFT) applied to the angular velocity measured by the gyroscope in the z direction                
65. freqBodyAccelerationMagnitude.stdev: The standard deviation of the frequency domain signal produced by the Fast Fourier Transform (FFT) applied to magnitude of the three-dimensional body acceleration     
66. freqBodyAccelerationJerkMagnitude.stdev: The standard deviation of the frequency domain signal produced by the Fast Fourier Transform (FFT) applied to magnitude of the three-dimensional acceleration jerk
67. freqBodyGyroscopeMagnitude.stdev: The standard deviation of the frequency domain signal produced by the Fast Fourier Transform (FFT) applied to magnitude of the three-dimensional angular velocity measured by the gyroscope       
68. freqBodyGyroscopeJerkMagnitude.stdev: The standard deviation of the frequency domain signal produced by the Fast Fourier Transform (FFT) applied to magnitude of the three-dimensional angular jerk measured by the gyroscope 



