calci <- function(x,a,b){
switch(
  x,
  "+" = ans <- sum(a,b),
  "-" = ans <- diff(a,b),
  "*" = ans <- mul(a,b),
  "/" = ans <- div(a,b)
)
  ans
}
