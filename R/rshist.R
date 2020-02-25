#' Random Sample Histogram
#'
#' Allow users to generate plots of histograms for random samples from 4 different distributions: Normal("n"), t("t"), F("f"), Binomial("b")
#' Users only need to enter the name of the distribution ("n", "t", "f", "b") and the number of samples (n) to get a result
#' Users can include additional parameters for each distribution as well as the number of bins for the histogram
#' Normal: Mean (x) and Standard Deviation (y)
#' t: Degrees of Freedom (x)
#' F: Numerator (x) and Denominator Degrees of Freedom (y)
#' Binomial: Size-Number of Trials (x),and p-Probability of Success on each Trial (y)
#' Users can choose to set the seed or not and if they set the seed the value of the seed. To set seed, add s = interger (ex. s = 1) when calling the function.
#'
#' @param d Character variable representing 4 types of distributions (n = Normal, t = t, f = F, and b = Binomial)
#' @param n Interger variable for sample size
#' @param x Parameter 1 of the distribution (default = 50)
#' @param y Parameter 2 of the distribution (default = 50)
#' @param s Set seed to s interger (default = NULL)
#' @param b Set binwidth (default = 2)
#'
#' @return A plot of random variates having normal, t, f, or binomial distribution
#' @export rshist
#' @importFrom ggplot2 ggplot aes geom_histogram coord_flip ggtitle xlab
#' @importFrom stats rnorm rt rf rbinom
#' @importFrom ggthemes theme_economist scale_color_economist
#'
#' @examples rshist("n", n = 1000, x = 6, y = 5, s = 1)
rshist <- function(d, n, x = 50, y = 50, s=NULL, b=2) {
  set.seed(s)
  if (d == "n") {
    normal <- rnorm(n = n, mean = x, sd = y)
    normal <- as.data.frame(normal)
    ggplot(normal, aes(x=normal)) +
      geom_histogram(color="darkblue", fill="lightblue", binwidth = b) +
      theme_economist() +
      scale_color_economist() +
      ggtitle("Random Normal Distribution Histogram") +
      xlab(paste(n, "Samples in", b, "Bins"))
  } else if (d == "t") {
    y = NULL
    tdist <- rt(n = n, df = x)
    tdist <- as.data.frame(tdist)
    ggplot(tdist, aes(x=tdist)) +
      geom_histogram(color="darkblue", fill="lightblue", binwidth = b) +
      theme_economist() +
      scale_color_economist() +
      ggtitle("Random T Distribution Histogram") +
      xlab(paste(n, "Samples in", b, "Bins"))
  } else if (d == "f") {
    fdist <- rf(n = n, df1 = x, df2 = y)
    fdist <- as.data.frame(fdist)
    ggplot(fdist, aes(x=fdist)) +
      geom_histogram(color="darkblue", fill="lightblue", binwidth = b) +
      theme_economist() +
      scale_color_economist() +
      ggtitle("Random F Distribution Histogram") +
      xlab(paste(n, "Samples in", b, "Bins"))
  }  else if (d == "b") {
    binom <- rbinom(n = n, size = x, prob = y/100)
    binom <- as.data.frame(binom)
    ggplot(binom, aes(x=binom)) +
      geom_histogram(color="darkblue", fill="lightblue", binwidth = b) +
      theme_economist() +
      scale_color_economist() +
      ggtitle("Random Binomial Distribution Histogram") +
      xlab(paste(n, "Samples in", b, "Bins"))
  } else {
    stop(paste0("distribution is not normal (\"n\"), t (\"t\"), F (\"f\"), Binomial = (\"b\")"))
  }
}
