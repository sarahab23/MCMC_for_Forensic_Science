library(seqinr)
#reading fsa file using read.abif()
data<-read.abif(file.choose ("A01-Ladder-PP16-001.20sec.fsa"))
#plotting the data
plotabif(data)
