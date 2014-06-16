pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  pollutant_data <- data.frame()

  files <- list.files(directory)

  for(i in id) {
    station <- read.csv(file.path(directory,files[i]),header=TRUE)
    pollutant_data <- rbind(pollutant_data, station)
  }

  mean(pollutant_data[ ,pollutant], na.rm=TRUE)
}

