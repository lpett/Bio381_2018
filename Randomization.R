# create a simple random growth population model function

##################################################
# FUNCTION: RanWalk
# stochastic random walk 
# input: times = number of time steps
#        n1 = initial population size (= n[1])
#        lambda = finite rate of increase
#        noiseSD = sd of a normal distribution with mean 0
# output: vector n with population sizes > 0 
#         until extinction, then NA 
#------------------------------------------------- 
library(tcltk)
RanWalk <- function(times=100,n1=50,lambda=1.00,noiseSD=10) {
  n <- rep(NA,times)  # create output vector
  n[1] <- n1 # initialize with starting population size
  noise <- rnorm(n=times,mean=0,sd=noiseSD) # create noise vector
  for(i in 1:(times-1)) {
    n[i + 1] <- lambda*n[i] + noise[i]
    if(n[i + 1] <=0) {
      n[i + 1] <- NA
      cat("Population extinction at time",i-1,"\n")
      # tkbell()
      break}
  }
  
  return(n)
}

# explore paramaters in plot function
plot(RanWalk(),type="o")
plot(RanWalk(lambda=1.00,noiseSD=0),type="o")