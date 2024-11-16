install.packages("rpart")
install.packages("rpart.plot")

library(rpart)
library(rpart.plot)

hogares <- read.csv('D:/Quincho/Samy/db_csv_/db_csv_/HOGAR_BDP.csv', sep = ',')

arbol <- rpart(PCH9_G ~ 
                PCH9_F+
                PCH9_K+
                PCH7 + 
                PCH8 + 
                AREA
                , data = hogares, method = "class")

rpart.plot(arbol, type = 2, extra = 0, under = TRUE, fallen.leaves = TRUE,
           box.palette = "BuGn", main = "Predicción si el hogar cuenta con lavadora de ropa")

lavadora <- data.frame(
  PCH9_F = c(1), 
  PCH9_K = c(1), 
  PCH7 = c(1), 
  PCH8 = c(2), 
  AREA = c(1)
)

result <- predict(arbol, lavadora, type = "class")
result
