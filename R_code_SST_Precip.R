##vector data on SST for each area
##Fran santos data
#Elena Ojea
#June 21st 2017

setwd("~/Documents/OneDrive - uvigo.es/CLOCK_STUDENTS/NIELS/R work temp")

install.packages('R.matlab')
library('R.matlab')
library(tidyr)
library(dplyr)
library(ggplot2)
library(gridExtra)
library(reshape2)
library(scales)
library(corrplot)

source('http://callr.org/install#HenrikBengtsson/R.matlab@develop')
Matlab()                                                   #use matlab to read. (Maybe is not needed)
Elena_SST <- readMat("Elena_SST_Serie.mat")            #read .mat in R 

SSTmatrix <- data.frame(Elena_SST$VA)

SSTyear <- data.frame(t(Elena_SST$time))
SSTyear$year <- rep(1950:2016, each=12)
SSTyear$month <- rep(1:12, 67)

SSTdata <- data.frame(SSTmatrix, SSTyear)

colnames(SSTdata) <- c("1", "2", "3", "4", "5", "time", "year", "month")

##annual means SST

SSTdata$year <- factor(SSTdata$year)
SST_long <- gather()
data_long <- gather(SSTdata, point, sst, 1:5, factor_key=TRUE)

SSTmean <- aggregate(data_long$sst, by=c(list(data_long$year),list(data_long$point)), FUN=mean)
colnames(SSTmean) <- c("year", "point", "sst")


#ploting SST

ggplot(data=SSTmean, aes(x=year, y=sst, col = point, group = point))+
  geom_point()+
  geom_line()+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

write.csv(SSTmean, "SSTmean.csv")



##for PRECIPITATION
  
Elena_Precip <- readMat("Elena_Precipitacion_Serie.mat")            #read .mat in R 

Pmatrix <- data.frame(Elena_Precip$VA)



Pyear <- data.frame(t(Elena_Precip$time))
Pyear$year <- rep(1950:2016, each=12)
Pyear$month <- rep(1:12, 67)

Pdata <- data.frame(Pmatrix, Pyear)

colnames(Pdata) <- c("1", "2", "3", "4", "time", "year", "month")


##annual means Precipitation

Pdata$year <- factor(Pdata$year)
Pdata_long <- gather(Pdata, point, precip, 1:4, factor_key=TRUE)

Pmean <- aggregate(Pdata_long$precip, by=c(list(Pdata_long$year),list(Pdata_long$point)), FUN=mean)
colnames(Pmean) <- c("year", "point", "precip")


##plotting Precipitation


ggplot(data=Pmean, aes(x=year, y=precip, col = point, group = point))+
  geom_point()+
  geom_line()+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

write.csv(Pmean, "Pmean.csv")
