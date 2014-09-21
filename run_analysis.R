library(plyr)

#Read in the files 
activityLabels <- read.table("activity_labels.txt")
featureLabels <- read.table("features.txt")
trainingSet <- read.table("./train/X_train.txt")
trainingActivityIDs <- read.table("./train/Y_train.txt")
trainingSubjectIDs <- read.table("./train/subject_train.txt")
testSet <- read.table("./test/X_test.txt")
testActivityIDs <- read.table("./test/Y_test.txt")
testSubjectIDs <- read.table("./test/subject_test.txt")

#STEP 1
#merge the training and test data sets
mergedSet <- rbind(trainingSet, testSet)

#merge the training and test data activity labels
mergedActivityIDs <- rbind(trainingActivityIDs, testActivityIDs)

#merge the training and test subject IDs
mergedSubjectIDs <- rbind(trainingSubjectIDs, testSubjectIDs)

#STEP 2
#determine features that are only mean and std results
meanStdFeatures <- featureLabels[c(
  grep("-mean()",featureLabels$V2,fixed=TRUE), 
  grep("-std()",featureLabels$V2,fixed=TRUE)
  ),]
#reorder the result
meanStdFeatures <- meanStdFeatures[order(meanStdFeatures$V1),]

#take subset including only mean and std features
mergedSubSet <- mergedSet[meanStdFeatures$V1]

#add IDs columns
mergedSubSet <- cbind(mergedSubSet,mergedSubjectIDs)
mergedSubSet <- cbind(mergedSubSet,mergedActivityIDs)

#STEP 4
#clean up feature (variable) names
meanStdFeatures$V2 <- gsub("()","",meanStdFeatures$V2,fixed=TRUE)
meanStdFeatures$V2 <- sub("^t","Time-",meanStdFeatures$V2,fixed=FALSE)
meanStdFeatures$V2 <- sub("^f","Frequency-",meanStdFeatures$V2,fixed=FALSE)

#replace column names
colnames(mergedSubSet) <- c(meanStdFeatures$V2,"subjectID","activityID")

#STEP 3
# create activity descritions
mergedSubSet <- merge(mergedSubSet,activityLabels)

#STEP 5
#create average of each variable, by subject and activity
tidySet <- ddply(mergedSubSet,.(activityDescription,subjectID),numcolwise(mean))
