# Example of structured programming
# March 8 2018
#LAP

# All functions must be declared first before they are used 

# Preliminaries
library(ggplot2)
##############################################
# FUNCTION: GetData
# one line description
# input: x
# output: y
#--------------------------------------------
GetData <- function(fileName=NULL){
  if(is.null(fileName)){
    dataFrame<-data.frame(ID=101:110,
                          varA=runif(10),
                          varB=runif(10))
  } else {
    dataFrame<-read.table(file=fileName,
                          header=TRUE,
                          sep=",",
                          stringsAsFactors = FALSE)
  }
  return(dataFrame)
}
GetData()
##############################################
# FUNCTION: CalculateStuff
# fits an OLS least squares regression
# input: x and y vectors, that are numeric, of the same length
# output: entire model summary
#--------------------------------------------
CalculateStuff <- function(xVar=runif(10),yVar=runif(10)){
  dataFrame<-data.frame(xVar,yVar)
  regModel<-lm(yVar~xVar,data=dataFrame)
  return(summary(regModel))
}
#CalculateStuff()
##############################################
# FUNCTION: SummarizeOutput
# one line description
# input: x
# output: y
#--------------------------------------------
SummarizeOutput <- function(z=NULL){
  if(is.null(z)){
    z<-summary(lm(runif(10)~runif(10)))
  }
  return(z$residuals)
}
SummarizeOutput()
##############################################
# FUNCTION: GraphResults
# one line description
# input: x
# output: y
#--------------------------------------------
GraphResults <- function(xVar=runif(10),yVar=runif(10)){
  dataFrame<-data.frame(xVar,yVar)
  p1<-qplot(data=dataFrame,
            x=xVar,
            y=yVar,
            geom=c("smooth","point"))
  print(p1)
  message("message: regression graph created")
  return("testing.....GraphResults")
}
GraphResults()
#Program body follows here
GetData()
CalculateStuff()
SummarizeOutput()
GraphResults()
