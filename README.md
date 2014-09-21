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

<b>Codebook </b>
Please refer to the original codebook for more information.

New or modified variables from the original codebook

activityDescription - 1 of 6 values (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
subjectID - the id of the subject (1 - 30)
activityID - the values 1 to 6 corresponding with the activityDescription values

The remaining variables are all specific measurements from the original data.  The names have been changed to be more clear, with "t" changing to "Time", "f" changing to "Frequency" and removal of parenthesis.

Each numerical value is the mean over all the original data points (sensor output as a function of tiem) corresponding to one combination of subject and activity.  There are 180 combinations (30 subjects * 6 activities)

