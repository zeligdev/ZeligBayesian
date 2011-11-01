#' Hook to Clean-up MCMC Objects
#'
#' This method gives valid methods to the resulting MCMC object so that it can
#' be used with Zelig.
#' @note This function is used internally by the ZeligBayesian package.
#' @param obj the fitted model object (in this case a \code{mcmc} object.
#' @param model.call the call made to the external model
#' @param zelig.call the actual call to zelig itself
#' @param ... ignored parameters
#' @return an object useable by Zelig
#' @author Olivia Lau, Kosuke Imai, Gary King and Matt Owen
#' @export
MCMChook <- function (obj, model.call, zelig.call, seed=NULL, ...)
{

  # Create a new object
  res <- list()

  # Add the bare necessities for a zelig object
  res$coefficients <- obj
  res$formula <- zelig.call$formula
  res$data <- zelig.call$data
  res$model <- model.frame(
                           eval(res$formula),
                           data = eval(res$data)
                           )
  res$terms <- attr(res$model, "terms")
  res$call <- model.call

  # Ensure that a "seed" element exists
  res$seed <- if (is.null(seed))
    NA
  else
    seed

  attr(res$coefficients, "call") <- NULL
  class(res) <- c(zelig.call$model, "MCMCZelig")

  res
}
