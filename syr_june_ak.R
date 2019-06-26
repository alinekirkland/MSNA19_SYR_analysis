# setup

library(dplyr)
library(koboquest) # manage kobo questionnaires
library(kobostandards) # check inputs for inconsistencies
library(xlsformfill) # generate fake data for kobo
library(hypegrammaR) # simple stats 4 complex samples
library(composr) # horziontal operations
library(tidyr)

source("functions/to_alphanumeric_lowercase.R")
source("functions/analysisplan_factory.R")
source("functions/results_handling.R")

questions <- read.csv("input/questions.csv",
         stringsAsFactors = F)

choices <- read.csv("input/choices.csv",
                    stringsAsFactors = F)

questions <- standardise_kobo_questions(questions = questions)
choices <- standardise_kobo_choices(choices = choices)

sampleframe <- read.csv(file = "input/sample.csv",
                   stringsAsFactors = F)

sampleframe <- sampleframe %>% group_by(PCODE.Admin4) %>% 
  summarise(gov_population = sum(Households)) %>% 
  rename(stratum = PCODE.Admin4)

?load_questionnaire

questionnaire <- load_questionnaire(data.frame(),questions = questions, choices = choices, choices.label.column.to.use = NULL)

questionnaire$question_type("")

#percentage from categorical variables
#choices %>% group_by(list_name,name) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))

# ctrl shift m for pipe operator

# coverting all columns to lower case
#as.data.frame(lapply(questions, tolower),stringsAsFactors = FALSE)


