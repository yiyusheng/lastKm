# Read all data in a Rda
# Author: yiyusheng
# Date: 2016/07/04

rm(list = ls())
#@@@ CONFIGURE @@@#
source('head.R')
source(file.path(dir_code,'baseFunc.R'))
#@@@ PACKAGE @@@#
library(ggplot2)

####################################
# S1.load data
addrA <- read.csv(file = file.path(dir_data,'sourceData','1.csv'),header = F,skip = 1)
addrB <- read.csv(file = file.path(dir_data,'sourceData','2.csv'),header = F,skip = 1)
addrS <- read.csv(file = file.path(dir_data,'sourceData','3.csv'),header = F,skip = 1)
itemF <- read.csv(file = file.path(dir_data,'sourceData','4.csv'))
itemE <- read.csv(file = file.path(dir_data,'sourceData','5.csv'))
cID <- read.csv(file = file.path(dir_data,'sourceData','6.csv'))
addrID <- rbind(addrA,addrB,addrS)
names(addrID) <- c('id','lat','lng')
addrID$type <- substr(addrID$id,1,1)
addrID$weight <- 1
addrID$weight[addrID$type == 'A'] <- 3
addrID$weight[addrID$type == 'S'] <- 1.5

# S2. analysis
ggplot(addrID,aes(x = lat,y = lng,color = type,size = weight)) + geom_point()
addrgrid <- expand.grid(addrID$id,addrID$id)
mapply(addrgrid$Var1,addrgrid$Var2,function(x))