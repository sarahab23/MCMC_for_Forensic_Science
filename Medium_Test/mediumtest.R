library(seqinr)
library(ggplot2)
#reading fsa file
data_abif<-read.abif(file.choose ("A01-Ladder-PP16-001.20sec.fsa"))
data <- data_abif$Data

#creating dataframe df1
time<-c(1:length(data[["DATA.1"]]))
data_number<-rep("DATA.1",length(data[["DATA.1"]]))
value<-data$DATA.1
df1<-data.frame(time,data_number,value)

#creating dataframe df2
time<-c(1:length(data[["DATA.2"]]))
data_number<-rep("DATA.2",length(data[["DATA.2"]]))
value<-data$DATA.2
df2<-data.frame(time,data_number,value)

#creating dataframe df3
time<-c(1:length(data[["DATA.3"]]))
data_number<-rep("DATA.3",length(data[["DATA.3"]]))
value<-data$DATA.3
df3<-data.frame(time,data_number,value)

#creating dataframe df4
time<-c(1:length(data[["DATA.4"]]))
data_number<-rep("DATA.4",length(data[["DATA.4"]]))
value<-data$DATA.4
df4<-data.frame(time,data_number,value)

#creating dataframe df5
time<-c(1:length(data[["DATA.5"]]))
data_number<-rep("DATA.5",length(data[["DATA.5"]]))
value<-data$DATA.5
df5<-data.frame(time,data_number,value)

#creating dataframe df6
time<-c(1:length(data[["DATA.6"]]))
data_number<-rep("DATA.6",length(data[["DATA.6"]]))
value<-data$DATA.6
df6<-data.frame(time,data_number,value)

#creating dataframe df7
time<-c(1:length(data[["DATA.7"]]))
data_number<-rep("DATA.7",length(data[["DATA.7"]]))
value<-data$DATA.7
df7<-data.frame(time,data_number,value)

#creating dataframe df8
time<-c(1:length(data[["DATA.8"]]))
data_number<-rep("DATA.8",length(data[["DATA.8"]]))
value<-data$DATA.8
df8<-data.frame(time,data_number,value)

#combining all 8 dataframes into a dataframe
df<-rbind(df1,df2,df3,df4,df5,df6,df7,df8)

#plotting multi-panel ggplot with facet_grid
ggplot(data = df,group=data_number,aes(color=data_number)) +
  geom_line(data = df,aes(x=time,y=value))+facet_grid(.~data_number,scales = "free_x")+
  scale_x_continuous(name = "Time/1000")+scale_y_continuous(name = "RFU/1000")