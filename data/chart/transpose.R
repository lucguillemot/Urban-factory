cities <- read.csv("data/cities.csv")
cities <- cities[,c(4,3,1,2,5:84)]
tcities = setNames(data.frame(t(cities[,-1])), cities[,1])
ncol(tcities)
nrow(tcities)
rownames(tcities)<-sub("BC", "-", rownames(tcities))
rownames(tcities)<-sub("AD", "", rownames(tcities))
write.csv(tcities, file="data/chart/tcities.csv")