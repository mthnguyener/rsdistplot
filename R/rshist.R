#' Random Sample Histogram
#'
#' Allow users to generate plots of histograms for random samples from 4 different distributions: Normal("n"), t("t"), F("f"), Binomial("b")
#' Users should only have to enter the name of the distribution ("n", "t", "f", "b") and the number of samples (n) to get a result
#' Users should be able to include additional parameters for each distribution as well as the number of bins for the histogram
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
#'
#' @examples
rshist <- function(d, n, x, y=NULL, s=NULL) {
  set.seed(s)
  if (d == 'n') {
    normal <- rnorm(n = n, mean = x, sd = y)
    hist(normal)
  } else if (d == 't') {
    set.seed(y)
    tdist <- rt(n = n, df = x)
    hist(tdist)
  } else if (d == 'f') {
    fdist <- rf(n = n, df1 = x, df2 = y)
    hist(fdist)
  }  else if (d == 'b') {
    binom <- rbinom(n = n, size = x, prob = y)
    hist(binom)
  } else {
    stop(paste0("normal = (\"n\", n, x=mean, y=sd, s=set.seed(s)), t dist = (\"t\", n, x=df, y=set.seed(s)), F dist = (\"f\", n, x=v1, y=v2, s=set.seed(s)), Binomial = (\"b\", n, x=size, y=probability, s=set.seed(s))"))
  }
}
