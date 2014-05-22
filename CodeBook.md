### Code Book for Getting and Cleaning Data Course Project
========================================================

## Study Design
The study name is Human Activity Recognition Using Smartphones 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 


## Data Dictionary
1. "subject_id"
An integer value that identifies a volunteer who participated in the experiments.  Volunteers belong to an age bracket of 19 - 48 years.

2. "activity_name"
A factor that describes the activity for each observation.  Values include: (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).  

3. "time.BodyAcc.mean.X"
A numeric value that represents a time domain signal for body linear acceleration in the X direction captured at a constant rate of 50 Hz.  This is an average of the mean values across raw signals in the X direction. 

4. "time.BodyAcc.mean.Y" 
A numeric value that represents a time domain signal for body linear acceleration in the Y direction captured at a constant rate of 50 Hz.  This is an average of the mean values across raw signals in the Y direction. 

5. "time.BodyAcc.mean.Z"  
A numeric value that represents a time domain signal for body linear acceleration in the Z direction captured at a constant rate of 50 Hz.  This is an average of the mean values across raw signals in the Z direction.  

6. "time.GravityAcc.mean.X"  
A numeric value that represents a time domain signal for gravitational linear acceleration in the X direction captured at a constant rate of 50 Hz.  This is an average of the mean values across raw signals in the X direction.  

7. "time.GravityAcc.mean.Y" 
A numeric value that represents a time domain signal for gravitational linear acceleration in the Y direction captured at a constant rate of 50 Hz.  This is an average of the mean values across raw signals in the Y direction. 

8. "time.GravityAcc.mean.Z"    
A numeric value that represents a time domain signal for gravitational linear acceleration in the Z direction captured at a constant rate of 50 Hz.  This is an average of the mean values across raw signals in the Z direction. 

9. "time.BodyAccJerk.mean.X" 
A numeric value that represents a time domain signal for body linear acceleration in the X direction captured at a constant rate of 50 Hz derived in time to obtain Jerk signals.  This is an average of the mean values across raw signals in the X direction. 

10. "time.BodyAccJerk.mean.Y" 
A numeric value that represents a time domain signal for body linear acceleration in the Y direction captured at a constant rate of 50 Hz derived in time to obtain Jerk signals.  This is an average of the mean values across raw signals in the Y direction. 

11. "time.BodyAccJerk.mean.Z"  
A numeric value that represents a time domain signal for body linear acceleration in the Z direction captured at a constant rate of 50 Hz derived in time to obtain Jerk signals.  This is an average of the mean values across raw signals in the Z direction. 

12. "time.BodyGyro.mean.X" 
A numeric value that represents a time domain signal for body angular velocity measured with a gyroscope in the X direction captured at a constant rate of 50 Hz.  This is an average of the mean values across raw signals in the X direction.

13. "time.BodyGyro.mean.Y"
A numeric value that represents a time domain signal for body angular velocity measured with a gyroscope in the Y direction captured at a constant rate of 50 Hz.  This is an average of the mean values across raw signals in the Y direction.

14. "time.BodyGyro.mean.Z"  
A numeric value that represents a time domain signal for body angular velocity measured with a gyroscope in the Z direction captured at a constant rate of 50 Hz.  This is an average of the mean values across raw signals in the Z direction.

15. "time.BodyGyroJerk.mean.X" 
A numeric value that represents a time domain signal for body angular velocity measured with a gyroscope in the X direction captured at a constant rate of 50 Hz derived in time to obtain Jerk signals.  This is an average of the mean values across raw signals in the X direction.

16. "time.BodyGyroJerk.mean.Y" 
A numeric value that represents a time domain signal for body angular velocity measured with a gyroscope in the Y direction captured at a constant rate of 50 Hz derived in time to obtain Jerk signals.  This is an average of the mean values across raw signals in the Y direction.

17. "time.BodyGyroJerk.mean.Z"  
A numeric value that represents a time domain signal for body angular velocity measured with a gyroscope in the Z direction captured at a constant rate of 50 Hz derived in time to obtain Jerk signals.  This is an average of the mean values across raw signals in the Z direction.

18. "time.BodyAccMag.mean"
A numeric value that represents the magnitude, using Euclideannorm, of a time domain signal for body linear acceleration captured at a constant rate of 50 Hz.  This is an average of the mean values across raw signals. 

19. "time.GravityAccMag.mean" 
A numeric value that represents the magnitude, using Euclideannorm, of a time domain signal for gravitational linear acceleration captured at a constant rate of 50 Hz.  This is an average of the mean values across raw signals. 

20. "time.BodyAccJerkMag.mean"  
A numeric value that represents the magnitude, using Euclidean norm, of a time domain signal for body linear acceleration captured at a constant rate of 50 Hz derived in time to obtain Jerk signals.  This is an average of the mean values across raw signals. 

21. "time.BodyGyroMag.mean" 
A numeric value that represents the magnitude, using Euclidean norm, of a time domain signal for body angular velocity measured with a gyroscope captured at a constant rate of 50 Hz.  This is an average of the mean values across raw signals.

22. "time.BodyGyroJerkMag.mean" 
A numeric value that represents the magnitude, using Euclidean norm, of a time domain signal for body angular velocity measured with a gyroscope captured at a constant rate of 50 Hz derived in time to obtain Jerk signals.  This is an average of the mean values across raw signals.

23. "freq.BodyAcc.mean.X" 
Equivalent to time domain signal in the frequency domain.  See definition of time domain signal.

24. "freq.BodyAcc.mean.Y" 
Equivalent to time domain signal in the frequency domain.  See definition of time domain signal.

25. "freq.BodyAcc.mean.Z"   
Equivalent to time domain signal in the frequency domain.  See definition of time domain signal.

26. "freq.BodyAccJerk.mean.X" 
Equivalent to time domain signal in the frequency domain.  See definition of time domain signal.

27. "freq.BodyAccJerk.mean.Y"  
Equivalent to time domain signal in the frequency domain.  See definition of time domain signal.

28. "freq.BodyAccJerk.mean.Z" 
Equivalent to time domain signal in the frequency domain.  See definition of time domain signal.

29. "freq.BodyGyro.mean.X"  
Equivalent to time domain signal in the frequency domain.  See definition of time domain signal.

30. "freq.BodyGyro.mean.Y" 
Equivalent to time domain signal in the frequency domain.  See definition of time domain signal.

31. "freq.BodyGyro.mean.Z" 
Equivalent to time domain signal in the frequency domain.  See definition of time domain signal.

32. "freq.BodyAccMag.mean"  
Equivalent to time domain signal in the frequency domain.  See definition of time domain signal.

33. "freq.BodyAccJerkMag.mean" 
Equivalent to time domain signal in the frequency domain.  See definition of time domain signal.

34. "freq.BodyGyroMag.mean" 
Equivalent to time domain signal in the frequency domain.  See definition of time domain signal.

35. "freq.BodyGyroJerkMag.mean" 
Equivalent to time domain signal in the frequency domain.  See definition of time domain signal.

36. "time.BodyAcc.std.X" 
A numeric value that represents a time domain signal for body linear acceleration in the X direction captured at a constant rate of 50 Hz.  This is an average of the standard deviation values across raw signals in the X direction. 

37. "time.BodyAcc.std.Y"  
A numeric value that represents a time domain signal for body linear acceleration in the Y direction captured at a constant rate of 50 Hz.  This is an average of the standard deviation values across raw signals in the Y direction. 

38. "time.BodyAcc.std.Z"   
A numeric value that represents a time domain signal for body linear acceleration in the Z direction captured at a constant rate of 50 Hz.  This is an average of the standard deviation values across raw signals in the Z direction.  

39. "time.GravityAcc.std.X"  
A numeric value that represents a time domain signal for gravitational linear acceleration in the X direction captured at a constant rate of 50 Hz.  This is an average of the standard deviation values across raw signals in the X direction.  

40. "time.GravityAcc.std.Y" 
A numeric value that represents a time domain signal for gravitational linear acceleration in the Y direction captured at a constant rate of 50 Hz.  This is an average of the standard deviation values across raw signals in the Y direction. 

41. "time.GravityAcc.std.Z" 
A numeric value that represents a time domain signal for gravitational linear acceleration in the Z direction captured at a constant rate of 50 Hz.  This is an average of the standard deviation values across raw signals in the Z direction. 

42. "time.BodyAccJerk.std.X" 
A numeric value that represents a time domain signal for body linear acceleration in the X direction captured at a constant rate of 50 Hz derived in time to obtain Jerk signals.  This is an average of the standard deviation values across raw signals in the X direction. 

43. "time.BodyAccJerk.std.Y" 
A numeric value that represents a time domain signal for body linear acceleration in the Y direction captured at a constant rate of 50 Hz derived in time to obtain Jerk signals.  This is an average of the standard deviation values across raw signals in the Y direction. 

44. "time.BodyAccJerk.std.Z"  
A numeric value that represents a time domain signal for body linear acceleration in the Z direction captured at a constant rate of 50 Hz derived in time to obtain Jerk signals.  This is an average of the standard deviation values across raw signals in the Z direction. 

45. "time.BodyGyro.std.X" 
A numeric value that represents a time domain signal for body angular velocity measured with a gyroscope in the X direction captured at a constant rate of 50 Hz.  This is an average of the standard deviation values across raw signals in the X direction.

46. "time.BodyGyro.std.Y"
A numeric value that represents a time domain signal for body angular velocity measured with a gyroscope in the Y direction captured at a constant rate of 50 Hz.  This is an average of the standard deviation values across raw signals in the Y direction.

47. "time.BodyGyro.std.Z"   
A numeric value that represents a time domain signal for body angular velocity measured with a gyroscope in the Z direction captured at a constant rate of 50 Hz.  This is an average of the standard deviation values across raw signals in the Z direction.

48. "time.BodyGyroJerk.std.X" 
A numeric value that represents a time domain signal for body angular velocity measured with a gyroscope in the X direction captured at a constant rate of 50 Hz derived in time to obtain Jerk signals.  This is an average of the standard deviation values across raw signals in the X direction.

49. "time.BodyGyroJerk.std.Y"   
A numeric value that represents a time domain signal for body angular velocity measured with a gyroscope in the Y direction captured at a constant rate of 50 Hz derived in time to obtain Jerk signals.  This is an average of the standard deviation values across raw signals in the Y direction.

50. "time.BodyGyroJerk.std.Z" 
A numeric value that represents a time domain signal for body angular velocity measured with a gyroscope in the Z direction captured at a constant rate of 50 Hz derived in time to obtain Jerk signals.  This is an average of the standard deviation values across raw signals in the Z direction.

51. "time.BodyAccMag.std"
A numeric value that represents the magnitude, using Euclideannorm, of a time domain signal for body linear acceleration captured at a constant rate of 50 Hz.  This is an average of the standard deviation values across raw signals. 

52. "time.GravityAccMag.std"   
A numeric value that represents the magnitude, using Euclideannorm, of a time domain signal for gravitational linear acceleration captured at a constant rate of 50 Hz.  This is an average of the standard deviation values across raw signals. 

53. "time.BodyAccJerkMag.std"  
A numeric value that represents the magnitude, using Euclidean norm, of a time domain signal for body linear acceleration captured at a constant rate of 50 Hz derived in time to obtain Jerk signals.  This is an average of the standard deviation values across raw signals. 

54. "time.BodyGyroMag.std" 
A numeric value that represents the magnitude, using Euclidean norm, of a time domain signal for body angular velocity measured with a gyroscope captured at a constant rate of 50 Hz.  This is an average of the mean values across raw signals.

55. "time.BodyGyroJerkMag.std"
A numeric value that represents the magnitude, using Euclidean norm, of a time domain signal for body angular velocity measured with a gyroscope captured at a constant rate of 50 Hz derived in time to obtain Jerk signals.  This is an average of the standard deviation values across raw signals.

56. "freq.BodyAcc.std.X"  
Equivalent to time domain signal in the frequency domain.  See definition of time domain signal.

57. "freq.BodyAcc.std.Y" 
Equivalent to time domain signal in the frequency domain.  See definition of time domain signal.

58. "freq.BodyAcc.std.Z" 
Equivalent to time domain signal in the frequency domain.  See definition of time domain signal.

59. "freq.BodyAccJerk.std.X"  
Equivalent to time domain signal in the frequency domain.  See definition of time domain signal.

60. "freq.BodyAccJerk.std.Y" 
Equivalent to time domain signal in the frequency domain.  See definition of time domain signal.

61. "freq.BodyAccJerk.std.Z"    
Equivalent to time domain signal in the frequency domain.  See definition of time domain signal.

62. "freq.BodyGyro.std.X" 
Equivalent to time domain signal in the frequency domain.  See definition of time domain signal.

63. "freq.BodyGyro.std.Y"    
Equivalent to time domain signal in the frequency domain.  See definition of time domain signal.

64. "freq.BodyGyro.std.Z" 
Equivalent to time domain signal in the frequency domain.  See definition of time domain signal.

65. "freq.BodyAccMag.std"   
Equivalent to time domain signal in the frequency domain.  See definition of time domain signal.

66. "freq.BodyAccJerkMag.std" 
Equivalent to time domain signal in the frequency domain.  See definition of time domain signal.

67. "freq.BodyGyroMag.std"  
Equivalent to time domain signal in the frequency domain.  See definition of time domain signal.

68. "freq.BodyGyroJerkMag.std" 
Equivalent to time domain signal in the frequency domain.  See definition of time domain signal.


