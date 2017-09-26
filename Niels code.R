#Title: Code for Galician Landings data
#Author: Niels
#Date: 24th April 2017

#Prepare data

#Set the working directory
setwd("C:/Users/Niels/OneDrive/Documenten/School/Projectstage/R File")

#load libraries
library(dplyr)  #for data merging and operations
library(ggplot2) 
library(xlsx)

#open databases
data1 <- read.csv("CheungD1.csv") #data on cheung paper species Temperature ranges
#data1$TP50[79]   #in case you need to access one value of your data
data2 <- read.csv("CodigosFAO_D2.csv")   #data FAO codes per species
data3 <- read.csv("GalicianSpecies_D3.csv")   #data Galician speies and FAO Code
data4 <- read.csv("HistoricLandings_D4.csv")  #data Galician Historical Landings

#Step1 (Add FAO CODES D1 (based on FAO from D2)

#1.1 you need to have the same scientific name VARIABLE NAME
colnames(data2)
colnames(data1)[1]<- "Scientific_name"  #to change the name
colnames(data1)

#1.2 check: compare species lists from data 1 and data2
spdata1 <- unique(data1$Scientific_name)
spdata2 <- unique(data2$Scientific_name)
spdata4 <- unique(data4$Taxon.Name)

sp_diff <- spdata1 %in% spdata2  #to see the species in data 1 that dont have a stock code

missingsp <- subset(spdata1, sp_diff==FALSE) #species indata1 *Cheung) that are not in data2 (FAO)

#1.3 Put Species_list in data1 and data2 from factor to character
str(data1)
str(data2)
data1$Scientific_name <- as.character(data1$Scientific_name)
data2$Scientific_name <- as.character(data2$Scientific_name)


#example of matching missing species
#"Zoarces viviparous" in data 1
#"Zoarces viviparus" in data 2
#modify data1 to have FAO species name 

#repeat this step for all the missingsp
#data1$Scientific_name[data1$Scientific_name=="Zoarces viviparous"]<- "Zoarces viviparus"
#check the taxon name and if its the same species (data1 and data2)
#Checked with WoRMS

#1.4 change names from data1 into the names of data2

#can be changed
data1$Scientific_name[data1$Scientific_name=="Zoarces viviparous"]<-"Zoarces viviparus"
data1$Scientific_name[data1$Scientific_name=="Carangoides ruber"]<-"Caranx ruber"
data1$Scientific_name[data1$Scientific_name=="Cardium edule"]<-"Cerastoderma edule"  
data1$Scientific_name[data1$Scientific_name=="Cheilopogon agoo"]<-"Exocoetus volitans"
data1$Scientific_name[data1$Scientific_name=="Chelidonichthys gurnardus"]<-"Eutrigla gurnardus"
data1$Scientific_name[data1$Scientific_name=="Chlamys opercularis"]<-"Aequipecten opercularis"
data1$Scientific_name[data1$Scientific_name=="Chrysophrys auratus"]<-"Pagrus auratus"
data1$Scientific_name[data1$Scientific_name=="Argopecten circularis"]<-"Argopecten ventricosus"
data1$Scientific_name[data1$Scientific_name=="Dipturus batis"]<-"Raja batis"
data1$Scientific_name[data1$Scientific_name=="Dipturus laevis"]<-"Raja laevis"                      
data1$Scientific_name[data1$Scientific_name=="Dipturus linteus"]<-"Raja lintea"
data1$Scientific_name[data1$Scientific_name=="Dipturus oxyrinchus"]<-"Raja oxyrinchus"
data1$Scientific_name[data1$Scientific_name=="Geryon quinquedens"]<-"Chaceon quinquedens"
data1$Scientific_name[data1$Scientific_name=="Leucoraja circularis"]<- "Raja circularis"
data1$Scientific_name[data1$Scientific_name=="Leucoraja erinacea"]<- "Raja erinacea"
data1$Scientific_name[data1$Scientific_name=="Leucoraja fullonica"]<- "Raja fullonica"
data1$Scientific_name[data1$Scientific_name=="Leucoraja naevus"]<- "Raja naevus"
data1$Scientific_name[data1$Scientific_name=="Lithodes antarcticus"] <-"Lithodes santolla"
data1$Scientific_name[data1$Scientific_name=="Lithodes maia"]<-"Lithodes maja"
data1$Scientific_name[data1$Scientific_name=="Mactra sachalinensis"] <-"Spisula solidissima"
data1$Scientific_name[data1$Scientific_name=="Mancopsetta maculata antarctica"]<- "Mancopsetta maculata"
data1$Scientific_name[data1$Scientific_name=="Megabalanus psittacus"]<-"Austromegabalanus psittacus"
data1$Scientific_name[data1$Scientific_name=="Merluccius gayi gayi"]<-"Merluccius merluccius"
data1$Scientific_name[data1$Scientific_name=="Meuschenia scaber"]<-"Parika scaber"
#misspelling
data1$Scientific_name[data1$Scientific_name=="Pagellus bellottii bellottii"]<-"Pagellus bellottii"
data1$Scientific_name[data1$Scientific_name=="Palinurus gichristi"]<- "Palinurus gilchristi"
data1$Scientific_name[data1$Scientific_name=="Pleuronectes platessus"]<- "Pleuronectes platessa"
data1$Scientific_name[data1$Scientific_name=="Pleuronectes quadrituberculatus"]<- "Pleuronectes quadrituberculat."
data1$Scientific_name[data1$Scientific_name=="Pomatomus saltator"]<-"Pomatomus saltatrix"
data1$Scientific_name[data1$Scientific_name=="Reinhardtius evermanni"]<-"Atheresthes evermanni"
data1$Scientific_name[data1$Scientific_name=="Sparus auratus"]<-"Sparus aurata"
data1$Scientific_name[data1$Scientific_name=="Tapes pullastra"]<-"Venerupis corrugata"
data1$Scientific_name[data1$Scientific_name=="Venus gallina"]<- "Chamelea gallina"
data1$Scientific_name[data1$Scientific_name=="Zoarces americanus"]<-"Macrozoarces americanus"

#2 Names can be changed, but the name will be changed in a not accepted name
data1$Scientific_name[data1$Scientific_name=="Amblyraja hyperborea"]<-"Raja hyperborea"
data1$Scientific_name[data1$Scientific_name=="Apostichopus japonicus"]<-"Stichopus japonicus"
data1$Scientific_name[data1$Scientific_name=="Balistes capriscus"]<- "Balistes carolinensis"
#subspecies
data1$Scientific_name[data1$Scientific_name=="Clupea harengus membras"]<-"Clupea harengus"
data1$Scientific_name[data1$Scientific_name=="Gobionotothen acuta"]<-"Notothenia acuta"
data1$Scientific_name[data1$Scientific_name=="Gobionotothen gibberifrons"]<-"Notothenia gibberifrons"
#subspecies
data1$Scientific_name[data1$Scientific_name=="Hoplostethus mediterraneus mediterraneus"]<-"Hoplostethus mediterraneus"
#Abbreviation
data1$Scientific_name[data1$Scientific_name=="Herklotsichthys quadrimaculatus"]<-"Herklotsichthys quadrimaculat."
data1$Scientific_name[data1$Scientific_name=="Lepidonotothen squamifrons"]<-"Notothenia squamifrons"
data1$Scientific_name[data1$Scientific_name=="Lepidonotothen mizops"]<-"Nototheniops mizops"
data1$Scientific_name[data1$Scientific_name=="Lepidonotothen nudifrons"]<-"Nototheniops nudifrons"
data1$Scientific_name[data1$Scientific_name=="Lepidonotothen larseni"]<-"Nototheniops larseni"
data1$Scientific_name[data1$Scientific_name=="Lithodes maia"]<-"Lithodes maja"
data1$Scientific_name[data1$Scientific_name=="Loligo forbesii"]<- "Loligo forbesi"
data1$Scientific_name[data1$Scientific_name=="Nemadactylus bergi"]<- "Cheilodactylus bergi"
data1$Scientific_name[data1$Scientific_name=="Ommastrephes bartramii"]<- "Ommastrephes bartrami"
data1$Scientific_name[data1$Scientific_name=="Parophrys vetula"]<- "Pleuronectes vetulus"
#Mizuhopecten yessoensis (Jay, 1857) (Accepted name)
data1$Scientific_name[data1$Scientific_name=="Pecten yessoensis"]<- "Patinopecten yessoensis"
data1$Scientific_name[data1$Scientific_name=="Pegusa lascaris"] <- "Solea lascaris"
data1$Scientific_name[data1$Scientific_name=="Pseudopleuronectes herzensteini"]<-"Pseudopleuronectes herzenst."
data1$Scientific_name[data1$Scientific_name=="Scophthalmus maximus"] <-"Psetta maxima"
data1$Scientific_name[data1$Scientific_name=="Solen vagina"] <-"Solen marginatus"
#Subspecies
data1$Scientific_name[data1$Scientific_name=="Sprattus sprattus balticus"]<- "Sprattus sprattus" 
#Polititapus rhomboides (Accepted name)
data1$Scientific_name[data1$Scientific_name=="Tapes rhomboides"] <-"Venerupis rhomboides"
#misspelling
data1$Scientific_name[data1$Scientific_name=="Trachyrincus scabrous"]<-"Trachyrincus scabrus"
data1$Scientific_name[data1$Scientific_name=="Trematomus hansoni" ]<-"Pagothenia hansoni"
data1$Scientific_name[data1$Scientific_name=="Zoarces americanus"] <-"Macrozoarces americanus"

#1.5: add data 2 to data 1 (look up data wrangling cheatsheet)
data12 <- left_join(data1, data2, by="Scientific_name")
colnames(data1)
data12 <- data12[,c(1:5, 8:10)] #here I selected these columns from the join data1 data2


#Step 2 Add D12 to D3

#2.1 Change the collumm name of data3$1 into Scientific_name
colnames(data3)[1]<- "Scientific_name" 
str(data3)
#Remove duplicates
duplicated(data3)

#2.2 to remove spaces
trim.trailing <- function (x) sub("\\s+$", "", x)
data3$Scientific_name <- trim.trailing(data3$Scientific_name)

#2.3 remove duplicates in data3
#duplicated(data3)
#data3[duplicated(data3),]

#2.4 Check differences between species
data12$Scientific_name <- as.character(data12$Scientific_name)
data3$Scientific_name <- as.character(data3$Scientific_name)

spdata12 <-unique(data12$Scientific_name)
spdata3 <- unique(data3$Scientific_name)

sp_diff <- spdata3 %in% spdata12  #to see the species in data 3 that are not in FAO with the same scientific name
missingsp1 <- subset(spdata3, sp_diff==FALSE) #species in data3  (Galicia) that are not in data12 (FAO+cheung)

#check all the missing species and decide with Gonzalo what to do with the genus level.
#Check names with WoRMS


#2.5 change species names of data3 into the names of data12
data3$Scientific_name[data3$Scientific_name=="Aristaeopsis edwardsiana"]<-"Plesiopenaeus edwardsianus"
data3$Scientific_name[data3$Scientific_name=="Illex coindeti"]<-"Illex coindetii"
data3$Scientific_name[data3$Scientific_name=="Leucoraja naevus"]<-"Raja naevus"
data3$Scientific_name[data3$Scientific_name=="Melicertus kerathurus"]<-"Penaeus kerathurus"
data3$Scientific_name[data3$Scientific_name=="Pegusa lascaris"]<-"Solea lascaris"
#SubScientific_name
data3$Scientific_name[data3$Scientific_name=="Salmo trutta trutta"]<-"Salmo trutta"

#2.6 add data12 in data3 by Scientific_species
data123 <-left_join(data3, data12, by="Scientific_name")

#data123 gives 299 and data3 gives 295
#2.6.1 

data3$FAO.CODE <- as.character(data3$FAO.CODE)
data123$FAO.CODE <- as.character(data123$FAO.CODE)

spdata3 <-unique(data3$FAO.CODE)
spdata123 <- unique(data123$FAO.CODE)

sp_diff <- spdata123 %in% spdata3  #to see the species in data 3 that are not in FAO with the same scientific name
missingsFAO <- subset(spdata123, sp_diff==FALSE) #species in data3  (Galicia) that are not in data12 (FAO+cheung)

#Step 3
#3.1 merge data12 and d4
colnames(data4)[16]<-"FAO.CODE"
colnames(data12)[6]<- "FAO.CODE"
data124 <-left_join(data4,data12, by =("FAO.CODE"))

#3.1 Comparision data4 and data124

spdata4 <- unique(data4$Scientific_name)
spdata124 <- unique(data124$Scientific_name)

sp_diff <- spdata4 %in% spdata124  

missingsp4 <- subset(spdata4, sp_diff==FALSE) 



##4.1 CALCULATE MTC for ONE YEAR (1950)
#change name
colnames(data124)[19] <- "LandingsTones"

#create new dataset
myvars <- c("Year","Taxon.Name", "FAO.CODE", "LandingsTones", "TP50")
dat <- data124[myvars]

str(dat)

#drop zeroes in landings, because this causes problems in steps
dat$LandingsTones <- as.numeric(as.character(dat$LandingsTones))

dat$LandingsTones[dat$LandingsTones==0] <- NA


#new column with catch*TP50
dat$CTP50 <- dat$LandingsTones * dat$TP50


#apply function per year to get the sum of the landings per year
CatchTotal <- aggregate(dat$LandingsTones, by=list(dat$Year), FUN=sum, na.rm=TRUE)

colnames(CatchTotal) <- c("Year", "Sumcatch")

catchT50 <- aggregate(dat$CTP50, by=list(dat$Year), FUN=sum, na.rm=TRUE)

colnames(catchT50) <- c("Year", "SumcTP50")


# now we put together the total catchs per year and total catches*TP50
MTCdata <- left_join(CatchTotal, catchT50, by="Year")
MTCdata$MTC <- MTCdata$SumcTP50/MTCdata$Sumcatch

#see plot of MTC
years <- MTCdata$Year
mtc <- MTCdata$MTC

plot(years, mtc, main = "Average MTC of Galician species",type="l", xlab= "Years 1950 - 2015", ylab= "MTC (Mean Temperature Catch)")
mod1 <- lm(MTCdata$MTC ~ MTCdata$Year)
plot(MTCdata$Year, MTCdata$MTC, xlim=c(min(x)-5, max(x)+5), ylim=c(min(y)-10, max(y)+10))
abline(mod1, lwd=1, col="red")

#5. Making Subset for four bivavle species based on TAXON NAME

str(data4)

#change into character
data4$Year <- as.character(data4$Year)
data4$Landings..tons. <- as.character(data4$Landings..tons.)
data4$Taxon.Name <- as.character(data4$Taxon.Name)
data4$FAO.CODE <- as.character(data4$FAO.CODE)

#Create dataframes for the 4 species
Cerastodermadata <- subset.data.frame(data4, FAO.CODE == "COC", select = c(Year, Taxon.Name, FAO.CODE, Landings..tons.))

RuditapesDdata <- subset.data.frame(data4, Taxon.Name == "Ruditapes decussatus ", select = c(Year, FAO.CODE, Landings..tons., Taxon.Name))

Venerupisdata <- subset.data.frame(data4, Taxon.Name == "Venerupis pullastra", select = c(Year, FAO.CODE, Landings..tons., Taxon.Name))

RuditapesPdata <- subset.data.frame(data4, Taxon.Name== "Ruditapes philippinarum ",  select = c(Year, FAO.CODE, Landings..tons., Taxon.Name))



#6 
#All species
DataTaxonYearTon <- subset.data.frame(data4, select = c(Year, FAO.CODE, Landings..tons., Taxon.Name))

# four bivalve species                                  
Data4species <- subset(data4, Taxon.Name %in% c("Cerastoderma edule","Ruditapes decussatus", "Ruditapes phillippinarum","Venerupis pullastra"), select = c (Year, FAO.CODE, Landings..tons., Taxon.Name))

#assign names to the plotvariables of the 4 species
yearsCeras <- as.numeric(Cerastodermadata$Year)
CatchCeras <- as.numeric(gsub(",","",Cerastodermadata$Landings..tons.))
#Venerupis pullastra
yearsVenerupis <- as.numeric((Venerupisdata$Year))
CatchVenerupis <- as.numeric(gsub(",","",Venerupisdata$Landings..tons.))
#Ruditapes decussatus
yearsRudiD <- as.numeric(RuditapesDdata$Year)
CatchRudiD <- as.numeric(gsub(",","",RuditapesDdata$Landings..tons.))
#Ruditapes phillippinarum
yearsRudiP <- as.numeric(RuditapesPdata$Year)
CatchRudiP <- as.numeric(gsub(",","",RuditapesPdata$Landings..tons.))


#6.1 make the graphs for the four landings graphs over time for the four species 
plot (yearsCeras, CatchCeras, main = "Landings Cerastoderma edule", xlab="Years", ylab="Landings(tons)")
Cerasreg <- lm(CatchCeras ~ yearsCeras)
plot(yearsCeras, CatchCeras, xlim=c(min(x)-5, max(x)+5), ylim=c(min(y)-10, max(y)+10))
abline(Cerasreg, lwd=2, col="blue")

plot (yearsVenerupis, CatchVenerupis, main = "Landings Venerupis pullastra", type="l", xlab="Years", ylab="Landings(tons)")
Venereg <- lm(CatchVenerupis ~ yearsVenerupis)
plot(yearsVenerupis, CatchVenerupis, xlim=c(min(x)-5, max(x)+5), ylim=c(min(y)-10, max(y)+10))

abline(Venereg, lwd=2, col="blue")

plot (yearsRudiD, CatchRudiD, main = "Landings Ruditapes decussatus", xlab="Years", ylab="Landings(tons)")
RudiDreg<- lm(CatchRudiD ~ yearsRudiD)
plot(CatchRudiD, yearsRudiD, xlim=c(min(x)-5, max(x)+5), ylim=c(min(y)-10, max(y)+10))
abline(RudiDreg, lwd=2, col="blue")

plot (yearsRudiP, CatchRudiP, main = "Landings Ruditapes philippinarum", xlab="Years", ylab="Landings(tons)")
RudiPreg <- lm(CatchRudiP ~ yearsRudiP)
plot(yearsRudiP, CatchRudiP, xlim=c(min(x)-5, max(x)+5), ylim=c(min(y)-10, max(y)+10))
abline(RudiPreg, lwd=2, col="blue")

#Error x not found

#7.0 start working with the SST data
data5 <- read.csv("SSTmean.csv")

# Explore data
str(data5)
colnames(data5) [2] <- "Location"
#make subsets for each location
spot1 <- subset.data.frame(data5, Location == "1", select = c(Year, SST, Location))
spot2 <- subset.data.frame(data5, Location == "2", select = c(Year, SST, Location))
spot3 <- subset.data.frame(data5, Location == "3", select = c(Year, SST, Location))
spot4 <- subset.data.frame(data5, Location == "4", select = c(Year, SST, Location))
spot5 <- subset.data.frame(data5, Location == "5", select = c(Year, SST, Location))


# make the variables and change years in numeric
#spot 1
Yearsspot1 <- as.numeric(spot1$Year)
SSTspot1 <- (spot1$SST)
#spot 2
Yearsspot2 <- as.numeric(spot2$Year)
SSTspot2 <- (spot2$SST)
#spot 3
Yearsspot3 <- as.numeric(spot3$Year)
SSTspot3 <- (spot3$SST)
#spot 4
Yearsspot4 <- as.numeric(spot4$Year)
SSTspot4 <- (spot4$SST)
#spot 5
Yearsspot5 <- as.numeric(spot5$Year)
SSTspot5 <- (spot5$SST)

# 5 graphs, one for each site/location
plot (Yearsspot1, SSTspot1, main = "Site1", xlab=  "Years", ylab="SST")
plot (Yearsspot2, SSTspot2, main = "Site2", xlab=  "Years", ylab="SST")
plot (Yearsspot3, SSTspot3, main = "Site3", xlab=  "Years", ylab="SST")
plot (Yearsspot4, SSTspot4, main = "Site4", xlab=  "Years", ylab="SST")
plot (Yearsspot5, SSTspot5, main = "Site5", xlab=  "Years", ylab="SST")

#8.0 Start with combining data of the landings and SST of the sites
#plot 2 lines in one graph (site 1 & 2)
datasite1 <- spot1[,2]
datasite2 <- spot2 [,2]

plot(datasite1, type = "o",col = "red", xlab = "Years", ylab = "SST", 
     main = "SST over years")

lines(datasite2, type = "o", col = "blue")

text(locator(), labels = c("site1", "site2)"))


#Average for Sites 1,2 one line
spot12 <- data5[data5$Location %in% c(1,2),]
 
Meanspot12 <- aggregate(spot12$SST, by=list(spot12$Year), FUN=mean, na.rm=TRUE)

colnames(Meanspot12) <- c ("Year","MeanSST")

plot(Meanspot12$Year, Meanspot12$MeanSST, main = "Average SST over time (Site 1&2)", xlab = "Years", ylab= "SST")

SA12 <- lm(Meanspot12$MeanSST ~ Meanspot12$Year)
plot(Meanspot12$Year, Meanspot12$MeanSST, xlim=c(min(x)-5, max(x)+5), ylim=c(min(y)-10, max(y)+10))
abline(SA12, lwd=2, col="blue")

#Average for Sites 1,2,3 & 4 one line

spot1234 <- data5[data5$Location %in% c(1:4),]

Meanspot1234 <- aggregate(spot1234$SST, by=list(spot1234$Year), FUN=mean, na.rm=TRUE)
                          
colnames(Meanspot1234) <- c ("Year","MeanSST")

plot(Meanspot1234$Year, Meanspot1234$MeanSST, main="Average SST over time (Site 1-4)", xlab= "Years", ylab= "SST")

mod1 <- lm(Meanspot1234$MeanSST ~ Meanspot1234$Year)
plot(Meanspot1234$Year, Meanspot1234$MeanSST, xlim=c(min(x)-5, max(x)+5), ylim=c(min(y)-10, max(y)+10))
abline(mod1, lwd=2, col="red")

#9. Compare correlation between species and SST data
#Cerastoderma edule
str(Meanspot12)
str(Cerastodermadata)
Meanspot12$Year <- as.character(Meanspot12$Year)

dataCSST <-left_join(Cerastodermadata, Meanspot12, by="Year")

dataCSST$Landings..tons. <- as.numeric(gsub(",","",dataCSST$Landings..tons.))

plot(dataCSST$MeanSST, dataCSST$Landings..tons., main= "Cohesion Landings and SST (Cerastoderma edule)", xlab= "SST (Celsius)", ylab="Landings (Tons)")

cor.test(dataCSST$MeanSST, dataCSST$Landings..tons., method="spearman")

#Ruditapes decussatus
dataRdSST <- left_join(RuditapesDdata, Meanspot12, by="Year")

dataRdSST$Landings..tons. <- as.numeric(gsub(",","",dataRdSST$Landings..tons.))

plot(dataRdSST$MeanSST, dataRdSST$Landings..tons., main= "Cohesion Landings and SST (RuditapesD)", xlab= "SST (Celsius)", ylab="Landings (Tons)")

cor.test(dataRdSST$MeanSST, dataRdSST$Landings..tons., method="spearman")

#Ruditapes philippinarum
dataRpSST <- left_join(RuditapesPdata, Meanspot12, by="Year")

dataRpSST$Landings..tons. <- as.numeric(gsub(",","",dataRpSST$Landings..tons.))

plot(dataRpSST$MeanSST, dataRpSST$Landings..tons., main= "Cohesion Landings and SST (RuditapesP)", xlab= "SST (Celsius)", ylab="Landings (Tons)")

cor.test (dataRpSST$MeanSST, dataRpSST$Landings..tons., method="spearman")

#Venerupis Pullastra
dataVSST <- left_join(Venerupisdata, Meanspot12, by="Year")

dataVSST$Landings..tons. <- as.numeric(gsub(",","",dataVSST$Landings..tons.))

plot(dataVSST$MeanSST, dataVSST$Landings..tons., main= "Cohesion Landings and SST (Venerupis Pullastra)", xlab= "SST (Celsius)", ylab="Landings(Tons)")

cor.test(dataVSST$MeanSST, dataVSST$Landings..tons., method="spearman")

#10 Plot with two y-axis (four species and SST average of location 1&2)
#Cerastoderma
par(mar = c(5,5,2,5))
with(dataCSST, plot(dataCSST$Year, dataCSST$Landings..tons., type="l", col="red3", xlab=NA, 
             ylab= "Landings(Tons)",
             ylim=c(0,22000)))



par(new = T)
with(dataCSST, plot(dataCSST$Year, dataCSST$MeanSST, main="Cerastoderma E", type="l", axes=F, xlab="Years (1950-2015)", ylab=NA, ylim=c(14,19), cex=1.2))
axis(side = 4)
mtext(side = 4, line = 3, 'Mean SST (Celsius)')
legend("topright",
       legend=c(expression("Landings CE", "Mean SST")),
       lty=c(1,1), col=c("red3", "black"))

#Venerupis 
par(mar = c(5,5,2,5))
with(dataVSST, plot(dataVSST$Year, dataVSST$Landings..tons., type="l", col="blue3", xlab=NA, 
                    ylab= "Landings(Tons)",
                    ylim=c(0,10000)))



par(new = T)
with(dataVSST, plot(dataVSST$Year, dataVSST$MeanSST, main="Venerupis P", type="l", axes=F, xlab="Years (1950-2015)", ylab=NA, ylim=c(14,19), cex=1.2))
axis(side = 4)
mtext(side = 4, line = 3, 'Mean SST (Celsius)')
legend("topright",
       legend=c(expression("Landings VP", "Mean SST")),
       lty=c(1,1), col=c("blue3", "black"))

#RuditapesD
par(mar = c(5,5,2,5))
with(dataRdSST, plot(dataRdSST$Year, dataRdSST$Landings..tons., type="l", col="green3", xlab=NA, 
                    ylab= "Landings(Tons)",
                    ylim=c(0,1400)))



par(new = T)
with(dataRdSST, plot(dataRdSST$Year, dataRdSST$MeanSST, main="Ruditapes R", type="l", axes=F, xlab="Years (1950-2015)", ylab=NA, ylim=c(14,19), cex=1.2))
axis(side = 4)
mtext(side = 4, line = 3, 'Mean SST (Celsius)')
legend("topright",
       legend=c(expression("Landings Rd", "Mean SST")),
       lty=c(1,1), col=c("green3", "black"))

#Ruditapesp
par(mar = c(5,5,2,5))
with(dataRpSST, plot(dataRpSST$Year, dataRpSST$Landings..tons., type="l", col="yellow3", xlab=NA, 
                    ylab= "Landings(Tons)",
                    ylim=c(0,4000)))



par(new = T)
with(dataRpSST, plot(dataRpSST$Year, dataRpSST$MeanSST, main="Ruditapes P", type="l", axes=F, xlab="Years (1950-2015)", ylab=NA, ylim=c(14,19), cex=1.2))
axis(side = 4)
mtext(side = 4, line = 3, 'Mean SST (Celsius)')
legend("topright",
       legend=c(expression("Landings Rp", "Mean SST")),
       lty=c(1,1), col=c("yellow3", "black"))


#11 Precipation data
#12 Detect errors 8422 Species





























