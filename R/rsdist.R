#' Random Sample Distribution
#'
#' Allow users to generate random samples from 4 different distributions: Normal("n"), t("t"), F("f"), Binomial("b")
#' Users should only have to enter the name of the distribution ("n", "t", "f", "b") and the number of samples (n) to get a sample with the default argument values.
#' Users should be able to specify arguments for the parameters of each distribution to override the defaults.
#' Normal: Mean (x) and Standard Deviation (y)
#' t: Degrees of Freedom (x)
#' F: Numerator (x) and Denominator Degrees of Freedom (y)
#' Binomial: Size-Number of Trials (x),and p-Probability of Success on each Trial (y)
#' Users should be able to choose to set the seed or not and if they set the seed the value of the seed (the last arguments or s).
#'
#' @param d Character variable representing 4 types of distributions (n = Normal, t = t, f = F, and b = Binomial)
#' @param n Interger variable for sample size
#' @param x Parameter 1 of the distribution
#' @param y Parameter 2 of the distribution
#' @param s Set seed to s interger
#'
#' @return
#' @export
#' @importFrom stats rnorm rt rf rbinom
#'
#' @examples rsdist("n", n = 50, x = 6, y = 5, s = 1)
rsdist <- function(d, n, x, y=NULL, s=NULL) {
  set.seed(s)
  if (d == "n") {
    rnorm(n = n, mean = x, sd = y)
  } else if (d == "t") {
    set.seed(y)
    rt(n = n, df = x)
  } else if (d == "f") {
    rf(n = n, df1 = x, df2 = y)
  }  else if (d == "b") {
    rbinom(n = n, size = x, prob = y)
  } else {
    stop(paste0("distribution is not normal (\"n\"), t (\"t\"), F (\"f\"), Binomial = (\"b\")"))
  }
}
