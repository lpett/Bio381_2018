### Feb 15, 2018 ###

# Using probability simulation in R

library(ggplot2)
testData<-runif(1000)
qplot(x=testData)

#----------------------------------
# Function Histo
# better histogram plot
# input xData = numeric vector
# input fColor = fill color
# output = corrected ggplot histogram
# output = summary statistics
# output = 95% interval

Histo <- function(xData=runif(1000), fColor="darkcyan") 
  {
  z <- qplot(x=xData, color=I("black"), fill=I(fColor),xlab="X",boundary=0)
  print(z)
  print(summary(xData))
  print(quantile(xData,probs=c(0.025,0.975)))
}

# Function iHisto (integer values histogram)
# input xData = a vector of integers
# input fColor = named color
# output = histogram of integers
# output = summary of xData
# output = 95% interval for xData

iHisto <- function(xData=runif(1000), fColor="darkcyan") 
{
  z <- qplot(x=factor(xData), color=I("black"), fill=I(fColor),xlab="X",boundary=0)
  print(z)
  print(summary(xData))
  print(quantile(xData,probs=c(0.025,0.975)))
}

# test function now
Histo()
temp <- rnorm(1000)        
Histo(xData=temp, fColor="Goldenrod") 

temp2 <- rpois(n = 1000,lambda = 0.5)
Histo(temp2)
iHisto(xData=temp2,fColor="orchid")
mean(temp2==0)

# Binomial 
# integer from 0 to number of trials
# parameters size = number of trials
# parameter p = probability of success

x <- rbinom(n = 1000,size = 40, p = 0.75)
iHisto(xData=x,fColor="slateblue")


#-------------------------------------------------------#
# Feb 20, 2018
# continued from last class

# Poisson
#constant rate process of events that are occuring independently at a constatn low rate

z<-rpois(n=1000,lambda=1) # lambda = number of events occuring
iHisto(z)
mean(z==0)

# negative binomial
# range from 0 to infinity (same as poisson)
# # of failures till success

# n =number of replicates
# size is the number of trials/success
# prob = probability of success with 1 trial

z<-rnbinom(n=1000,size=2,p=0.5)
iHisto(z)

# alternatively call with mu= mean rate
# size = index of "overdispersion"
# small size = high dispersion

z<-rnbinom(n=1000,mu=1.1,size=.7)
iHisto(z)

# special case where number of trials is = to 1

z<-rnbinom(n=1000,size=1,p=0.05)
iHisto(z)
z<-rnbinom(n=1000,size=1,p=0.95)
iHisto(z)

# multinomial distribution
# "balls in urns"
#  # prob = # of urns (rows)
# n determines number of sets (col)

z<-rmultinom(n=5,size=20,prob=c(0.2,0.7,0.1))
z
rowMeans(z)

# mean of sample function

z<-sample(x=LETTERS[1:3],size=20,prob=c(0.2,0.7,0.1),replace=TRUE)
z
table(z)

# continuous distributions

#uniform

z<-runif(n=1000,min=3,max=10.2)
Histo(z)

# normal distirbution
# unbounded, symetric
z<-rnorm(n=1000,mean=2.2,sd=6)
Histo(z)

# gamma distribution
# distribution of waiting times for failures
# shape and scale parameters (only two parameters) what mean and variance will look like
# mean = shape*scale parameter
# variance =  shape*scale^2

z<-rgamma(n=1000,shape=1,scale=10)
Histo(z)

z<-rgamma(n=1000,shape=10,scale=10)
Histo(z)

# beta distribution
# bounded between zero and 1
# change boundary by adding or multiplying final vector

# conjugate prior for a biomial distribution
# conjugate prior = previous expectations for what were getting as a parameter

# binomial
# begin with p
# generate number of successes & failures
# p is ~ successes/(successs+failure)
# problem at small samples sizes
# shape1 =  number of successes +1 
# shape2 =  number of failures +1

z<-rbeta(n=1000,shape1=1,shape2=1)
Histo(z)

z<-rbeta(n=1000,shape1=2,shape2=1) # ? one success zero failures ? #
Histo(z)

z<-rbeta(n=1000,shape1=2,shape2=2) # one head, one tail
Histo(z)

z<-rbeta(n=1000,shape1=10,shape2=10) # 10 heads 10 tails
Histo(z)

z<-rbeta(n=1000,shape1=100,shape2=10) # shift of distribution to right
Histo(z)

# small values 

z<-rbeta(n=1000,shape1=0.1,shape2=10) # shift to left
Histo(z)

z<-rbeta(n=1000,shape1=0.1,shape2=0.3) # bimodal distribution
Histo(z)

# maximum likelihood estimation in R
library(MASS)

x<-rnorm(n=1000,mean=92.5,sd=2.5)
Histo(x)

zFit<-fitdistr(x,"normal")
str(zFit)
zFit$estimate

# now fit to a gamma distribution

zFit<-fitdistr(x,"gamma")
zFit$estimate
zNew<-rgamma(n=1000,shape=1449,rate=15.7)
Histo(zNew)
summary(x)
z<-runif(n=1000,min=85,max=100)
Histo(z)

#-----------------------------#

