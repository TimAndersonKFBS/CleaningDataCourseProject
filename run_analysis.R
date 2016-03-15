run_analysis <- function() {
      
## Note, UCI HAR Dataset data must reside in a folder in the working directory
      
## Pull in all of the data
      x_test <- read.table("./UCI HAR Dataset/test/X_test.txt", quote="\"", comment.char="")  ## big data set
      y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", quote="\"", comment.char="")  ## Activity data
      subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", quote="\"", comment.char="")  ##Subject data
      
      x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", quote="\"", comment.char="")
      y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", quote="\"", comment.char="")  
      subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", quote="\"", comment.char="")
      
      features <- read.csv("./UCI HAR Dataset/features.txt", sep="", header=FALSE, stringsAsFactors=FALSE)

## Begin processing: Combine the three data sets
      
      subject_raw <- rbind(subject_test, subject_train)
      activity_raw <- rbind(y_test, y_train)  
      data_raw <- rbind(x_test, x_train)
      
      colnames(subject_raw) <- "subject_ID"
      
## Adding the descriptive name for the activity...probably an easier way to do this, but it should work

for (i in 1 : nrow(activity_raw)){
      if(activity_raw[i,] == 1) {activity_raw[i,2] <- "WALKING"}
      if(activity_raw[i,] == 2) {activity_raw[i,2] <- "WALKING_UPSTAIRS"}
      if(activity_raw[i,] == 3) {activity_raw[i,2] <- "WALKING_DOWNSTAIRS"}
      if(activity_raw[i,] == 4) {activity_raw[i,2] <- "SITTING"}
      if(activity_raw[i,] == 5) {activity_raw[i,2] <- "STANDING"}
      if(activity_raw[i,] == 6) {activity_raw[i,2] <- "LAYING"}
}

      colnames(activity_raw) <- c("activity_ID", "activity_name")
      
##Add descriptive titles for the data_raw data frame     

      colnames(data_raw) <- features[,2]


## Just want the columns that say either mean or std
      mean_std_cols <-  grep("mean|std", names(data_raw))
      get_data <- data_raw[, c(1,2,mean_std_cols)]

      
## Now combine the three data sets
      df1 <- cbind(subject_raw,activity_raw,get_data)
      write.csv(df1, "./UCI HAR Dataset/tidy_data_full.csv", row.names = FALSE)

## With this data it's time to summarize by Subject and Activity
      library(dplyr)
      df2 <- group_by(df1, subject_ID, activity_ID) %>% summarise_each(funs(mean))
      write.csv(df2, "./UCI HAR Dataset/tidy_data_small.csv", row.names = FALSE)

 }

