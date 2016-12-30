# CodeBook
File: CodeBook.md
Author: Raul Hermosa
Date: Dec 19, 2016
Content: Brief explanation of R script and variables used

# About organization of the R script
It has clear comments helping to follow transformations, there are some relevant comments that indicate the steps according to the requests contained in instruction set.

# STEP 1: Downloading the zip file, extracting the files and merging data
1. doc: contains all files extracted
2. activity: activity labels
3. features: features labels
4. test_XXXX: all data read in test files merging for merging
5. train_XXXX all data read in train files needed for merging
6. ncol_test_data: number of columns of original data sets
7. data: merged dataset with the activity and subject columns appended in last 2 columns

# STEP 2: Reading features labels and selecting menas and std devs
8. features: contains the description of features
9. cols_to_remain: contain which columns have means or std dev using grep
10. features: reloaded with useful columns of data
11. data: reassigned without unseful columns through features variable

# STEP 3: Making descriptive the variable activity
It chooses the activity label in activity variable (defined in step 1) according to its value and it replaces the value

# STEP 4: Making name of variables more appropiate
12. feat_str: it stores the features labels as character despite factors
13. z: it is a vector contaning all the new names of variables, including 2 new variables we added in the beginning
It eliminates no proper character in the names of this variables and transfors everything to lower case.
It assigns the vector to column names of data

# STEP 5: Generating a new data set with means of each variable
It transforms activity and subject variable into factor to be used as components of the list to group
It applies aggregate function so the result is directly get. There is 2 new columns "factactivity" and "factsubject" pointing out the value of grouping variables.
It removes in "avg_data" the last two columns since there is no sense (they were activity and subject) and writes the result to a csv file "avg_data.csv" in working directory.

