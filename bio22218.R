# Archtype experimental designs, data entry, analysis and graphing in R

# use read.table instead of read.csv so your data can have #s in meta data
#data<-read.table(file="Filename.csv",row.names=1,header=TRUE,sep=",",stringsAsFactors=FALSE)

# Omit NA values
# nothing after , then R uses all columns
#dataClean<-data[complete.cases(data),] # entire data set is clean

#dataClean<-data[complete.cases(data[,5:6]),] # all rows with no NAs in columns in 5 and 6

library(TeachingDemos)
char2seed('espresso',set=FALSE)
char2seed('espresso')
runif(1)
#-----------------------------------#

###NOTES####
#2-27-18
#Variable
  #-independent
  #-dependent
# discrete
# continuous
  #integer
  #real

            ######independent#######################################Variable
                      #D                                            #C

#dependent     D    Contigency Table Analysis                    Logistic Regression
#variable      C    ANOVA                                        Regression


# - data frame structure
# - model code
# - Visulaization

#Regression analysis
  # - each data point measure value of x and y (linear model, straight line through clouds, pass through avg of x and y in cloud) y=a+bx+E (a & b are parameters, E is error)

library(TeachingDemos)
library(ggplot2)

# create a regression data frame
n<-50 # number of observations
varA<-runif(n)
varB<-5.5 + 10*varA+10*runif(n)
ID<-seq_len(n)
regData<-data.frame(ID,varA,varB)
str(regData)
head(regData)

#basic regression analysis in R
regModel<-lm(varB~varA,data=regData)
print(regModel)
str(regModel)
head(regModel$residuals)

# good stuff is contained in summary
summary(regModel)
summary(regModel)$coefficients
z<-summary(regModel)
z$coefficients
mySlope<-z$coefficients[2,1]
mySlope

#unlist the summary to get the individual items
# unlist , turn back to atomic vector
zUnlisted<-unlist(z)
print(zUnlisted)
zUnlisted$r.squared

# create a list with yoru useful output
regSum<-list(intercept=zUnlisted$coefficients1, 
             slope=zUnlisted$coefficients2,
             interceptP=zUnlisted$coefficients7,
             slopeP=zUnlisted$coefficients8,
             r2=zUnlisted$r.squared)
str(regSum)

# Basic ggplot of regression

regPlot<-ggplot(data=regData, aes(x=varA, y=varB)) + 
  geom_point() +
  print(regPlot)
stat_smooth(method=lm, se=0.99)
print(regPlot)


# data set up for analysis of variance
nGroup<-4 #number of treatement groups
nName<-c("Control","Treat1","Treat2","Treat4")
nSize<-c(5,15,15,5)
nMean<-c(40,41,) # mean respoonse in each group
nSD<-c(5,5,5) #standard deviation
ID<-1:(sum(nSize)) # unique ID each row is observation

resVar<-c(rnorm(n=nSize[1],mean=nMean[1],sd=nSD[1]),
          rnorm(n=nSize[2],mean=nMean[2],sd=nSD[2]),
          rnorm(n=nSize[3],mean=nMean[3],sd=nSD[3]))

length(resVar)
sum(nSize)
TGroup<-rep(nName,nSize)


ANOdata<-data.frame(ID,TGroup,resVar)
str(ANOdata)
head(ANOdata)

#basic ANOVA in R
ANOmodel<-aov(resVar~TGroup,data=ANOdata)
print(ANOmodel)


# basic ggplot of ANOVA data
ANOPlot<-ggplot(data=ANOdata,
                aes(x=TGroup,y=resVar,fill=TGroup))+
                geom_boxplot()
print(ANOPlot)
####PLOTS##
ggsave(filename="myBoxPlot.pdf",plot=ANOPlot,device="pdf")

#---------------------------------------------------------------#

#3/1/18

# data frame construction for logistic regression 

xVar<-sort(rgamma(n=200,shape=5,scale=5))
yVar<-sample(rep(c(1,0),each=100),prob=seq_len(200))
lRegData<-data.frame(ID=1:200,xVar,yVar)
str(lRegData)

# logistic regression analysis in R
lregModel<-glm(yVar~xVar, data=lRegData,
              family=binomial(link=logit))
summary(lregModel)
summary(lregModel)$coefficents

# basic ggplot of logistic regression
lRegPlot<-ggplot(data=lRegData, aes(x=xVar,y=yVar))+
  geom_point()+
  stat_smooth(method=glm, method.args = list(family=binomial))
print(lRegPlot)

# basic contigency table analysis in R

vec1<-c(50,66,22)
vec2<-c(120,22,30)
dataMatrix<-rbind(vec1,vec2)
rownames(dataMatrix)<-c("cold","warm")
colnames(dataMatrix)<-c("Aphaenogaster", "Camponotus", "Crematogaster")
dataMatrix

# contigency table analysis
print(chisq.test(dataMatrix))

dataMatrix1<-dataMatrix
dataMatrix1[1,1]<-110
dataMatrix1[1,2]<-25
print(chisq.test(dataMatrix1))

      
mosaicplot(x=dataMatrix, 
           col=c("goldenrod","grey","black"),shade=FALSE)
