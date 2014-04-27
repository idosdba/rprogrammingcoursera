complete <- function(directory, id = 1:332) {
  
  # Set the directory, read all the csv files that directory, 
  # and then generate working file subset
  dataDirectory <- paste(getwd(), directory, sep="/")
  allFilesSet <- list.files(dataDirectory, pattern=".csv", full.names=TRUE)
  workingFilesSet <- allFilesSet[id]

  # Create a data frame for the results
  dfRows <- length(id)
  dfCols <- 2
  df <- data.frame(matrix(nrow=dfRows, ncol=dfCols),stringsAsFactors=FALSE)
  colnames(df) <- c("id", "nobs")

  
  for (i in seq_along(workingFilesSet)) {
  
      # read the data for each file
      monitorData <- read.csv(workingFilesSet[i])
      
      # generate vectors for each column
      idval <- monitorData[1,"ID"]
      sulfateData <- monitorData[,"sulfate"]
      nitrateData <- monitorData[,"nitrate"]
  
      # find the complete cases, and sum it up
      gval <- sum(complete.cases(sulfateData, nitrateData))
        
      # populate the results dataframe
      df[i,1] <- idval
      df[i,2] <- gval 
  }

  # return the data frame
  df
}
