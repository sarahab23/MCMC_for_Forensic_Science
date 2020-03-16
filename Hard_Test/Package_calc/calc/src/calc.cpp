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
