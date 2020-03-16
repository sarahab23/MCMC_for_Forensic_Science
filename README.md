# Tests for the project "MCMC for Forensic Science" in Google Summer of Code 2020

## 1. Easy Test

### Problem Statement

Download data from [https://lftdi.camden.rutgers.edu/provedit/files/](https://lftdi.camden.rutgers.edu/provedit/files/) then use `seqinr::read.abif` to read and `seqinr::plotabif` to plot an fsa file.

First, I downloaded data from the given link. Then I installed the current version of `seqinr` package, which is used for biological sequences retrieval and analysis. In the following code, I used `seqinr::read.abif()` to read the fsa file(data) and then I plot the data extracted using `seqinr::plotabif()`.

### Code

```
library(seqinr)
#reading fsa file using read.abif()
data<-read.abif(file.choose ("A01-Ladder-PP16-001.20sec.fsa"))
#plotting the data
plotabif(data)
```
### Plot

Plot created is shown below:

![](Easy_Test/easytest_output.png)

## 2. Medium Test

### Problem Statement

To make a similar multi-panel ggplot with `facet_grid`.

### Code

```
library(seqinr)
library(ggplot2)
#reading fsa file
data_abif<-read.abif(file.choose ("A01-Ladder-PP16-001.20sec.fsa"))
data <- data_abif$Data

#creating dataframe df1 that stores DATA.1 values
time<-c(1:length(data[["DATA.1"]]))
data_number<-rep("DATA.1",length(data[["DATA.1"]]))
value<-data$DATA.1
df1<-data.frame(time,data_number,value)

#creating dataframe df2 that stores DATA.2 values
time<-c(1:length(data[["DATA.2"]]))
data_number<-rep("DATA.2",length(data[["DATA.2"]]))
value<-data$DATA.2
df2<-data.frame(time,data_number,value)

#creating dataframe df3 that stores DATA.3 values
time<-c(1:length(data[["DATA.3"]]))
data_number<-rep("DATA.3",length(data[["DATA.3"]]))
value<-data$DATA.3
df3<-data.frame(time,data_number,value)

#creating dataframe df4 that stores DATA.4 values
time<-c(1:length(data[["DATA.4"]]))
data_number<-rep("DATA.4",length(data[["DATA.4"]]))
value<-data$DATA.4
df4<-data.frame(time,data_number,value)

#creating dataframe df5 that stores DATA.5 values
time<-c(1:length(data[["DATA.5"]]))
data_number<-rep("DATA.5",length(data[["DATA.5"]]))
value<-data$DATA.5
df5<-data.frame(time,data_number,value)

#creating dataframe df6 that stores DATA.6 values
time<-c(1:length(data[["DATA.6"]]))
data_number<-rep("DATA.6",length(data[["DATA.6"]]))
value<-data$DATA.6
df6<-data.frame(time,data_number,value)

#creating dataframe df7 that stores DATA.7 values
time<-c(1:length(data[["DATA.7"]]))
data_number<-rep("DATA.7",length(data[["DATA.7"]]))
value<-data$DATA.7
df7<-data.frame(time,data_number,value)

#creating dataframe df8 that stores DATA.8 values
time<-c(1:length(data[["DATA.8"]]))
data_number<-rep("DATA.8",length(data[["DATA.8"]]))
value<-data$DATA.8
df8<-data.frame(time,data_number,value)

#combining the first 4 dataframes into a dataframe
df<-rbind(df1,df2,df3,df4)
#combining the next 4 dataframes into a dataframe
datafr<-rbind(df5,df6,df7,df8)

#plotting multi-panel ggplot with facet_grid
ggplot(data = df,group=data_number,aes(color=data_number)) +
  geom_line(data = df,aes(x=time,y=value))+facet_grid(data_number~.,scales = "free")+
  scale_x_continuous(name = "Time/1000")+scale_y_continuous(name = "RFU/1000")

#plotting multi-panel ggplot with facet_grid
ggplot(data = datafr,group=data_number,aes(color=data_number)) +
  geom_line(data = datafr,aes(x=time,y=value))+facet_grid(data_number~.,scales = "free")+
  scale_x_continuous(name = "Time/1000")+scale_y_continuous(name = "RFU/1000")
```
### Plot

Plot created by the above code is shown below:

![](Medium_Test/Output_plots/mediumtest_output01.png)
![](Medium_Test/Output_plots/mediumtest_output02.png)

## 2. Medium Test

### Problem Statement

Demonstrate your capability in one of the "Bayesian packages for general model fitting" listed here: [https://cloud.r-project.org/web/views/Bayesian.html](https://cloud.r-project.org/web/views/Bayesian.html), or in writing an R package with C++ code.

I have created two R packages using C++. One package is called `calc`, the other one `vectorfuncts` package. `calc` package basically does the function of a calculator. This package has a C++ file with functions `sum()`, `mul()`, `diff()` and `div()` which does the job of Addition, Multiplication, Subraction and Division respectively. It also consists of an R file with a function `calci()` that implements `sum()`, `mul()`, `diff()` and `div()` functions.
The second package I created is `vectorfuncts` package. This package had a C++ file with two functions `larg()` and `small()`, which does the job of finding the largest and smallest number in the numeric vector passed respectively. It also has an R package which has functions `largest()` and `smallest()` that implements the above mentioned functions.

### Code

## vectorfuncts Package

# C++ File code
```
#include<RcppArmadillo.h>
// [[Rcpp::depends(RcppArmadillo)]]
using namespace Rcpp ;
// [[Rcpp::export()]]
int sum(int a, int b){
    return a+b;
}
// [[Rcpp::export()]] 
int mul(int a, int b){
      return a*b;
  }
// [[Rcpp::export()]]
int diff(int a, int b){
      return a-b;
  }
// [[Rcpp::export()]]
float div(float a, float b){
    return a/b;
}
```
# R file Code
```
calci <- function(x,a,b){
switch(
  x,
  "+" = ans <- sum(a,b), #Addition
  "-" = ans <- diff(a,b), #Subraction
  "*" = ans <- mul(a,b), #Multiplication
  "/" = ans <- div(a,b) #Division
)
  ans
}
```

## calc Package

# C++ File code
```
#include<RcppArmadillo.h>
// [[Rcpp::depends(RcppArmadillo)]]
using namespace Rcpp ;
// [[Rcpp::export()]]
int larg(Rcpp::IntegerVector x){
 int n = x.size();
 int res = x[0] ;
 for(int i=1;i<n;i++){
    if(res<x[i])
        res=x[i];
 }
 return res;
}
// [[Rcpp::export()]]
int small(Rcpp::IntegerVector x){
 int n = x.size();
 int res = x[0] ;
 for(int i=1;i<n;i++){
    if(res>x[i])    
        res=x[i];
 }
 return res;
}
```
# R file Code
```
#function to find the largest number in a numeric vector
largest <- function(x){
  ans1 <- larg(x)
  ans1
}
#function to find the smallest number in a numeric vector
smallest <- function(x){
  ans2 <- small(x)
  ans2
}
```
### Output

I have attached the output screenshots to show the implementation of functions of the packages `calc` and `vectorfuncts`.

![](Hard_Test/Output/package_calc_output.png)
![](Hard_Test/Output/package_vectorfuncts_output.png)

