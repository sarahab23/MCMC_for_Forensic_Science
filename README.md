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

Plot created is shown below`:

![](Easy_Test/easytest_output.png)
