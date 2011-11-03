#' Compute Quantities of Interest for the Zelig Model mlogit.bayes
#'
#' !!!
#' @param obj a zelig object
#' @param x a setx object
#' @param x1 an optional setx object
#' @param y ...
#' @param num an integer specifying the number of simulations to compute
#' @param param a parameters object
#' @return a list of key-value pairs specifying pairing titles of quantities of
#' interest with their simulations
#' @export
qi.mlogit.bayes <- function(obj, x=NULL, x1=NULL, y=NULL, num=1000, param=NULL)
{

  res1 <- compute.mlogit.bayes(obj, x, y, num, param)
  res2 <- compute.mlogit.bayes(obj, x1, y, num, param)

  list(
       "Expected Value: E(Y|X)" = res1$ev,
       "Predicted Value: Y|X"   = res1$pv,
       "Expected Value (for X1): E(Y|X1)" = res2$ev,
       "Predicted Value (for X1): Y|X1"   = res2$pv,
       "First Differences"   = res2$ev - res1$ev
       )
}


compute.mlogit.bayes <- function (obj, x, y, num, param) {
  # If either of the parameters are invalid,
  # Then return NA for both qi's
  if (is.null(x) || is.na(x) || is.null(param))
    return(list(ev=NA, pv=NA))

  x <- as.matrix(x)
  # x1 <- as.matrix(x1)


  resp <- model.response(model.frame(obj))

  level <- length(table(resp))
  p <- dim(model.matrix(eval(obj$result),data=eval(obj$data)))[2]
  coef <- coef(obj)
  eta <- array(NA, c(nrow(coef),level, nrow(x)))


  eta[,1,] <- matrix(0, nrow(coef), nrow(x))

  for (j in 2:level) {
    ind <- (1:p)*(level-1)-(level-j)
    eta[,j,]<- coef[,ind]%*%t(x)
  }

  eta<-exp(eta)
  ev <- array(NA, c(nrow(coef), level, nrow(x)))
  pr <- matrix(NA, nrow(coef), nrow(x))
  colnames(ev) <- rep(NA, level)

  for (k in 1:nrow(x)) {
    for (j in 1:level)
      ev[,j,k] <- eta[,j,k]/rowSums(eta[,,k])
  }

  for (j in 1:level) {
    colnames(ev)[j] <- paste("P(Y=", j, ")", sep="")
  }

  for (k in 1:nrow(x)) {             
    probs <- as.matrix(ev[,,k])
    temp <- apply(probs, 1, FUN=rmultinom, n=1, size=1)
    temp <- as.matrix(t(temp)%*%(1:nrow(temp)))
    pr <- apply(temp,2,as.character)
  }
  list(ev = ev, pv = pr)
}
