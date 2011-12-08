#' Dummy \code{setx} Method for Bayesian Factor Regressions
#'
#' This method simply outputs an error message.
#' @param obj a "factor.bayes" MCMCZelig object
#' @param ... ignored parameters
#' @return Nothing
#' @S3method setx factor.bayes
#' @author Matt Owen \email{mowen@@iq.harvard.edu}
setx.factor.bayes <- function (obj, ...) {
  stop("setx for the \"factor.bayes\" model is currently not implemented.")
}

#' Dummy \code{sim} Method for Bayesian Factor Regressions
#'
#' This method simply outputs an error message.
#' @param obj a "factor.bayes" MCMCZelig object
#' @param ... ignored parameters
#' @return Nothing
#' @S3method sim factor.bayes
#' @author Matt Owen \email{mowen@@iq.harvard.edu}
sim.factor.bayes <- function (obj, ...) {
  stop("sim for the \"factor.bayes\" model is currently not implemented.")
}
