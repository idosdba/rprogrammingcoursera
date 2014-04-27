corr <- function(directory, threshold = 0)  {
  
  # Set the directory, read all the csv files that directory, 
  # and then generate working file subset
  dataDirectory <- paste(getwd(), directory, sep="/")
  allFilesSet <- list.files(dataDirectory, pattern=".csv", full.names=TRUE)
  
  resultCorVector <- numeric(0)
   
  for (i in seq_along(allFilesSet)) {
  
    # read the data for each file
    monitorData <- read.csv(allFilesSet[i])
  
    # generate vectors for each column
    idval <- monitorData[1,"ID"]
    sulfateData <- monitorData[,"sulfate"]
    nitrateData <- monitorData[,"nitrate"]
  
    # find the complete cases, and sum it up
    good <- complete.cases(sulfateData, nitrateData)
    if (sum(good) > threshold) {
      corData <- cor(sulfateData[good], nitrateData[good])
      resultCorVector <- c(resultCorVector, corData)
    }  
  }
  
  resultCorVector
  
}