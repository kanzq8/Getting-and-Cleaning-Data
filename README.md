# Getting-and-Cleaning-Data

This repository contains the final project for the Getting and Cleaning Data Module.

The run_analysis.R script performs the following tasks:

1. Loads the training data from the HAR Dataset including the raw data, activity, and subject id; then are vertically combined
2. Loads the testing data from the HAR Dataset include the raw data, activity, and subject id; then are vertically combined
3. Append the two datasets into one combined dataset
4. Loads the column names for the 561 variables, and adds name for the Activity and Subject columns
5. Columns are filtered to include only values having either mean values or standard deviation
6. Activity column number values are replaced with factor values
7. Aggregation is done to calculate the mean for each activity, subject pair
