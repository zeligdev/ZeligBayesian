#' Interface between the Zelig Model factor.bayes and 
#' the Pre-existing Model-fitting Method
#' @param formula a formula
#' @param ... additonal parameters
#' @param data a data.frame 
#' @return a list specifying '.function'
#' @export
zelig2factor.bayes <- function (
                                formula, 
                                factors = 2,
                                burnin = 1000, mcmc = 20000, 
                                verbose=0, 
                                ..., 
                                data
                                ) {
  if (missing(verbose))
    verbose <- round((mcmc + burnin)/10)

  if (factors < 2)
    stop("Number of factors needs to be at least 2")

  x <- as.matrix(model.response(model.frame(formula, data=data, na.action=NULL)))

  list(
       .function = "MCMCfactanal",
       .hook = "McmcHookFactor",

       formula = formula,
       x = x,
       burnin = burnin,
       mcmc   = mcmc,
       verbose= verbose,
       data   = data,

       ...
       )
}
