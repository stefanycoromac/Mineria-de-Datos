library("arules")
install.packages("ggplot2")
library(ggplot2)

data <- read.csv("D:/Quincho/Samy/db_csv_/db_csv_/MIGRACION_BDP.csv", sep = ",")

#Filtramos la data, por area Rural y para personas del sexo masculino 
datam <- subset(data, AREA==2)
datam <- subset(datam, PEI3==2)
# Entre los años de 2010 y 2024 
datam <- subset(datam, PEI5 > 2009 & PEI5 < 2025)


cluster <- kmeans(datam, centers=4)
grafica <- ggplot(datam, aes(x = PEI4, y = PEI5, color = as.factor(cluster$cluster)))+
  geom_point()+
  geom_point(data = as.data.frame(cluster$centers), aes(x=PEI4, y = PEI5), color = "black", size=4, shape=17)+
  labs(title = "Edad vs Año de Migración")+
  theme_minimal()
grafica
