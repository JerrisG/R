# Load libraries
library(tidyverse);library(corrplot);library(caret);library(Metrics)

# Load Data 80/20 split currently
set.seed(300)
data.train <- read.csv("C:/casestudy/Training_R-197135_Candidate Attach #1_JDSE_SRF #456.csv",
                       header = TRUE)
data.test <- read.csv("C:/casestudy/Test_R-197135_Candidate Attach #2_JDSE_SRF #456.csv",
                      header = TRUE)

# Review train data
view(data.train)
dim(data.train)
str(data.train)

# combine data
data <- rbind(data.train,data.test)

# Check for missing data
sum(is.nan(as.matrix(data)))
sum(is.na(as.matrix(data)))
sum(data$rep_education == "")

# replace missing information with NA
data$rep_education[data$rep_education == ""] <- NA

colSums(is.na(data))


# Remove missing data
data2 <- na.omit(data)

# Recheck data
sum(is.na(as.matrix(data2)))
view(data2)
dim(data2)
str(data2)

# check levels in rep_education
unique(data2$rep_education)
table(data2$rep_education)

data2$rep_education <- as.factor(data2$rep_education)
# Check response 
plot(table(data.train$Def_ind))

# Check correlation 
cor(data2[,c(1:19,21)])
corrplot(cor(data2[,c(1:19,21)]),method = "number", tl.cex = .35)
