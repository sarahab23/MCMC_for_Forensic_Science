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
