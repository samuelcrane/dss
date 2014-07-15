corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  dat <- vector('numeric')
  files <- list.files(directory)
  id <- 1:length(files)
  
  for(i in id) {
    station <- read.csv(file.path(directory,files[i]),header=TRUE)
    if (sum(complete.cases(station)) > threshold) {
      station <- station[complete.cases(station),]
      cr <- cor(station$sulfate, station$nitrate)
      dat <- c(dat, cr)      
    }
  }
  dat
}