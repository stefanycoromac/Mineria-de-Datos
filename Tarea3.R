data <- read.csv("D:/Quincho/Samy/db_csv_/db_csv_/MIGRACION_BDP.csv", sep = ",")

library("arules")

library(fim4r)
reglas <- fim4r(data, method = "fpgrowth", target="rules", supp = .2, conf = .5)
reglas
reglas_frame <- as(reglas, "data.frame")
View(reglas_frame)
