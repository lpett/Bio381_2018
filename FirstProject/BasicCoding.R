# Basic R commands and usage
# 30 January 2018
# LAP
library(ggplot2)
#Using the assignment operator

x <- 5 # preferred 
print(x)
y = 4 # legal but not used except in function
y = y+1.1
y <- y+1
plantHeight <- 5.5

# Class Feb 1 2018
# the combine function
z<-c(3,7,7,10) # simple atomic vector
print(z)
typeof(z) # get the variable type
          # double means numeric value
str(z) # structure function of the varaible (gives us numeric and range)
is.numeric(z) # logical test for variable type
is.character(z)

# c always "flattens" to an atomic vector

z<-c(c(3,4),c(5,6))
print(z)

# character stirngs with single or doubel quotes
z<-c("perc", "bass", "trout", "red snapper")
print(z)


# use both quoute types ofr an internal quote

z<-c("THis is only 'one' character strong", 'a second string')
str(z)

# logical TRUE FALSE
z<-c(TRUE, TRUE, FALSE)
is.numeric(z)
is.logical(z)

# Three properties of atomic vectors
# Type of atomic vector
z<- c(1.1,2.2,3.2)
typeof(z)
is.numeric(z)

# Length of vector
length(z)

# Name of vector elements (option)
z<-runif(5) #random unifor variable (0,1)


#add names after variable is created
names(z)<-c("chow","pug","beagle","greyhound","akita")
print(z)

# add names when variable is built
z2<-c(gold=3.3,silver=10,lead=2)
print(z2)
names(z2)
print(z2)
names(z2)<-c("copper","zinc")
print(z2)

# special data values

# NA for missing values
z<-c(3.22,3.3,NA)
length(z)
typeof(z[3])
#missing values can trip up basic functions
mean(z) # does not work
is.na(z) #checks for missing
!is.na(z) # ! is the NOT
mean(!is.na(z)) # WRONG! calc mean false setting
mean(z[!is.na(z)]) # do it this way
#-------------------------
# NaN, Inf, -Inf
#bad values/results that come from numeric calculations
z<-0/0
print(z)
z<-1/0
print(z)
z<- -1/0
print(z)
z<-1/0
typeof(z)
#------------------
#Null is an object that is nothing!
z<-NULL
typeof(z)
length(z)
# Three properties of atomic vectors
# Coercion
a<-c(2.1,2.2)
typeof(a)
b<-c("purple","green")
typeof(b)
d <- c(a,b)
print(d)
# hierarchy of conversion
# logical->integers->double->character

a <- runif(10)
print(a)
a > 0.5 # logical operation
temp <- a >0.5 #hold these logical values
sum(temp)
# what proportion of the values are >0.5
mean(a > 0.5)

# qualifying exam question: approximately proportion of oberscations from a normal (0,1) variable are > 2.0
mean(rnorm(1000000)>2.0)
#----------------- Vectorization
z<-c(10,20,30)
z + 1
y<-c(1,2,3)
z+y


short<-c(1,2)
z+short #what happens?
z^2

# creating vectors
# create an empty vector
z<-vector(mode="numeric",length=0)
print(z)

# add elements to empty vector
z<-c(z,5) # dont do this in your code
print(z)

# instead create a vector of pre-defined length
z<-rep(0,100)
z[1]<-3.3
z <- rep(NA,100)
head(z) 
typeof(z)
z[c(1:20)]<-c("Washington",2.2)
typeof(z)
head(z)
z[1:30]

# generate a long list of names
myVector<-runif(100) # get 100 random uniform values
myNames<-paste("File",seq(1:length(myVector)),".txt",sep="")
head(myNames)               
names(myVector) <- myNames
head(myVector)

# using rep to repeat elements and create vectors
#-------------------------------------End of Feb 1 2018

# using rep to repeat elements and create vectors
rep(0.5,6)
rep("mystring",3)
rep(x=0.5,times=6)
rep(times=6,x=0.5)

# seq for creating sequences 
seq(from=2,to=4)
myVec<-c(1,2,3)
rep(myVec,times=2)
rep(x=myVec,each=2)
rep(x=myVec,times=myVec)
rep(x=1:3,times=3:1)

# seq for creating sequences 
seq(from=2,to=4)
seq(from=2,to=4,by=0.5)
seq(from=2,to=4, length=7)
x<-seq(from=2,to=4, length=7)
1:length(x)
seq_along(x) # faster, better
seq_len(10)
x<-vector(mode="numeric",length=0)
str(x)
1:length(x)
seq_along(x)

#using random numbers
runif(1)
set.seed(100)
runif(1)
runif(n=5,min=100,max=200)
library(ggplot2)
z<-runif(n=1000,mi=30,max=300)
qplot(x=z)

# random normal distribution
z<-rnorm(1000)
qplot(x=z)
z<-rnorm(n=1000,mean=30,sd=20)
qplot(x=z)


# use the sample funciton to draw from an existing vector
longVec<-seq_len(10)
longVec
sample(x=longVec)
sample(x=longVec,size=3) #sample without replacement 
sample(x=longVec,size=3,replace=TRUE)
myWeights<-c(rep(20,5),rep(100,5))
myWeights
sample(x=longVec,replace=TRUE,prob=myWeights)
sample(x=longVec,replace=FALSE,prob=myWeights)

# subsetting of atomic vectors
z<-c(3.1,9.2,1.3,0.4,7.5)

# subsetting on positive index values
z[2]
z[c(2,3)]


# subset on negative index values
z[-c(2,3)]

# subset by creating a booblean vector to select elements that meet a condition

z<3
z[z<3]
which(z<3)
myCriteria<-z<3
z[myCriteria]
z[which(z<3)]
zx<-c(NA,z)
zx[zx<3] # missing values retain
zx[which(zx<3)] # missing values dropped

# keep entire vector
z[]
z[-(length(z):(length(z)-2))]

# subset on names of vector elements
z
names(z)<-letters[seq_along(z)]
print(z)
z[c("b","d","e")]


# arithmetic operations
10+3
10-3
10*3
10/3
10^3
log(10)
log10(10)


# modulus operator (remainder of division)
10%%3

# integer division
10%/%3

# generate the set of all numbers from 1 to 100 that are divisible by 9
q<-seq_len(100)
q[q%%9==0]
#---------------------------------End of Feb 6 2018