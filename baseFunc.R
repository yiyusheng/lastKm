# Base Function: distance, stay time, total time
# Author: yiyusheng
# Date: 2016/07/04

# F1. distance between two point with lat and lng
dist <- function(idA,idB){
  l1 <- findL(idA)
  l2 <- findL(idB)
  lat1 <- l1[1];lng1 <- l1[2]
  lat2 <- l2[1];lng2 <- l2[2]
  
  R <- 6378137
  deltaLat <- (lat1 - lat2)/2
  deltaLng <- (lng1 - lng2)/2
  piX <- 3.141592653/180
  s <- 2*R*asin(sqrt(sin(piX*deltaLat)^2 + cos(piX*lat1)*cos(piX*lat2)*sin(piX*deltaLng)^2))
  s
}

# F2. stay time for x
staTime <- function(x){
  t <- 3*sqrt(x) + 5
  t
}

# F3.total time

# F4.find lat and lng from a Addr id
findL <- function(idStr){
  idx <- which(addrID$id == idStr)
  r <- c(addrID$lat[idx],addrID$lng[idx])
  r
}