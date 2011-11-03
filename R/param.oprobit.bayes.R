#' Simulate Parameters for the Bayesian Logistic Regression
#'
#' @note Both the \code{param} and \code{sim} method for Bayesian regressions
#' seem to ignore the \code{num} parameter.
#' This method simulates parameters for the Bayesian Ordianal Probit Regression
#' (oprobit.bayes).
#' @param obj a zelig object
#' @param num an integer specifying the number of simulations to compute
#' @param ... ignored parameters
#' @return a list specifying link, link-inverse, random samples, and ancillary
#' parameters
#' @S3method param oprobit.bayes
#' @export
param.oprobit.bayes <- function(obj, num=1000, ...) {

  # Produce the model matrix in order to get all terms (explicit and implicit)
  # from the regression model.
  mat <- model.matrix(obj$result, data=obj$data)

  # Response Terms
  p <- ncol(mat)

  # All coefficients
  coefficients <- coef(obj)

  # Coefficients for predictor variables
  beta <- coefficients[, 1:p]

  # Middle values of "gamma" matrix
  mid.gamma <- coefficients[, -(1:p)]

  # ...
  level <- ncol(coefficients) - p + 2


  # Initialize the "gamma" parameters
  gamma <- matrix(NA, nrow(coefficients), level + 1)

  # The first, second and last values are fixed
  gamma[, 1] <- -Inf
  gamma[, 2] <- 0
  gamma[, ncol(gamma)] <- Inf

  # All others are determined by the coef-matrix (now stored in mid.gamma)
  if (ncol(gamma) > 3)
    gamma[, 3:(ncol(gamma)-1)] <- mid.gamma

  # return
  list(
       simulations = beta,
       alpha   = gamma,
       linkinv = NULL
       )
}
