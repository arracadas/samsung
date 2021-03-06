## R Script for Getting and Cleaning Data Course Project
========================================================

## Description of source data
This R script uses the following source data:
Human Activity Recognition Using Smartphones 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

A full description of the data set is available on the website; here is a short description:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually.

## Objective of the assignment
With the data set from "Human Activity Recognition Using Smartphones" this R Script will accomplish the following objectives:

* Merge the training and the test sets to create one data set.
* Extract only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately label the data set with descriptive activity names. 
* Create a second, independent tidy data set with the average of each variable for each activity and each subject.

## R script steps

The first step is to load data files for features and activities.  The features file shows a complete list of variables.  From this list we will extract only those variables related to mean and standard deviation.  The grep() function is a string function that helps serve this purpose.
```{r}
### load features and activity desc files
features <- read.table("./UCI HAR Dataset/features.txt"
                       ,header = FALSE
                       ,col.names = c("id", "var_name"))

activity_desc <- read.table("./UCI HAR Dataset/activity_labels.txt"
                       ,header = FALSE
                       ,col.names = c("id", "activity_name"))

### find columns that show mean() and std() variables
mean.v <- grep("mean()"
               ,features$var_name
               ,fixed = TRUE)
std.v<- grep("std()"
             ,features$var_name
             ,fixed = TRUE)
```        
Here is the list of mean and std variables after using the grep() function:
 [1] "tBodyAcc.mean...X"           "tBodyAcc.mean...Y"           "tBodyAcc.mean...Z"          
 [4] "tGravityAcc.mean...X"        "tGravityAcc.mean...Y"        "tGravityAcc.mean...Z"       
 [7] "tBodyAccJerk.mean...X"       "tBodyAccJerk.mean...Y"       "tBodyAccJerk.mean...Z"      
[10] "tBodyGyro.mean...X"          "tBodyGyro.mean...Y"          "tBodyGyro.mean...Z"         
[13] "tBodyGyroJerk.mean...X"      "tBodyGyroJerk.mean...Y"      "tBodyGyroJerk.mean...Z"     
[16] "tBodyAccMag.mean.."          "tGravityAccMag.mean.."       "tBodyAccJerkMag.mean.."     
[19] "tBodyGyroMag.mean.."         "tBodyGyroJerkMag.mean.."     "fBodyAcc.mean...X"          
[22] "fBodyAcc.mean...Y"           "fBodyAcc.mean...Z"           "fBodyAccJerk.mean...X"      
[25] "fBodyAccJerk.mean...Y"       "fBodyAccJerk.mean...Z"       "fBodyGyro.mean...X"         
[28] "fBodyGyro.mean...Y"          "fBodyGyro.mean...Z"          "fBodyAccMag.mean.."         
[31] "fBodyBodyAccJerkMag.mean.."  "fBodyBodyGyroMag.mean.."     "fBodyBodyGyroJerkMag.mean.."
[34] "tBodyAcc.std...X"            "tBodyAcc.std...Y"            "tBodyAcc.std...Z"           
[37] "tGravityAcc.std...X"         "tGravityAcc.std...Y"         "tGravityAcc.std...Z"        
[40] "tBodyAccJerk.std...X"        "tBodyAccJerk.std...Y"        "tBodyAccJerk.std...Z"       
[43] "tBodyGyro.std...X"           "tBodyGyro.std...Y"           "tBodyGyro.std...Z"          
[46] "tBodyGyroJerk.std...X"       "tBodyGyroJerk.std...Y"       "tBodyGyroJerk.std...Z"      
[49] "tBodyAccMag.std.."           "tGravityAccMag.std.."        "tBodyAccJerkMag.std.."      
[52] "tBodyGyroMag.std.."          "tBodyGyroJerkMag.std.."      "fBodyAcc.std...X"           
[55] "fBodyAcc.std...Y"            "fBodyAcc.std...Z"            "fBodyAccJerk.std...X"       
[58] "fBodyAccJerk.std...Y"        "fBodyAccJerk.std...Z"        "fBodyGyro.std...X"          
[61] "fBodyGyro.std...Y"           "fBodyGyro.std...Z"           "fBodyAccMag.std.."          
[64] "fBodyBodyAccJerkMag.std.."   "fBodyBodyGyroMag.std.."      "fBodyBodyGyroJerkMag.std.."


Next step is to load the files related to the training set.
```{r}
### load subject file for train set
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt"
                       ,header = FALSE
                       ,col.names = c("subject_id"))

### load activity for train set
y_train.df <- read.table("./UCI HAR Dataset/train/y_train.txt"
                      ,header = FALSE
                      ,col.names = c("activity_id"))

### add activity description
y_train.df <- merge(y_train.df, activity_desc
                    ,by.x="activity_id"
                    ,by.y="id")

### load data for train set
x_train.df <- read.table("./UCI HAR Dataset/train/X_train.txt"
                         ,header = FALSE
                         ,col.names = features$var_name)
                         #,nrows = 100)
```                  

Now the script creates a subset of data with only mean and std variables and combines the subject id, activity name and training data into one data frame called x_train.df.  The cbind() function provides a convenient way to combine multiple vectors into a data frame.
```{r}
### subset data frame to show columns only with mean() and std() variables
x_train.df <- x_train.df[,c(mean.v, std.v)]

### prepare train set with subject and activity names
x_train.df <- cbind(subject_train, y_train.df["activity_name"], x_train.df)
```

Now the script repeats the same steps for the test data.
```{r}
### load subject file for test set
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt"
                            ,header = FALSE
                            ,col.names = c("subject_id"))

### load activity for test set
y_test.df <- read.table("./UCI HAR Dataset/test/y_test.txt"
                         ,header = FALSE
                         ,col.names = c("activity_id"))

### add activity description
y_test.df <- merge(y_test.df, activity_desc
                    ,by.x="activity_id"
                    ,by.y="id")

### load data for train set
x_test.df <- read.table("./UCI HAR Dataset/test/X_test.txt"
                         ,header = FALSE
                         ,col.names = features$var_name)

### subset data frame to show columns only with mean() and std() variables
x_test.df <- x_test.df[,c(mean.v, std.v)]

### prepare test set with subject and activity names
x_test.df <- cbind(subject_test, y_test.df["activity_name"], x_test.df)
```

Before combining train and test data frames together, the script checks the number of rows and columns in each data frame.
```{r}
### check rows and columns for train and test sets
ncol(x_train.df); nrow(x_train.df)

ncol(x_test.df); nrow(x_test.df)
```

Now it binds rows from train and test data frames together into a data table called samsung.  It also checks for nrows to make sure that total row count matches with the individual data frames.  The data.table library provides functions that are useful for this assignment.

```{r}
### combine train and test data sets into data table
samsung <- data.table(rbind(x_train.df, x_test.df))

nrow(samsung)
```

Next the script fixes some of the column names in the data table.  The goal is to add column labels that are more meaningful.  For instance by removing "..." or eliminating duplicate text "BodyBody".

```{r}
### create vector with column names
col <- colnames(samsung)

### use vector to fix column names by making following changes
for (i in seq_along (col)) {
  
      ### fix "...X", "...Y" or "...Z"
      if (i %in% grep("...X", col, fixed = TRUE)) {
          col[i] <- gsub("...X"
                         ,".X"
                         ,fixed = TRUE
                         ,col[i]
          )
      }
      if (i %in% grep("...Y", col, fixed = TRUE)) {
          col[i] <- gsub("...Y"
                         ,".Y"
                         ,fixed = TRUE
                         ,col[i]
          )
      }
      if (i %in% grep("...Z", col, fixed = TRUE)) {
          col[i] <- gsub("...Z"
                         ,".Z"
                         ,fixed = TRUE
                         ,col[i]
          )
      }
      
      ### replace "t" and "f" with "time" and "freq"
      if (substr(col[i],1,1) == "t") {
          col[i] <- paste("time."
                          ,substr(col[i],2,nchar(col[i]))
                          ,sep=""
          )
      }
      if (substr(col[i],1,1) == "f") {
          col[i] <- paste("freq."
                          ,substr(col[i],2,nchar(col[i]))
                          ,sep=""
          )
      }
      
      ### fix "BodyBody" and ".."
      if (i %in% grep("BodyBody", col, fixed = TRUE)) {
          col[i] <- gsub("BodyBody"
                         ,"Body"
                         ,fixed = TRUE
                         ,col[i]
          )
      }
      if (i %in% grep("..", col, fixed = TRUE)) {
        col[i] <- gsub(".."
                       ,""
                       ,fixed = TRUE
                       ,col[i]
        )
      }
}

### assign new column names to data table

setnames(samsung, colnames(samsung), col)
```

Then the file calculates the mean and standard deviation for each variable across subject id and activity name.  It makes sure to remove NA values.  For this purpose the script uses the data table special variable .SD to summarize data by subject id and activity name.

```{r}
### calculate mean for each variable
samsung_mean <- samsung[,lapply (.SD, mean, na.rm = TRUE), by = list(subject_id, activity_name)]

### order rows in table
samsung_mean <- samsung_mean[order(subject_id, activity_name)]
```

The final step is to export the tidy data set into a text file.  In this case, a tab delimited file is created.

```{r}
### create tidy data file "samsung_mean.txt"
write.table(samsung_mean, file = "./samsung_mean.txt"
            ,sep="\t"
            ,col.names = TRUE
            ,row.names = FALSE
            )
```