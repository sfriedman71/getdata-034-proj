
## run_analysis.R
##
## You should create one R script called run_analysis.R that does the following. 
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
##
## Which   When        Who               What
##  1.0    5-Nov-2015  Sam Friedman      Initial draft
##
##

download.data <- function() {
  file_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  destfile <- "UCI_HAR_Dataset.zip"
  download.file(file_url, destfile = destfile, method = "curl")
  
  if( any(list.files() == destfile) ) {
    unzip(destfile, overwrite = TRUE)
    return(TRUE)
  }
  else {
    return(FALSE);
  }
}

merge_datasets <- function( set_v = c('test','train') ) {
  
}

extract_measurement <- function() {
  
}

run_analysis <- function() {
  
}
