#' Interface between the Zelig Model mlogit.bayes and 
#' the Pre-existing Model-fitting Method
#' @param formula a formula
#' @param burnin a parameter corresponding to the 'burnin' paramater for the
#' MCMCmnl function
#' @param mcmc a parameter corresponding to the 'mcmc' paramater for the
#' MCMCmnl function
#' @param verbose a parameter corresponding to the 'verbose' paramater for the
#' MCMCmnl function
#' @param ... additonal parameters
#' @param data a data.frame 
#' @return a list specifying '.function'
#' @export
zelig2mlogit.bayes <- function (
                               formula, 
                               burnin = 1000, mcmc = 10000, 
                               verbose=0, 
                               ..., 
                               data
                               ) {
  list(
       .function = "MCMCmnl",
       .hook = "MCMChook",

       formula = formula,
       data   = data,
       burnin = burnin,
       mcmc   = mcmc,
       verbose= verbose,

       # Most parameters can be simply passed forward
       ...
       )
}
