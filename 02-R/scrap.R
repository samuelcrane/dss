# 
pollutantmean('/Users/sc/Dropbox/dss/02-R/specdata', 'sulfate', id=1:10)
pollutantmean('/Users/sc/Dropbox/dss/02-R/specdata', 'nitrate', id=70:72)
pollutantmean('/Users/sc/Dropbox/dss/02-R/specdata', 'nitrate', 23)

#
pollutant_data <- data.frame()

path <- '/Users/sc/Dropbox/dss/02-R/specdata'
files <- list.files(path)
full_path <- paste(path,files[1],sep="/")
full_path <- paste(path,files[2],sep="/")

station <- read.csv(full_path,header=TRUE)
pollutant_data <- rbind(pollutant_data, station)

mean(pollutant_data$sulfate, na.rm=TRUE)



#
pollutant_data <- data.frame()

files <- list.files(directory)

for(i in id) {
  full_path <- paste(path,files[i],sep="/")
  station <- read.csv(full_path,header=TRUE)
  pollutant_data <- rbind(pollutant_data, station)
}
mean(pollutant_data$pollutant, na.rm=TRUE)



#
complete("specdata", 1)
complete('/Users/sc/Dropbox/dss/02-R/specdata', c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)

#
source("corr.R")
corr("specdata", 0)

source("corr.R")
source("complete.R")
cr <- corr("specdata", 150)
head(cr)

cr <- corr("specdata")
summary(cr)


library(datasets)
data(mtcars)
with(mtcars, tapply(mpg, cyl, mean))
sapply(split(mtcars$mpg, mtcars$cyl), mean)