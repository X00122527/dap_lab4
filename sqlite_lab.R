install.packages("RSQLite")

library(RSQLite)

sapply(rep(20,10), FUN=my_func) # outputs 10x 20s

#exercise
sapply(rep(20,10),FUN=my_func)



my_func <- function(q){
  print(q)
  
  ud <- runif(q, min = 1, max = 20)
  #print(ud)
  
  mean(ud)
}


mean(sapply(rep(20,10),FUN=my_func))


###

# load the database driver library
library(RSQLite) 

# connect to the database and keep the connection in conSQLite
conSQLite <- dbConnect(RSQLite::SQLite(), dbname="C:\\student\\athletes.sqlite")

# execute your query
resultsHandle <- dbSendQuery(conSQLite, "select Ht from athletes_table;")

# fetch numRows in the query
numRows <- 20
d <- fetch(resultsHandle, n=numRows)




library(RSQLite)
conSQLite <- dbConnect(RSQLite::SQLite(), dbname="C:\\student\\athletes.sqlite")
resultsHandle <- dbSendQuery(conSQLite, "select Ht from athletes_table;")
numRows <- 20
#a <- fetch(resultsHandle, n=numRows)
#mean(a$Ht) # important

getAverageHeightForChunk  <- function(numRows){
  f <- fetch(resultsHandle, n = numRows)
  mean(f$Ht)
}

#a <- getAverageHeightForChunk(20)

#mean(sapply(rep(20,10),FUN=my_func))

mean(sapply(rep(20,10), FUN=getAverageHeightForChunk))
