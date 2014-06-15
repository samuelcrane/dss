setwd("~/Dropbox/dss/02-R")
x <- read.csv('hw1_data.csv')

#Peeking at the data
x[1:3, ]
x[151:153, ]



#Remove missing values and find average
missing_values <- is.na(x$Ozone)
new_Ozone <- (x$Ozone[!missing_values])
mean(new_Ozone)

cond1 <- x$Ozone > 31


dat <- (x$Ozone > 31) and (x$Temp > 90)

# Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R in this subset?
newdata <- x[ which(x$Ozone > 31 & x$Temp > 90), ]
average <- mean(newdata$Solar.R)
average

# What is the mean of "Temp" when "Month" is equal to 6?
newdata <- x[ which(x$Month =='6'), ]
average <- mean(newdata$Temp)
average

# What was the maximum ozone value in the month of May (i.e. Month = 5)?
newdata <- x[ which(x$Month =='5'), ]
max(newdata$Ozone, na.rm=TRUE)