library(tidyverse)
library(tidymodels)
library(rio)
library(janitor)

set.seed(123)

# Import and clean data
StudentData <- import("Student_Performance.csv") |> 
  clean_names("upper_camel") |>  # Capitalize variable names
  mutate(Extracurriculars = if_else(ExtracurricularActivities == "Yes", 1L, 0L), #1L and )L ensures integer data types
    SamplePapers = SampleQuestionPapersPracticed
  ) |> #mutate chr to int as dummy var and clean names
  select(HoursStudied, PreviousScores, Extracurriculars, SleepHours, SamplePapers, PerformanceIndex) #select correct variables
  head(StudentData) #show the top 6 observations of the dataset to preview
        
  summary(StudentData) #will show if any NA values
  str(StudentData) #chr should now be int 0 & 1 and new variable names
  
  write.csv(StudentData, "Student_Performance_Clean.csv", row.names = FALSE)
  
  
  