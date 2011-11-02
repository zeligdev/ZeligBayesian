#' Interface between the Zelig Model normal.bayes and 
#' the Pre-existing Model-fitting Method
#' @param formula a formula
#' @param ... additonal parameters
#' @param data a data.frame 
#' @return a list specifying '.function'
#' @export
zelig2normal.bayes <- function (
                               formula, 
                               burnin = 1000, mcmc = 10000, 
                               verbose= 0, 
                               ..., 
                               data
                               ) {
  list(
       .function = "MCMCregress",
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
