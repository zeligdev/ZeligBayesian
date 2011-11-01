#' Compute Quantities of Interest for the Zelig Model logit.bayes
#' @param obj a zelig object
#' @param x a setx object
#' @param x1 an optional setx object
#' @param y ...
#' @param num an integer specifying the number of simulations to compute
#' @param param a parameters object
#' @return a list of key-value pairs specifying pairing titles of quantities of
#' interest with their simulations
#' @export
qi.logit.bayes <- function(obj, x=NULL, x1=NULL, y=NULL, num=1000, param=NULL) {

  # Specify model name. This is likely unnecessary
  model.name <- "logit.bayes"

  # Extract simulated parameters
  coef <- coef(param)

  # Produce the un-inversed mean values
  eta <- coef %*% t(x)



  message("Everything ended well.")
  q()



  list(
       "Expected Value: E(Y|X)" = NA
       )
}
