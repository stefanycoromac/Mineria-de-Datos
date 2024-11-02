install.packages("arules")
library(arules)

data <- read.csv('D:\\StefanyC\\Maestria\\Cuarto Trimestre\\MineriaDatos\\Datos\\db_csv_\\PERSONA_BDP.csv', sep = ",")
data 

#Quitamos las columnas que nos dieron error 
data <- data %>% select(-PCP33)
data <- data %>% select(-PEA)
data <- data %>% select(-POCUPA)
data <- data %>% select(-PEI)

rules <- apriori(data = transactions, parameter = list(support = 0.2, confidence = 0.5))

inspect(reglas[0:100])
inspect(reglas[100:200])
inspect(reglas[200:300])
inspect(reglas[300:400])
inspect(reglas[1100:1200])
