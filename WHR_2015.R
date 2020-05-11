library(dplyr)
db <- read.csv("world-happiness-data.csv")
View(db)

db <- db[,-5]
View(db)
db$continent <- NA
db$continent[which(db$Region %in% c("Australia and New Zealand"))] <- "Australia"
db$continent[which(db$Region %in% c("North America"))] <- "North America"
db$continent[which(db$Region %in% c("Western Europe","Central and Eastern Europe"))] <- "Europe"
db$continent[which(db$Region %in% c("Middle East and Northern Africa","Sub-Saharan Africa"))] <- "Africa"

db$continent[which(db$Region %in% c("Southeastern Asia","Southern Asia","Eastern Asia"))] <- "Asia"

db$continent[which(db$Region %in% c("North America","Latin America and Caribbean"))] <- "America"
