
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

## Download and unzip data
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

## Make common directory structure and add initial files
make.common <- function() {
  ## Directory "combo" with all the common files:
  dir.create(path = 'combo', showWarnings = TRUE)
  
  ## activity_labels.txt
  ## features.txt
  ## features_info.txt
  file_list <- c('activity_labels.txt', 'features.txt', 'features_info.txt')
  
  for( i in seq_along(file_list) ) {
    path <- file.path('UCI HAR Dataset', file_list[i])
    file.copy(path, 'combo')
  }
  
  ## Make subdir Inertial_Signals
  dir.create('Inertial_Signals', showWarnings = TRUE)
}

## Merge subject_test.txt and subject_train.txt
merge_subject <- function() {
  ## Read in the two files
  subject_test <- read.table(file.path('UCI HAR Dataset','test','subject_test.txt'))
  subject_train <- read.table(file.path('UCI HAR Dataset','train','subject_train.txt'))
  
  ## Add train onto the end of test
  max_test <- max(subject_test)
  subject_train_adjusted <- subject_train + max_test
  
  subject_combo <- rbind(subject_test, subject_train_adjusted)
  save(subject_combo, file = file.path('combo','subject.txt'))
}

## Merge X_test.txt and X_train.txt
merge_X <- function() {
  ## Read in the two files
  X_test <- read.table(file.path('UCI HAR Dataset','test','X_test.txt'))
  X_train <- read.table(file.path('UCI HAR Dataset','train','X_train.txt'))
  
  ## Add train onto the end of test
  max_test <- max(X_test)
  X_train_adjusted <- X_train + max_test
  
  X_combo <- rbind(X_test, X_train_adjusted)
  save(X_combo, file = file.path('combo','X.txt'))
  
}

## Merge y_test.txt and y_train.txt
merge_y <-function() {
  
}

## Merge Inertial Signals files
## body_acc_x_test.txt with body_acc_x_train.txt
## etc...
merge_inertial_signals <- function() {
  
}

run_analysis <- function() {
  
  #download.data()
  make.common()
  merge_subject()
  merge_X()
  merge_y()
  merge_inertial_signals()
}
