# Getting and Cleaning Data: Final Project
File: README.md   Author: Raul Hermosa  Date: Dec 19, 2016
Content: Description of scripts of Final Project of course Getting and Cleaning Data

## Raw Data
AS provided in instructions they have been get from the zip file:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip (URL "Raw Data")

## R script
There is only one R script intended to execute all the actions to get the
data set asked "run_analysis.R".
The only prerequisite is that the zip file exists.

## Output data set
It produces a txt file that is written in the working directory named avg_data.txt and separated by " ". First two columns are variable factors
of activity and subject, rest as the means of each variable for mentioned factors.

## CodeBook
CodeBook.md explains transformations in R script

This script has comments according to steps pointed out in the intructions so, every step can be tested just examinating variables created