run_analysis <- function(){
    # using some functions from the plyr and dplyr packages
    library(plyr)
    library(dplyr)
    
    # download the zip file and unzip it (if not already done)
    #if(!file.exists("./data")) {dir.create("./data")}
    if(!file.exists("./data/UCI HAR Dataset")) {
        fileurl<-"http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
        zipfile<-"./data/UCI.zip"
        download.file(fileurl,zipfile)
        date.downloaded <-date()
        unzip(zipfile,exdir="./data/")
    }
    #Read in the data for the training set
    xtrain<-read.table("./data/UCI HAR Dataset/train/X_train.txt")
    #in the next line, I'm converting the values 1-6 for the activities to the factors 1=walking, 2=walking_upstairs (this is #3)
    #as described in the activities_labels.txt file
    labels<-read.table("./data/UCI HAR Dataset/activity_labels.txt")
    #read.table reads these two files in as a data frame (matrix with 1 column), but really it's a vector so I just grab the first column by [,1]
    xtrain$activity<-factor(read.table("./data/UCI HAR Dataset/train/y_train.txt")[,1],levels=labels$V1,labels=as.character(labels$V2))
    xtrain$subject<-read.table("./data/UCI HAR Dataset/train/subject_train.txt")[,1]
    
    #Repeat for the test set: creating a set with an identical set of columns
    xtest<-read.table("./data/UCI HAR Dataset/test/X_test.txt")
    xtest$activity<-factor(read.table("./data/UCI HAR Dataset/test/y_test.txt")[,1],levels=labels$V1,labels=as.character(labels$V2))
    xtest$subject<-read.table("./data/UCI HAR Dataset/test/subject_test.txt")[,1]
    
    #Combine the sets--right now the first 561 columns are not labelled.  (this is #1)
    data<-rbind(xtrain,xtest)
    
    colnames<-read.table("./data/UCI HAR Dataset/features.txt",)
    names(data)[colnames[,1]]<-as.character(colnames[,2])
    
    #I only want the columns with mean() or std() in them plus the subject and the activity (that I want listed first).
    # grep will give me these indices that I'll store in "indices".
    # Note: could have used select & contains for this, but I had already written this grep version
    indices <-c(grep("subject",names(data)), grep("activity",names(data)),grep("mean()",names(data),fixed=TRUE),grep("std()",names(data),fixed=TRUE))
    
    #Now I will only take the columns in indices.  This completes #3.  Now, #1, #2, and #3 are done.
    #data has 10299 rows and 68 columns
    data<-data[,indices]
    
    
    #adjust colnames to be a little more readable, t=time, f=freq, Acc=Acceleration, Mag=Magnitude, Gyro=Gyroscope
    #plus get rid of the () and -
    #(To complete #4)
    colnames<-names(data)
    colnames<-sub("-mean()",".mean",colnames,fixed=TRUE)
    colnames<-sub("-std()",".stdev",colnames,fixed=TRUE)
    colnames<-sub("-X",".x",colnames,fixed=TRUE)
    colnames<-sub("-Y",".y",colnames,fixed=TRUE)
    colnames<-sub("-Z",".z",colnames,fixed=TRUE)
    colnames<-sub("tBody","timeBody",colnames,fixed=TRUE)
    colnames<-sub("tGravity","timeGravity",colnames,fixed=TRUE)
    colnames<-sub("fBody","freqBody",colnames,fixed=TRUE)
    colnames<-sub("fGravity","freqGravity",colnames,fixed=TRUE)
    colnames<-sub("tBody","timeBody",colnames,fixed=TRUE)
    colnames<-sub("BodyBody","Body",colnames,fixed=TRUE) # this fixes a typo in the description file
    colnames<-sub("Acc","Acceleration",colnames,fixed=TRUE)
    colnames<-sub("Mag","Magnitude",colnames,fixed=TRUE)
    colnames<-sub("Gyro","Gyroscope",colnames,fixed=TRUE)
    names(data)<-colnames
    
    #this is #5
    #not including the first 2 columns for aggregate so it doesn't try to take a mean of subject & activity
    tidydata<-aggregate(data[,c(-1,-2)],list(subject = data$subject,activity = data$activity),mean)
    write.table(tidydata,"tidydata.txt",row.names=FALSE,quote=FALSE)
    return(tidydata)
}