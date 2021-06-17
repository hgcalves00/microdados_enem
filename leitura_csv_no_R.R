library(data.table)
microdados_CN <- fread("MICRODADOS_ENEM_2017.csv", select = c("IN_TREINEIRO", "CO_PROVA_CN", "TX_RESPOSTAS_CN", "TX_GABARITO_CN"))

microdados_CN <- subset(microdados_CN, IN_TREINEIRO == '0', select=names(microdados_CN))

respostas_CN <- microdados_CN[, c('CO_PROVA_CN', 'TX_RESPOSTAS_CN')]


library(tidyr)
respostas_CN <- separate(respostas_CN[, c('CO_PROVA_CN', 'TX_RESPOSTAS_CN')], col = 'TX_RESPOSTAS_CN', sep = c(1:45), into = c(paste("i", 1:45, sep ="")))

colnames(respostas_CN)<- c('COR', paste('i', 1:45, sep=""))

gabarito_CN <- separate(microdados_CN[, c('CO_PROVA_CN', 'TX_GABARITO_CN')], col = 'TX_GABARITO_CN', sep = c(1:45), into = c(paste("i", 1:45, sep ="")))


library(Deducer)
#LEMBRA QUE CADA APLICAÇÃO TEM UM CÓDIGO DE PROVA!
respostas_CN <- recode.variables(respostas_CN, "'A'->1; 'B'->2; 'C'->3; 'D'->4; 'E'->5;'391'->'AZUL';'392'->'AMARELO';'393'->'CINZA';'394'->'ROSA';'407'->'LARANJA ADAP';'411'->'VERDE ADAP';'433'->'AZUL REAP';'431'->'AMARELO REAP';'432'->'CINZA REAP';'434'->'ROSA REAP'")

colnames(respostas_CN)<- c('COR', paste('i', 1:45, sep=""))
#aqui se separa os cadernos de respostas
respostas_CN_AZUL <- subset(respostas_CN, COR == 'AZUL', select=names(respostas_CN))
respostas_CN_AMARELO <- subset(respostas_CN, COR == 'AMARELO', select=names(respostas_CN))
respostas_CN_CINZA <- subset(respostas_CN, COR == 'CINZA', select=names(respostas_CN))
respostas_CN_ROSA <- subset(respostas_CN, COR == 'ROSA', select=names(respostas_CN))
respostas_CN_LARANJA_ADAP <- subset(respostas_CN, COR == 'LARANJA ADAP', select=names(respostas_CN))
respostas_CN_VERDE_ADAP <- subset(respostas_CN, COR == 'VERDE ADAP', select=names(respostas_CN))
respostas_CN_AZUL_REAP <- subset(respostas_CN, COR == 'AZUL REAP', select=names(respostas_CN))
respostas_CN_AMARELO_REAP <- subset(respostas_CN, COR == 'AMARELO_REAP', select=names(respostas_CN))
respostas_CN_CINZA_REAP <- subset(respostas_CN, COR == 'CINZA REAP', select=names(respostas_CN))
respostas_CN_ROSA_REAP <- subset(respostas_CN, COR == 'ROSA REAP', select=names(respostas_CN))

gabarito_CN<- recode.variables(gabarito_CN, "'A'->1; 'B'->2; 'C'->3; 'D'->4; 'E'->5;'391'->'AZUL';'392'->'AMARELO';'393'->'CINZA';'394'->'ROSA';'407'->'LARANJA ADAP';'411'->'VERDE ADAP';'433'->'AZUL REAP';'431'->'AMARELO REAP';'432'->'CINZA REAP';'434'->'ROSA REAP'")

colnames(gabarito_CN)<- c('COR', paste('i', 1:45, sep=""))

#aqui se separam
gabarito_CN_AZUL <- subset(gabarito_CN, COR == 'AZUL', select=names(gabarito_CN))
gabarito_CN_AZUL <- gabarito_CN_AZUL[1,]

#cada aplicação vai ter seu código de cores
gabarito_CN_AMARELO <- subset(gabarito_CN, COR == 'AMARELO', select=names(gabarito_CN))
gabarito_CN_AMARELO <- gabarito_CN_AMARELO[1,]

gabarito_CN_CINZA <- subset(gabarito_CN, COR == 'CINZA', select=names(gabarito_CN))
gabarito_CN_CINZA <- gabarito_CN_CINZA[1,]

gabarito_CN_ROSA <- subset(gabarito_CN, COR == 'ROSA', select=names(gabarito_CN))
gabarito_CN_ROSA <- gabarito_CN_ROSA[1,]

gabarito_CN_LARANJA_ADAP <- subset(gabarito_CN, COR == 'LARANJA ADAP', select=names(gabarito_CN))
gabarito_CN_LARANJA_ADAP <- gabarito_CN_LARANJA_ADAP[1,]

gabarito_CN_VERDE_ADAP <- subset(gabarito_CN, COR == 'VERDE ADAP', select=names(gabarito_CN))
gabarito_CN_VERDE_ADAP <- gabarito_CN_VERDE_ADAP[1,]

gabarito_CN_AZUL_REAP <- subset(gabarito_CN, COR == 'AZUL REAP', select=names(gabarito_CN))
gabarito_CN_AZUL_REAP <- gabarito_CN_AZUL_REAP[1,]

gabarito_CN_AMARELO_REAP <- subset(gabarito_CN, COR == 'AMARELO REAP', select=names(gabarito_CN))
gabarito_CN_AMARELO <- gabarito_CN_AMARELO_REAP[1,]

gabarito_CN_CINZA_REAP <- subset(gabarito_CN, COR == 'CINZA REAP', select=names(gabarito_CN))
gabarito_CN_CINZA_REAP <- gabarito_CN_CINZA_REAP[1,]

gabarito_CN_ROSA_REAP <- subset(gabarito_CN, COR == 'ROSA REAP', select=names(gabarito_CN))
gabarito_CN_ROSA_REAP <- gabarito_CN_ROSA_REAP[1,]

#aplicação da TRI
library(ltm)
AZUL_CN.NA<-mult.choice(respostas_CN_AZUL[,2:46],as.numeric(gabarito_CN_AZUL[,2:46]))
AZUL_CN.f<-ifelse(is.na(AZUL_CN.NA)==T,0,AZUL_CN.NA)
fwrite(AZUL_CN.f, file = "AZUL_CN.csv")

AMARELO_CN.NA<-mult.choice(respostas_CN_AMARELO[,2:46],as.numeric(gabarito_CN_AMARELO[,2:46]))
AMARELO_CN.f<-ifelse(is.na(AMARELO_CN.NA)==T,0,AMARELO_CN.NA)
fwrite(AMARELO_CN.f, file = "AMARELO_CN.csv")

CINZA_CN.NA<-mult.choice(respostas_CN_CINZA[,2:46],as.numeric(gabarito_CN_CINZA[,2:46]))
CINZA_CN.f<-ifelse(is.na(CINZA_CN.NA)==T,0,CINZA_CN.NA)
fwrite(CINZA_CN.f, file = "CINZA_CN.csv")

ROSA_CN.NA<-mult.choice(respostas_CN_ROSA[,2:46],as.numeric(gabarito_CN_ROSA[,2:46]))
ROSA_CN.f<-ifelse(is.na(ROSA_CN.NA)==T,0,ROSA_CN.NA)
fwrite(ROSA_CN.f, file = "ROSA_CN.csv")

LARANJA_ADAP_CN.NA<-mult.choice(respostas_CN_LARANJA_ADAP[,2:46],as.numeric(gabarito_CN_LARANJA_ADAP[,2:46]))
LARANJA_ADAP_CN.f<-ifelse(is.na(LARANJA_ADAP_CN.NA)==T,0,LARANJA_ADAP_CN.NA)
fwrite(LARANJA_ADAP_CN.f, file = "LARANJA_ADAP_CN.csv")

VERDE_ADAP_CN.NA<-mult.choice(respostas_CN_VERDE_ADAP[,2:46],as.numeric(gabarito_CN_VERDE_ADAP[,2:46]))
VERDE_ADAP_CN.f<-ifelse(is.na(VERDE_ADAP_CN.NA)==T,0,VERDE_ADAP_CN.NA)
fwrite(VERDE_ADAP_CN.f, file = "VERDE_ADAP_CN.csv")

AZUL_REAP_CN.NA<-mult.choice(respostas_CN_AZUL_REAP[,2:46],as.numeric(gabarito_CN_AZUL_REAP[,2:46]))
AZUL_REAP_CN.f<-ifelse(is.na(AZUL_REAP_CN.NA)==T,0,AZUL_REAP_CN.NA)
fwrite(AZUL_REAP_CN.f, file = "AZUL_REAP_CN.csv")

AMARELO_REAP_CN.NA<-mult.choice(respostas_CN_AMARELO_REAP[,2:46],as.numeric(gabarito_CN_AMARELO_REAP[,2:46]))
AMARELO_REAP_CN.f<-ifelse(is.na(AMARELO_REAP_CN.NA)==T,0,AMARELO_REAP_CN.NA)
fwrite(AMARELO_REAP_CN.f, file = "AMARELO_REAP_CN.csv")

CINZA_REAP_CN.NA<-mult.choice(respostas_CN_CINZA_REAP[,2:46],as.numeric(gabarito_CN_CINZA_REAP[,2:46]))
CINZA_REAP_CN.f<-ifelse(is.na(CINZA_REAP_CN.NA)==T,0,CINZA_REAP_CN.NA)
fwrite(CINZA_REAP_CN.f, file = "CINZA_REAP.csv")

ROSA_REAP_CN.NA<-mult.choice(respostas_CN_ROSA_REAP[,2:46],as.numeric(gabarito_CN_ROSA_REAP[,2:46]))
ROSA_REAP_CN.f<-ifelse(is.na(ROSA_REAP_CN.NA)==T,0,ROSA_REAP_CN.NA)
fwrite(ROSA_REAP_CN.f, file = "ROSA_REAP_CN.csv")
