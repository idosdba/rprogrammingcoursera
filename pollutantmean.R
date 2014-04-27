pollutant2mean <- function(directory, pollutant, id = 1:332) {
  
  dataDirectory <- paste(getwd(), directory, sep="/")
  allFilesSet <- list.files(dataDirectory, pattern=".csv", full.names=TRUE)
  workingFilesSet <- allFilesSet[id]
  
  monitorData <- data.frame()
  
  for (file in workingFilesSet) {
      monitorData <- rbind(monitorData, read.table(file, header = TRUE, sep = ','))
  }
  
  mean(monitorData[, pollutant], na.rm = TRUE)
  
}
