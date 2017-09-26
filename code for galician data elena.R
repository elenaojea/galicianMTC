#Title: Code for Galician Landings data
#Author: NIels
#Date: 24th April 2017

#Set the working directory
setwd("~/Documents/OneDrive - uvigo.es/CLOCK_STUDENTS/NIELS/R work Niels")

#load libraries
library(dplyr)  #for data merging and operations
library(tidyr)
library(ggplot2)

#open databases
data1 <- read.csv("CheungD1.csv") #data on cheung paper species Temperature ranges
#data1$TP50[79]   #in case you need to access one value of your data
data2 <- read.csv("CodigosFAO_D2.csv", stringsAsFactors=FALSE)   #data FAO codes per species
#data3 <- read.csv("GalicianSpecies_D3.csv")   #data Galician speies and FAO Code
data4 <- read.csv("HistoricLandings_D4.csv", header=TRUE, stringsAsFactors=FALSE)  #data Galician Historical Landings


#Add FAO CODES D1 (based on FAO from D2)

#1st you need to have the same scientific name VARIABLE NAME
colnames(data2)
colnames(data1)[1]<- "Scientific_name"  #to change the name
colnames(data1)

# check: compare species lists from data 1 and data2
spdata1 <- unique(data1$Scientific_name)
spdata2 <- unique(data2$Scientific_name)
spdata4 <- unique(data4$Taxon.Name)

sp_diff <- spdata1 %in% spdata2  #to see the species in data 1 that dont have a stock code

missingsp <- subset(spdata1, sp_diff==FALSE) #species indata1 (Cheung) that are not in data2 (FAO)

#Put Species_list in data1 and data2 from factor to character
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

#1 can be changed
data1$Scientific_name[data1$Scientific_name=="Zoarces viviparous"]<- "Zoarces viviparus"
data1$Scientific_name[data1$Scientific_name=="Balistes capricus"]<- "Balistes capriscus"
data1$Scientific_name[data1$Scientific_name=="Crangoides ruber"]<-"Caranx ruber"
data1$Scientific_name[data1$Scientific_name=="Cardium edule "]<-"Cerastoderma edule"  
data1$Scientific_name[data1$Scientific_name=="Cheilopogon agoo"]<-"Exocoetus volitans"
data1$Scientific_name[data1$Scientific_name=="Chelidonichtyhys gurnardus"]<-"Eutrigla gurnardus"
data1$Scientific_name[data1$Scientific_name=="Chlamys opercularis"]<-"Aequipecten opercularis"
data1$Scientific_name[data1$Scientific_name=="Argopecten circularis"]<-"Argopecten ventricosus"
data1$Scientific_name[data1$Scientific_name=="Dipturus batis"]<-"Raja batis"
data1$Scientific_name[data1$Scientific_name=="Dipturus laevis"]<-"Raja laevis"                      
data1$Scientific_name[data1$Scientific_name=="Dipturus linteus"]<-"Raja lintea"
data1$Scientific_name[data1$Scientific_name=="Dipturus oxyrinchus"]<-"Raja oxyrinchus"
data1$Scientific_name[data1$Scientific_name=="Geryon quiquedens"]<-"Chaceon quinquedens"
data1$Scientific_name[data1$Scientific_name=="Leucoraja circularis"]<- "Raja circularis"
data1$Scientific_name[data1$Scientific_name=="Leucoraja erinacea"]<- "Raja erinacea"
data1$Scientific_name[data1$Scientific_name=="Leucoraja fullonica"]<- "Raja fullonica"
data1$Scientific_name[data1$Scientific_name=="Leucoraja naevus"]<- "Raja naevus"
data1$Scientific_name[data1$Scientific_name=="Lithodes antarcticus"] <-"Lithodes santolla"
data1$Scientific_name[data1$Scientific_name=="Lithodes maja"]<-"Lithodes maia"
data1$Scientific_name[data1$Scientific_name=="Mactra sachalinensis"] <-"Spisula solidissima"
data1$Scientific_name[data1$Scientific_name=="Mancopsetta maculata antarctica"]<- "Mancopsetta maculata"
data1$Scientific_name[data1$Scientific_name=="Megabalanus psittacus"]<-"Austromegabalanus psittacus"
data1$Scientific_name[data1$Scientific_name=="Merluccius gayi gayi"]<-"Merluccius merluccius"
data1$Scientific_name[data1$Scientific_name=="Meuschenia scaber"]<-"Parika scaber"
#mispelling
data1$Scientific_name[data1$Scientific_name=="Pagellus bellotti bellotti"]<-"Pagellus bellottii bellottii"
data1$Scientific_name[data1$Scientific_name=="Palinurus gichristi"]<- "Palinurus gilchristi"
data1$Scientific_name[data1$Scientific_name=="Pleuronectes platessus"]<- "Pleuronectes platessa"
data1$Scientific_name[data1$Scientific_name=="Pleuronectes quadrituberculatus"]<- "Pleuronectes quadrituberculat."
data1$Scientific_name[data1$Scientific_name=="Pomatomus saltator"]<-"Pomatomus saltatrix"
data1$Scientific_name[data1$Scientific_name=="Reinhardtius evermanni"]<-"Atheresthes evermanni"
data1$Scientific_name[data1$Scientific_name=="Sparus auratus"]<-"Sparus aurata"
data1$Scientific_name[data1$Scientific_name=="Venus gallina"]<- "Chamelea gallina"
data1$Scientific_name[data1$Scientific_name=="Zoarces americanus"]<-"Macrozoarces americanus"

#2 Names can be changed, but the name will be changed in a not accepted name
data1$Scientific_name[data1$Scientific_name=="Amblyraja hyperborea"]<-"Raja hyperborea"
data1$Scientific_name[data1$Scientific_name=="Apostichopus japonicus "]<-"Stichopus japonicus"
data1$Scientific_name[data1$Scientific_name=="Balistes capricus"]<- "Balistes carolinensis"
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
data1$Scientific_name[data1$Scientific_name=="Loligo forbesii"]<- "Loligo forbesi"
data1$Scientific_name[data1$Scientific_name=="Nemadactylus bergi"]<- "Cheilodactylus bergi"
data1$Scientific_name[data1$Scientific_name=="Ommastrephes bartramii"]<- "Ommastrephes bartrami"
data1$Scientific_name[data1$Scientific_name=="Parophrys vetula"]<- "Pleuronectes vetulus"
#Mizuhopecten yessoensis (Jay, 1857) (Accepted name)
data1$Scientific_name[data1$Scientific_name=="Pecten yessoensis"]<- "Patinopecten yessoensis"
data1$Scientific_name[data1$Scientific_name=="Pegusa lascaris"] <- "Solea lascaris"
data1$Scientific_name[data1$Scientific_name=="Pseudopleuronectes herzensteini"]<-"Pseudopleuronectes herzenst."
data1$Scientific_name[data1$Scientific_name=="Scophthalmus maximus "] <-"Psetta maxima"
data1$Scientific_name[data1$Scientific_name=="Solen vagina"] <-"Solen marginatus"
#Subspecies
data1$Scientific_name[data1$Scientific_name=="Sprattus sprattus balticus"]<- "Sprattus sprattus" 
#Polititapus rhomboides (Accepted name)
data1$Scientific_name[data1$Scientific_name=="Tapes rhomboides"] <-"Venerupis rhomboides"
#misspelling
data1$Scientific_name[data1$Scientific_name=="Trachyrincus scabrous"]<-"Trachyrincus scabrus"
data1$Scientific_name[data1$Scientific_name=="Trematomus hansoni" ]<-"Pagothenia hansoni"
data1$Scientific_name[data1$Scientific_name=="Zoarces americanus"] <-"Macrozoarces americanus"


#add data 2 to data 1 (look up data wrangling cheatsheet)
data12 <- left_join(data1, data2, by="Scientific_name")
colnames(data1)
data12 <- data12[,c(1:5, 8:10)] #here I selected these columns from the join data1 data2

#merge data12 to data4
colnames(data12)[6] <- "FAO.code" #to have the same variable name
colnames(data12)[1] <- "Taxon.Name" #to have the same variable name

data124 <- semi_join(data4, data12, by="FAO.code")

##checking missing observations
unmatch <- anti_join(data4, data12, by="FAO.code") #all the observation we lose
unmatchSP <- unique(unmatch$Taxon.Name)  #to see which species we lose
unmatchFAO <- unique(unmatch$FAO.code)   # o see hich FAO codes we don't have in Cheung

#species in data 12
spdata12 <- unique(data12$Taxon.Name) #988
#species in data 4
spdata4 <- unique(data4$Taxon.Name) #293
#species in data 124
spdata124 <- unique(data124$Taxon.Name) #192
#species not matched in data124
spunmatch124 <- unique(unmatch$Taxon.Name)  #101

write.csv(spunmatch124, "spunmatched.csv")

#check duplicate CODES
duplicateFAO <- data12[duplicated(data12$FAO.code), ]

data12 <- data12[!data12$Common.name=="South Pacific hake", ] #delete this obs that has the same FAO code as european hake
data12 <- data12[!data12$Common.name=="Baltic herring", ] #delete baltic herring and leave atlanic herring only
data12 <- data12[!data12$Common.name=="Hen clam", ] #delete Hen clam and leave atlanic surf clam only
data12 <- data12[!data12$Common.name=="Baltic sprat", ] #delete Baltic sprat and leave atlanic sprat only



#data124b <- semi_join(unmatch, data12, by="Taxon.Name")

#spdata124b <- unique(data124b$Taxon.Name) #only 2 species are in both tables

data12 <- data12[!is.na(data12$FAO.code), ] #delete this obs that has the same FAO code as european hake

##corrections to match all species in data4
data4$FAO.code[data4$FAO.code=="LBD"] <- "LDB"
data12$FAO.code[data12$Taxon.Name=="Scophthalmus maximus"] <- "TUR"
data4$FAO.code[data4$Taxon.Name=="Aristaeopsis edwardsiana"] <- "SSH"
data4$FAO.code[data4$Taxon.Name=="Balistes carolinensis"] <- "TRG"
data4$FAO.code[data4$Taxon.Name=="Pegusa lascaris"] <- "SOS"
data12$FAO.code[data12$Taxon.Name=="Cardium edule"] <- "COC"
data12$FAO.code[data12$Taxon.Name=="Balistes capriscus"] <- "TRG"


data124 <- left_join(data4, data12, by="FAO.code")


##Now we calculate the Mean teperature of the Catch per year for all the species cought

colnames(data124)[19] <- "Landings"

#convert 0 to NA in data124$Landings
data124$Landings <- as.numeric(as.character(data124$Landings))
data124$Landings[data124$Landings==0] <- NA

#create the columns of total catches, CTP50, CTP25, CTP75 and Nspecies per year
data124$Year <- as.numeric(data124$Year)

catchyear <- aggregate(data124$Landings, by=list(data124$Year), FUN=sum, na.rm=TRUE)
colnames(catchyear) <- c("Year", "totalcatches")

data124$catchT25 <- data124$Landings*data124$TP25
data124$catchT50 <- data124$Landings*data124$TP50
data124$catchT75 <- data124$Landings*data124$TP75

catch25 <- aggregate(data124$catchT25, by=list(data124$Year), FUN=sum, na.rm=TRUE)
colnames(catch25) <- c("Year", "catch25")

catch50 <- aggregate(data124$catchT50, by=list(data124$Year), FUN=sum, na.rm=TRUE)
colnames(catch50) <- c("Year", "catch50")

catch75 <- aggregate(data124$catchT75, by=list(data124$Year), FUN=sum, na.rm=TRUE)
colnames(catch75) <- c("Year", "catch75")

nspecies <- aggregate(data124$Taxon.Name.x, by=list(data124$Year), FUN=n_distinct, na.rm=TRUE)
colnames(nspecies) <- c("Year", "Nspecies")

#create the final MTC data.frame
MTCdata4 <- left_join(catchyear, catch25, by="Year")
MTCdata3 <- left_join(MTCdata4, catch50, by="Year")
MTCdata2 <- left_join(MTCdata3, catch75, by="Year")
MTCdata <- left_join(MTCdata2, nspecies, by="Year")



#estimate MTC for 25, 50 and 75

MTCdata$mtc25 <- MTCdata$catch25/MTCdata$totalcatches
MTCdata$mtc50 <- MTCdata$catch50/MTCdata$totalcatches
MTCdata$mtc75 <- MTCdata$catch75/MTCdata$totalcatches

MTCdata <- gather(MTCdata, "Temp", "mtc", 7:9)

g <- ggplot(MTCdata, aes(x=MTCdata$Year, y=MTCdata$mtc, factor=Temp))+
      geom_point(size=3,alpha=0.5, (aes(color = factor(Temp)))) +
      geom_line(color="grey", aes(group = Year)) +
      geom_line()+
      geom_smooth(method=lm) 
g



