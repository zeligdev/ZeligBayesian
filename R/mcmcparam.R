#' Simulate Parameters of All MCMC-Zelig Object
#'
#' This method 
#' @param obj a "MCMCZelig" \code{zelig} object
#' @param num an integer specifying the number of simulations to produce for the
#' parameters
#' @param ... ignored parameters
#' @return a list representing a \code{parameters} object
#' @author Matt Owen \email{mowen@@iq.harvard.edu}
mcmcparam <- function(obj, num=1000, ...) {
  list(
       coef = coef(obj),
       linkinv = NULL
       )
}
