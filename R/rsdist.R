#Allow users to generate plots of histograms for random samples from 4 different distributions:

#Normal
#t
#F
#Binomial

#Users should only have to enter the name of the distribution and the number of samples to get a result.

#Users should be able to include additional parameters for each distribution as well as the number of bins for the histogram

#Normal: Mean and Standard Deviation
#t: Degrees of Freedom
#F: Numerator and Denominator Degrees of Freedom
#Binomial: Size (Number of Trials),and p (Probability of Success on each Trial)

#Users should be able to choose to set the seed or not and if they set the seed the value of the seed.

rsdist <- function(d) {
  if (d == "n") {
    rnorm(n = 10, mean = 0, sd = 1)
  } else if (d == "t") {

  } else if (d == "f") {

  }  else if (d == "b") {

  } else {
    stop(paste0("normal = (n, mean, sd), t dist = (t, df), F dist = (f, num, denom), Binomial = (b, size, prob)"))
  }
}
