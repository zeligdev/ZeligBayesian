#' Simulate Parameters for the Bayesian Logistic Regression
#'
#' This method simulates parameters for the Bayesian Logistic Regression
#' (logit.bayes).
#' @param obj a zelig object
#' @param num an integer specifying the number of simulations to compute
#' @param ... ignored parameters
#' @return a list specifying link, link-inverse, random samples, and ancillary
#' parameters
#' @method param logit.bayes
#' @export
param.logit.bayes <- mcmcparam
