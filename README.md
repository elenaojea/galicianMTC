# galicianMTC

Elena Ojea, 
September 2017

This folder contains data files and code for:
1. Calculating the Mean Temperature of the catch for Galician Landings 1950-2015
2. PLotting the temperatura and precipitation for coastal Galicia and specific species over time. 

1. Calculating the MTC

-	CheungD1.csv: database 1 on the range temperatures for marine species in Cheung et al., 2013 paper. 
-	CodigosFAO_D2.csv: database 2 on the FAO codes for species names
-	GalicianSpecies_D3.csv: database 3 on FAO codes for Galician Species
-	HistoricLandings_D4.csv: database on the historic landings from 1950 to 2015 in Galicia (ministry and pescadegalicia data).
-	Code for galician data elena.R: code for Reading D1, D2, D3, D4 and calculating the MTC. 
2. Plotting landings and Temperature/precipitation

-	Elena_Precipitation_Serie.mat: data from Fran Santos on precipitation series Galicia.
-	Elena_SST_serie.mat: data from Fran Santos on temperature in Galicia.
-	R_code_SST_precip.R: code for reading the .mat data from matlab (Fran Santos) and producing .csv files for plotting and exporting temperature and precipitation data.
-	Niels code.R: code developed by Niels on the graphs of landings and SST and Precipitation for several species
