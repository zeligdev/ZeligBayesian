#' Compute Quantities of Interest for the Zelig Model oprobit.bayes
#' @param obj a zelig object
#' @param x a setx object
#' @param x1 an optional setx object
#' @param y ...
#' @param num an integer specifying the number of simulations to compute
#' @param param a parameters object
#' @return a list of key-value pairs specifying pairing titles of quantities of
#' interest with their simulations
#' @export
qi.oprobit.bayes <- function(obj, x=NULL, x1=NULL, y=NULL, num=1000, param=NULL)
{
  labels <- levels(model.response(model.frame(obj$result)))

  res1 <- compute.oprobit.bayes(x, param, labels)
  res2 <- compute.oprobit.bayes(x1, param, labels)

  # 
  list(
       "Expected Value: E(Y|X)" = res1$ev,
       "Predicted Value: Y|X"   = res1$pv,
       "Expected Value (for X1): E(Y|X1)" = res2$ev,
       "Predicted Value (for X1): Y|X1"   = res2$pv,
       "First Differences: E(Y|X1) - E(Y|X)" = res2$ev - res1$ev
       )
}


# Helper function used to generate expected values
compute.oprobit.bayes <- function (x, param, labels) {
  # If either of the parameters are invalid,
  # Then return NA for both qi's
  if (is.null(x) || is.na(x) || is.null(param))
    return(list(ev=NA, pv=NA))


  # Extract simulated parameters
  beta <- coef(param)
  gamma <- alpha(param)

  # x is implicitly cast into a matrix
  eta <- beta %*% t(x)

  # **TODO: Sort out sizes of matrices for these things.
  ev <- array(NA, c(nrow(eta), ncol(gamma) - 1, ncol(eta)))
  pv <- matrix(NA, nrow(eta), ncol(eta))

  # Compute Expected Values
  # ***********************
  # Note that the inverse link function is:
  #   pnorm(gamma[, j+1]-eta) - pnorm(gamma[, j]-eta)
  for (j in 1:(ncol(gamma)-1)) {
    ev[, j, ] <- pnorm(gamma[, j+1]-eta) - pnorm(gamma[, j]-eta)
  }

  colnames(ev) <- labels


  # Compute Predicted Values
  # ************************
  for (j in 1:nrow(pv)) {
    mu <- eta[j, ]
    pv[j, ] <- as.character(cut(mu, gamma[j, ], labels=labels))
  }


  # **TODO: Update summarize to work with at most 3-dimensional arrays
  ev <- ev[, , 1]


  # Return
  list(ev = ev, pv = pv)
}
