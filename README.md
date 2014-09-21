Getting-and-Cleaning-Data-Project
=================================


Script Process:

Read in all of the required data files from (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). It is assumed that the .zip file is unzipped in the working directory

#Step 1
merge the training and test datasets into one dataset
merge the training and test subject and activity ids into one dataset

#Step 2
make a subset of the feature variables that consist only of standard deviation and mean measurements. This is done by parsing the variable names looking for "std" and "mean" respectively

reorder the feature variables so that they are in the original order. Picking out the standard deviation and mean variables left the dataset incorrectly ordered

using the ordered set, pick out only the subset of the merged dataset from before.
add the 2 id columns to the dataset of mean and standard deviation measurements

#Step 4 (out of order from assignment)
Clean up the variable names to make them more readable. I left hyphens because I feel that makes them more readable.
add the cleaned up column names (As well as id column names) to the dataset

#Step 3
create a column with the activity descriptions that match the activity ID column

#Step 5
create the final tidy data set with the average of each variable, broken down by subjectID and activity description for a total of 180 values (6 activities * 30 subjects)
