library(ggplot2)
library(corrgram)
library(corrplot)

summary(db)

ggplot(hp, aes(x=Group.1,y=Happiness.Score,fill=Group.1)) + geom_bar(stat = "identity") + ggtitle("Happiness Score of each country") + ylab("Happiness score") + xlab("continents")

col <- sapply(db, is.numeric)

cor.data <- cor(db[,col])
corrplot(cor.data,method = 'number',type = 'upper')
box <- ggplot(db, aes(x=Region, y=Happiness.Score,fill = Region))
box + geom_boxplot() + geom_jitter(aes(color=Country),size=1.0) +ggtitle("Happiness Score for Regions and Countries") + coord_flip()+ theme(legend.position = "none")
