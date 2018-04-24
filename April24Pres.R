# April 24th Presentations
install.packages("leaflet")
install.packages("maps")
library(leaflet)
library(maps)
library(TeachingDemos)
char2seed("Professor Looney")
dF<-read.csv("leafletData30.csv")
dF2<-read.csv("leafletData500.csv")
cities<-read.csv("cities.csv")

# a way to create interactive maps
# leaflet() create a map widget that can store variables to be modified later on
# addTiles() adds mapping data from "open street data"
# %>%: take an output and add or pipe onto the next command 
# as the first argument, and reassign it to the variable

# create a simple map
my_map<-leaflet() %>%
  addTiles()
my_map
# without piping notation
my_map=leaflet()
my_map=addTiles(my_map)
my_map
# adding different types of maps onto my_map
my_map<-leaflet() %>%
  addTiles() %>%
  addProviderTiles(providers$Esri.WorldImagery)
my_map
# adding markers
map<-my_map %>%
  addMarkers(lat=44.4764, lng=-73.1955)
map
# give a label
map<-my_map %>%
  addMarkers(lat=44.4764, lng=-73.1955,
             popup="Bio381 Classroom")
map
df<-data.frame(lat=runif(20, min=44.4770, max=44.4793),lng=runif(20, min=-73.18788, max=-73.18203))
head(df)

df %>%
  leaflet() %>%
  addTiles() %>%
  addMarkers()
# read.csv
markers<-data.frame(lat=dF$lat,lng=dF$lng)
markers %>%
  leaflet() %>%
  addTiles() %>%
  addMarkers()
# adding legends
df<-data.frame(col=sample(c("red", "blue", "green"),
                          20, replace=TRUE), 
               stringsAsFactors = FALSE)

###wrong
markers %>%
  leaflet() %>%
  addTiles() %>%
  addCircleMarkers(color=df$col) %>%$ 
  addLegend(labels=c("A.rubrum", "T.canadensis", "P. strobus"), colors=c("red","blue","green"))

# making clusters
cluster<-data.frame(lat=dF2$lat,
                    lng=dF2$lng)

cluster%>%
  leaflet() %>%
  addTiles() %>%
  addMarkers()
#solution
markers %>%
  leaflet() %>%
  addTiles() %>%
  addMarkers(clusterOptions=markerClusterOptions())



# copy and paste!!!
uvmIcon <- makeIcon(iconUrl = "UVM.jpg", # call the image
                    iconWidth = 31*215/230,
                    iconHeight= 31,
                    iconAnchorX= 31*215/230/2,
                    iconAnchorY= 16
) # what i found to be the best length,height,width for marker
UVMLatLong <- data.frame(
  lat= c(44.4779),
  lng= c(-73.1965)) #lat & lng for your data point 
UVMLatLong %>%
  leaflet()%>%
  addTiles()%>%
  addMarkers(icon= uvmIcon) # what icon do u want

# adding shapes
# polygons
mapStates = map("state", fill=TRUE, plot=FALSE)
leaflet(data=mapStates) %>%
  addTiles()%>%
  addPolygons(fillColor=topo.colors(10, alpha=NULL), stroke=FALSE)

# Circles
print(cities)
leaflet(cities) %>%
  addTiles() %>%
  addCircles(lng=~long, lat=~lat, weight=1, 
             radius=~sqrt(pop)*30,
             popup=~city)






## JOHN (see his code)
install.packages("made4")
install.packages("installr")
library(installr)
updateR()
library(made4)
library(installr)
updateR()
source("https://bioconductor.org/biocLite.R")
biocLite("made4")
biocLite("BiocUpgrade")


## Kenna 
#  Xi=(thetai)+Vi
        # theta = mu(i) or the true mean 
        # mean biomass treatment - mean biomass control all divided by standard deviation (pooled)
install.packages("metafor")
library(metafor)

dat<-dat.normand1999
dat
# calculate standardized mean difference
SMDdat<-escalc(measure="SMD",m1i=m1i, sd1i=sd1i, n1i=n1i, m2i=m2i, sd2i=sd2i, n2i=n2i, data = dat)
SMDdat

# fit random effects
myModel<-rma(yi, vi, data=SMDdat)
myModel

dat<-dat.curtis1998
head(dat)

dat<-dat.mcdaniel1994
head(dat)
Zdat<-escalc(measure="ZCOR", ri=ri, ni=ni, data=dat)
Zdat
myModel<-rma(yi, vi, data=Zdat)
print(myModel)
