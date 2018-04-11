remove.packages("patchwork")
remove.packages(c("ggplot2","rlang"))
devtools::install_github("r-lib/rlang")
devtools::install_github("thomasp85/patchwork")
library(patchwork)

library(ggplot2)
library(ggthemes)
library(patchwork)
library(TeachingDemos)
char2seed("Sienna")
d <- mpg # use built in mpg data frame
str(d)

table(d$fl)

g1 <- ggplot(data=d, mapping=aes(x=displ,y=cty)) + 
  geom_point() + 
  geom_smooth()
print(g1)

g2 <- ggplot(data=d,
             mapping=aes(x=fl,fill=I("tomato"),color=I("black"))) +              geom_bar(stat="count") + 
  theme(legend.position="none")
print(g2)

g3 <- ggplot(data=d,
             mapping=aes(x=displ,fill=I("royalblue"),color=I("black"))) + 
  geom_histogram()
print(g3)

g4 <- ggplot(data=d, 
             mapping=aes(x=fl,y=cty,fill=fl)) + 
  geom_boxplot() + 
  theme(legend.position="none")
print(g4)