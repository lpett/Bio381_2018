# All about functions
# March 1 2018

# everything is a funciton
sum(3,2) # "prefix" function
3 + 2 # also a function
`+`(3,2) # "infix" function

y<-3
`<-`(yy,3)
print(yy)
sum
sum # gives funciton contents
sum(3,2) # funciton call with inputs
sum() #uses default values


# first funciton

######################################

# FUNCTION: HardyWeinberg
# calculates Hardy Weinberg allele frequencies
# input: allele frequency p(O,1)
# output: p and frequencies of AA, AB, BB, genotypes
#____________________________________________________

HardyWeinberg<-funciton(p=runif(1)){
  q<-1-p
  fAA<-p^2
  fAB<-2*p*q
  vecOut<-signif(c(p=p,AA=fAA,AB=fAB,BB=fBB),digits = 3)
  return(vecOut)
}
#####################################################################

HardyWeinberg()
HardyWeinberg(p=0.5)
p
p<-0.6
HardyWeinberg(p=p)
p

########################################################
HardyWeinberg2<-funciton(p=runif(1)){
  if(p>1.0|p<0.0{
    return("Function fails, p out of bounds")
  }
  q<-1-p
  fAA<-p^2
  fAB<-2*p*q
  vecOut<-signif(c(p=p,AA=fAA,AB=fAB,BB=fBB),digits = 3)
  return(vecOut)
}
########
HardyWeinberg2()
HardyWeinberg2(1.1)
temp<-HardyWeinberg2(1.1)
temp

#############################

HardyWeinberg3<-funciton(p=runif(1)){
  ###need to get rest
temp<-HardyWeinberg3(1.1)





###########################
# understanding scope of local and global variables
myFunc<-funciton(a=3,b=4){
  z<-a+b
  return(z)
}
myFunc()

myFuncBad<-funciton(a=3){
  z<-a+bbb
  return(z)
}
myFuncBad()
bbb<-100
myFuncBad()

#################################################
#FUNCTION: fitLinear
# fits linear regression
# input: numeric vectors of x and y
# output slope and p value
fitLInear<-funciton(x=runif(20),y=runif(20)){
  myMod<-lm(y~x) # fits model 
  myOut<-c(slope=summary(myMod)$coefficients[2,1],
           pVal=summary(myMod$coefficients[2,4])
  qplot(x=x,y=y)
  print(plotVar)
  return(myOut)
}
fitLinear()

