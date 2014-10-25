cleaning-data-project
=====================

I just used one script to carry out the analysis, which first combines the activity labels (activity_labels.txt and y_test.txt) and subject information (subject_test.txt) with the data for the test set (x_test.txt), and also labels each column of data, using the features.txt file. 

Then the script does the same for the train data. 

Once that is complete, the data sets are combined, and a column that was used for assigning activity labels was removed. 

Once the sets are combined, using "select" and "contains" from the dplyr package, only the variables whose names contain "mean" and "std" are retained, according to the instructions. 
