#' Interface between the Zelig Model factor.bayes and 
#' the Pre-existing Model-fitting Method
#' @param formula a formula
#' @param ... additonal parameters
#' @param data a data.frame 
#' @return a list specifying '.function'
#' @export
zelig2factor.bayes <- function (formula, ..., data) {
  list(
       .function = "",
       formula = formula,
       data = data
       )
}
