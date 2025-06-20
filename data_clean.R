# Code written by Aditya Kakde, owner of account @Onnamission

library(tidyverse)
library(janitor)
library(readxl)


# Setting working directory

# print(getwd())
# setwd("D:/Projects/IBM-HR-Analytics")
# print(getwd())

df = read_excel('Dataset/IBM_human_resource.xlsx')

# View(df)


# Data Cleaning Pipeline

dataclean = df %>%
  drop_na() %>%
  janitor::clean_names()

# View(dataclean)


# Over18 as N (No) and then Y to 1 and N to 0

dataclean$over18[dataclean$age == 18] = "N"

dataclean$over18[dataclean$over18 == "Y"] = 1

dataclean$over18[dataclean$over18 == "N"] = 0

# View(dataclean)


# over_time YES = 1 & NO = 0

dataclean$over_time[dataclean$over_time == "Yes"] = 1

dataclean$over_time[dataclean$over_time == "No"] = 0

# View(dataclean)


# attrition YES = 1 & NO = 0

dataclean$attrition[dataclean$attrition == "Yes"] = 1

dataclean$attrition[dataclean$attrition == "No"] = 0

# View(dataclean)


# separate column for male

dataclean$male = c(dataclean$gender)

dataclean$male[dataclean$male == "Male"] = 1

dataclean$male[dataclean$male == "Female"] = 0

# View(dataclean)


# separate column for female

dataclean$female = c(dataclean$gender)

dataclean$female[dataclean$female == "Male"] = 0

dataclean$female[dataclean$female == "Female"] = 1

# View(dataclean)


# putting string values in education

dataclean$education[dataclean$education == 1] = "Below College"

dataclean$education[dataclean$education == 2] = "College"

dataclean$education[dataclean$education == 3] = "Bachelor"

dataclean$education[dataclean$education == 4] = "Master"

dataclean$education[dataclean$education == 5] = "Doctor"

# View(dataclean)


# putting string values in environment_satisfaction

dataclean$environment_satisfaction[dataclean$environment_satisfaction == 1] = "Low"

dataclean$environment_satisfaction[dataclean$environment_satisfaction == 2] = "Medium"

dataclean$environment_satisfaction[dataclean$environment_satisfaction == 3] = "High"

dataclean$environment_satisfaction[dataclean$environment_satisfaction == 4] = "Very High"

# View(dataclean)


# separate column for attrition YES = 1 & NO = 0

dataclean$attrition_str = c(dataclean$attrition)

dataclean$attrition_str[dataclean$attrition_str == 1] = "Yes"

dataclean$attrition_str[dataclean$attrition_str == 0] = "No"

# View(dataclean)


# putting string values in job_involvement

dataclean$job_involvement[dataclean$job_involvement == 1] = "Low"

dataclean$job_involvement[dataclean$job_involvement == 2] = "Medium"

dataclean$job_involvement[dataclean$job_involvement == 3] = "High"

dataclean$job_involvement[dataclean$job_involvement == 4] = "Very High"

# View(dataclean)


# putting string values in job_satisfaction

dataclean$job_satisfaction[dataclean$job_satisfaction == 1] = "Low"

dataclean$job_satisfaction[dataclean$job_satisfaction == 2] = "Medium"

dataclean$job_satisfaction[dataclean$job_satisfaction == 3] = "High"

dataclean$job_satisfaction[dataclean$job_satisfaction == 4] = "Very High"

# View(dataclean)


# putting string values in performance_rating

dataclean$performance_rating[dataclean$performance_rating == 1] = "Low"

dataclean$performance_rating[dataclean$performance_rating == 2] = "Good"

dataclean$performance_rating[dataclean$performance_rating == 3] = "Excellent"

dataclean$performance_rating[dataclean$performance_rating == 4] = "Outstanding"

# View(dataclean)


# putting string values in work_life_balance

dataclean$work_life_balance[dataclean$work_life_balance == 1] = "Bad"

dataclean$work_life_balance[dataclean$work_life_balance == 2] = "Good"

dataclean$work_life_balance[dataclean$work_life_balance == 3] = "Better"

dataclean$work_life_balance[dataclean$work_life_balance == 4] = "Best"

# View(dataclean)


# putting string values in relationship_satisfaction

dataclean$relationship_satisfaction[dataclean$relationship_satisfaction == 1] = "Low"

dataclean$relationship_satisfaction[dataclean$relationship_satisfaction == 2] = "Medium"

dataclean$relationship_satisfaction[dataclean$relationship_satisfaction == 3] = "High"

dataclean$relationship_satisfaction[dataclean$relationship_satisfaction == 4] = "Very High"

# View(dataclean)


# removing unnecessary columns

dataclean = subset(dataclean, select = -c(daily_rate, hourly_rate, monthly_rate, standard_hours, stock_option_level, training_times_last_year, years_since_last_promotion))

# View(dataclean)


# cleaning again just to be on the safe side

na_if(dataclean, "")

autit_data = na.omit(dataclean)

# View(autit_data)


# writing changes to excel file

# write.csv(autit_data, "ibmhr.csv", row.names = FALSE)
