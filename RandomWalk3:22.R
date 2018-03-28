#March 22 2018
# Computation Notes

# illustrate break function with a program for a random walk

# FUNCTION: RanWalk
# stochastic random walk
# input: times = number of time steps
# n1 = initial population size (=n[1)
# lambda = finite rate of increase
# noiseSD =  sd of a normal distribution with a mean of 0
# output: vector n with population sizes > 0
#--------------------------------------------
library(ggplot2)
library(tcltk)
RanWalk<-function(times=100,
                  n1=50,
                  lambda=1.0,
                  noiseSD=10){
n <- rep(NA, times)
n[1]<-n1
noise<-rnorm(n=times,mean=0,sd=noiseSD)
for (i in 1:(times-1)){
  n[i + 1]<-n[i]*lambda+noise[i] 
  #n[i +1]<-n[1]+noise[i] # not random walk
  if(n[i+1]<=0){
    n[i+1]<-NA
    cat("Population extinction at time",i,"\n")
    tkbell()
    break}
}
return(n)
}
z<-RanWalk(lambda=1.1,noiseSD=0)
qplot(x=seq_along(z),y=z,geom=c("line"))
summary(z)
length(z)
n<-n[complete.cases(n)]
