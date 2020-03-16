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
