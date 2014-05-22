## Created May 2014
## The purpose of this R script is to create a tidy data set by merging files
## from two sources: a train set and test set.  These files contain a large 
## number of variables but only mean and std variables will be used to create
## the tidy data set.

### load libraries
library(data.table)

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

### subset data frame to show columns only with mean() and std() variables
x_train.df <- x_train.df[,c(mean.v, std.v)]

### prepare train set with subject and activity names
x_train.df <- cbind(subject_train, y_train.df["activity_name"], x_train.df)



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

### check rows and columns for train and test sets
ncol(x_train.df); nrow(x_train.df)

ncol(x_test.df); nrow(x_test.df)


### combine train and test data sets into data table
samsung <- data.table(rbind(x_train.df, x_test.df))

nrow(samsung)

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


### calculate mean for each variable
samsung_mean <- samsung[,lapply (.SD, mean, na.rm = TRUE), by = list(subject_id, activity_name)]

### order rows in table
samsung_mean <- samsung_mean[order(subject_id, activity_name)]


### create tidy data file "samsung_mean.txt"
write.table(samsung_mean, file = "./samsung_mean.txt"
            ,sep="\t"
            ,col.names = TRUE
            ,row.names = FALSE
            )

