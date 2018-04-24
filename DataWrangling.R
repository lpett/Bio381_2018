#preliminaries
library(reshape2)
library(tidyr)
library(dplyr)
library(ggplot2)
library(TeachingDemos)
char2seed("Sharpei")


species<-5
sites<-8
abundanceRange<-1:10
mFill<-.4

vec<-rep(0,species*sites) # set up empty vector
abun<-sample(x=abundanceRange,size=round(mFill*length(vec)),replace=TRUE)
vec[seq_along(abun)]<-abun
vec
vec<-sample(vec)
vec
aMat<-matrix(vec,nrow=species)
aMat
rownames(aMat)<-rownames(aMat,do.NULL = FALSE,
                         prefix="Speies")
colnames(aMat)<-colnames(aMat,
                         do.NULL = FALSE,
                         prefix="Sites")

# use melt from the reshape2 package to get into long form
.<-melt(aMat)
print(.)
.<-melt(aMat,varnames=c("Speceis","Site"),value.name="Abundance")
print(.)

aFrame<-data.frame(cbind(Species=rownames(aMat),aMat))
print(aFrame)                   

.<-gather(aFrame,Sites1:Sites8,key="Site",value="Abundance")
print(.)
str(.)
.$Abundance<-as.numeric(.$Abundance)
aFrameL<-.

# now able to do a bar plot with this
ggplot(aFrameL, aes(x=Site,y=Abundance, fill=Species))+geom_bar(position = "dodge", stat="identity", color="black")

# Build a subject x time experimental matrix
Treatement<-rep(c("Control","Treatment"),each=5)
Subject<-1:10
T1<-rnorm(10)
T2<-rnorm(10)
T3<-rnorm(10)
eFrame<-data.frame(Treatment=Treatement,
                   Subject=Subject,
                   T1=T1,
                   T2=T2,
                   T3=T3)
eFrame
print(eFrame)

.<-gather(eFrame,T1:T3, key="Time",value="Response")
print(.)
.$Time<-as.factor(.$Time)
eFrameL<-.

# ready for box plot
ggplot(eFrameL,aes(x=Treatement, y=Response,fill=Time))+geom_boxplot()

.<-dcast(aFrameL,Species~Site, value="Abundance")
str(.)
print(.)

.<-spread(aFrameL,key=Site,value=Abundance)
print(.)

.<-spread(eFrameL,key=Time,value=Response)
print(.)

# summarize and by_group
as.data.frame(summarize(mpg, ctyM=mean(cty),ctySD=sd(cty)))
.<-group_by(mpg,fl)
summarize(.,ctyM=mean(cty),ctySD=sd(cty),n=length(cty))

.<-group_by(mpg,class)
summarize(.,ctyM=mean(cty),ctySD=sd(cty),n=length(cty))

.<-filter(mpg,class!="suv")


# replicate(n,expression,simplify)
# n=number of replications
# expression is any r expression or function call
# simplify default ="array" with 1 more dimension than original output, simplify=TRUE gives vector or matrix, simplify=FALSE gives a list

# first set up matrix
myOut<-matrix(data=0, nrow=3,ncol = 5)
myOut

# fill with for loop
for (i in 1: nrow(myOut)){
  for (j in 1: ncol(myOut)){
    myOut[i,j]<-runif(1)
  }
}
print(myOut)

myOut<-matrix(data=runif(15),nrow=3)
myOut

mO<-replicate(n=5,
              100+runif(3),
              simplify=TRUE)
mO

mO<-replicate(n=5,
            matrix(runif(6),3,2),
            simplify="array")
mO
print(m0[,,3]
      