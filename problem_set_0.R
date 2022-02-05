###########################################################
# Data Visualization for Public Informatics Problem Set 0 #
###########################################################

# Instructions

# Your first assignment will be to apply concepts learned in the first two lectures to read in a dataset to R and implement basic data analysis tools to demonstrate
# your understanding of R.

# Complete this R code and answer all questions as comments by matching this format and prefacing your answer with the # symbol.

## Learning Objectives

# After you complete the exercises in this notebook, you should be able to do the following:
  
# Read in a CSV format dataset into R and understand the functions needed to do so. 
# Describe the structure and content of a dataset using basic data exploration functions in R.
# Group, summarize & filter the dataset using the `{dplyr}` package to prepare data for visualization.
# Produce simple plots of the data using base R to quickly explore the data.

# Data
# For this problem set we will use the following dataset that tracks the housing market at the ZIP code level.
# The dataset can be found at https://econdata.s3-us-west-2.amazonaws.com/Reports/Core/RDC_Inventory_Core_Metrics_Zip_History.csv

# Part 0: Environment setup
# Load any required libraries using the library() function in this section.
library('tidyverse')

# Part 1: Reading in the data.
# Prepare R code to read in the the dataset to your R session using the tidyverse. Assign your dataframe the name "housing."

#This is one way to do it straight from the URL:
# housing <- read_csv(url("https://econdata.s3-us-west-2.amazonaws.com/Reports/Core/RDC_Inventory_Core_Metrics_Zip_History.csv"))

#But, it was taking too long for some reason so I just downloaded it first, and then loaded it:
setwd("~/GitHub/datavizpset0")
housing <- read_csv("RDC_Inventory_Core_Metrics_Zip_History.csv")

# Part 2: Inspecting the data
# Using base R data exploration functions, inspect the housing dataset you've created and answer the following questions.
# Show code for all answers.

# 1. What are the dimensions of your dataset? How many columns and how many rows does it have?
dim(housing)
# 1,905,956 rows and 40 columns

# 2. Take a look at the structure of the data. What is the most common data type within this dataset?
str(housing)
# Most of the variables are numeric

# 3. Show the first few rows of the dataset
head(housing)
# Woah, check them out!

# 4. Print a summary of the dataset using R
summary(housing)
# Quite a large output, but we get to see summaries of each variable. Very useful!

# 5. Using the summary that you've created, write down the maximum value of the column 'median_listing_price_per_square_foot'
# 825000.0 is the max value for that variable.

# Part 3: Transform, filter & visualize the data
# This dataset is quite large. We will filter and summarize it in this section before visualizing it.

# 1. Use dplyr to filter the dataset to the month of December, 2021 (202112). Use the column month_date_yyyymm to filter the data.
# Store your filtered dataset under the name housing_dec_21
housing_dec_21 <- housing %>% filter(month_date_yyyymm==202112)
# We can use filter from dplyr to filter only those entries fro the time period we want.

# 2. Use base R graphics to plot the median_listing_price column from housing_dec_21 with the default options. Be sure to access your data using the $ operator
plot(housing_dec_21$median_listing_price)
#plot() will give us a scatterplot of our data.

# 3. Take your answer to the previous question and change it from a scatterplot to a histogram using the "type" argument to the plot() function. Run help(plot) if you are unclear.
plot(housing_dec_21$median_listing_price,type="h")
#type = 'h' is makes plot print an histogram instead of a scatterplot

# 4. Pick another variable of your choice from the dataset and visualize it as you did in the previous question.
plot(housing_dec_21$median_days_on_market,type="h")

# 5. Use dplyr to rearrange your housing_dec_21 dataset. Arrange it by the median_listing_price in descending order. List the top 3 postal codes by median listing price.
housing_dec_21 <- housing_dec_21 %>% arrange(desc(median_listing_price))
#Top 3 zip codes by median listing price:
#1. 31004 - $45,250,000
#2. 10985 - $30,000,000
#3. 02453 - $27,500,000

# 6. Follow the same steps as the previous question, but eliminate the descending order. Identify the bottom 3 postal codes for median listing price.
housing_dec_21 <- housing_dec_21 %>% arrange(median_listing_price)
#Bottom 3 zip codes by median listing price:
#1. 44624 - $1
#2. 44878 - $1
#3. 26169 - $1
