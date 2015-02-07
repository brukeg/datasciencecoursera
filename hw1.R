#setting up:
setwd(Desktop/datasciencecoursera)
x <- read.csv("hw1_data.csv")

#Extract the first two rows of the dataset and print them.
x[1:2, 1:6]
subset(x, Month == 5 & Day < 3)

#How many rows are in the dataset?
nrow(x)

#Extract the last two rows of the dataset and print them.
subset(x, Month == 9 & Day > 28)

last2 <- nrow(x)
x[(last2-1):last2,]

#What is the Ozone value in the 47th row?
x[47, "Ozone"]
x[47, 1]

#How many missing values are in the Ozone column?
##Why is the syntax different for is.na and complete.cases?
sum(is.na(x)[, "Ozone"])
sum(is.na(x)[, 1])

sum(!complete.cases(x[, "Ozone"]))
sum(!complete.cases(x[, 1]))

#What is the mean value of the Ozone column (excluding missing values)?
subset(x, select = Ozone)
themean <- subset(x, select = Ozone)
mean(themean[, "Ozone"], na.rm = TRUE)
##replace 'themean' with the what it represents
mean(subset(x, select = Ozone)[, "Ozone"], na.rm = TRUE)
###some other quicker solutions
mean(x[, "Ozone"], na.rm = TRUE)
mean(x[complete.cases(x), "Ozone"])

### Why do these work
mean(x[complete.cases(x),"Ozone"])
mean(x[, "Ozone"], na.rm = TRUE)

### but this doesn't? c.c(x) is logical vector and is.na(x) is a matrix
mean(x[!is.na(x), "Ozone"])

# What is mean Solar.R value of subset with Ozone > 31 and Temp > 90?
g <- subset(x, Ozone > 31 & Temp > 90)

mean(g[, "Solar.R"], na.rm = TRUE)

#Same, with a single line of code
mean(subset(x, Ozone > 31 & Temp >90)[, "Solar.R"], na.rm = TRUE)

#What is the mean of "Temp" when "Month" is equal to 6?
mean(subset(x, Month == 6)[, "Temp"])

## To see that in action
subset(x, Month == 6)
subset(x, Month == 6)[, "Temp"]
h <- subset(x, Month == 6)[, "Temp"]
mean(h)

## or... h <-
subset(x, Month == 6, select = Ozone:Day)
subset(x, Month == 6, Day = 1:30)
subset(x, Month == 6, Day = 1:nrow(x))
mean(h[, "Temp"])

# What was the maximum ozone value in the month of May (i.e. Month = 5)?
subset(x, Month == 5)
subset(x, Month == 5)[, "Ozone"]
v <- subset(x, Month == 5)[, "Ozone"]
max(v, na.rm = TRUE)

##One line of code
max(subset(x, Month == 5)[, "Ozone"], na.rm = TRUE)

#How many missing values are in the Ozone column?
sum(!complete.cases(x[, "Ozone"]))

#What is the mean value of the Ozone column (excluding missing values)?
mean(x[, "Ozone"], na.rm = TRUE)

##this don't work:
mean(!is.na(x[, 1]), na.rm = TRUE) 

#What is the data type of the Month column?
class(x[, "Month"])
class(x[, 5])

