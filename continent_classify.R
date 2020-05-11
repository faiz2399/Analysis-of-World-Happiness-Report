db$happinessmeter <- NA
db$happinessmeter[which(db$Region%in% c("Australia and New Zealand","Western Europe","North America"))] <- "Happiest"
db$happinessmeter[which(db$Region%in% c("Sub-Saharan Africa"))] <- "Least Happiest"
db$happinessmeter[which(db$Region%in% c("Southern Asia","Southeastern Asia","Middle East and Northern Africa","Latin America and Caribbean","Eastern Asia","Central and Eastern Europe"))]<- "Neutral"

ggplot(db,aes(x=Health..Life.Expectancy., y=Happiness.Score)) +geom_point(aes(color=happinessmeter),size =3,alpha = .8)+ geom_smooth(aes(color = happinessmeter,fill = happinessmeter),method = "lm",fullrange=T)+ facet_wrap(~happinessmeter)+theme_bw()

ggplot(db,aes(x=Generosity, y=Happiness.Score)) +geom_point(aes(color=happinessmeter),size =3,alpha = .8)+ geom_smooth(aes(color = happinessmeter,fill = happinessmeter),method = "lm",fullrange=T)+ facet_wrap(~happinessmeter)+theme_bw()


library(rworldmap)

d <- data.frame(country = db$Country,value = db$Economy..GDP.per.Capita.)
n <- joinCountryData2Map(d, joinCode = "NAME", nameJoinColumn = "country")
mapCountryData(n,nameColumnToPlot = "value",mapTitle = "World Map for GDP 2015",colourPalette = "terrain")

d <- data.frame(country = db$Country,value = db$Health..Life.Expectancy.)
n <- joinCountryData2Map(d, joinCode = "NAME", nameJoinColumn = "country")
mapCountryData(n,nameColumnToPlot = "value",mapTitle = "Health and Life Expectancy",colourPalette = "terrain")
