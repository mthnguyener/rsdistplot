#Allow users to generate random samples from 4 different distributions:
#Normal
#t
#F
#Binomial

#Users should only have to enter the name of the distribution and the number of samples to get a sample with the default argument values.
#Users should be able to specify arguments for the parameters of each distribution to override the defaults.

#Normal: Mean and Standard Deviation
#t: Degrees of Freedom
#F: Numerator and Denominator Degrees of Freedom
#Binomial: Size (Number of Trials),and p (Probability of Success on each Trial)

#-Users should be able to choose to set the seed or not and if they set the seed the value of the seed.

rsdist <- function(d, n, x, y=NULL, s=NULL) {
  set.seed(s)
  if (d == 'n') {
    rnorm(n = n, mean = x, sd = y)
  } else if (d == 't') {
    set.seed(y)
    rt(n = n, df = x)
  } else if (d == 'f') {
    rf(n = n, df1 = x, df2 = y)
  }  else if (d == 'b') {
    rbinom(n = n, size = x, prob = y)
  } else {
    stop(paste0("normal = (\"n\", n, x=mean, y=sd, s=set.seed(s)), t dist = (\"t\", n, x=df, y=set.seed(s)), F dist = (\"f\", n, x=v1, y=v2, s=set.seed(s)), Binomial = (\"b\", n, x=size, y=probability, s=set.seed(s))"))
  }
}
