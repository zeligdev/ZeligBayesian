#' Print Summarized MCMC-Zelig Objects
#' 
#' This function prints the summarized MCMC-Zelig objects
#' @param x a \code{summary.MCMCZelig} object
#' @param digits an integer specifying the precision of decimal numbers
#' @param ... ignored parameters
#' @return Nothing
#' @S3method print summary.MCMCZelig
print.summary.MCMCZelig <- function(x, digits=max(3, getOption("digits") - 
3), ...) {
  cat("\nCall: ") 
  print(x$call) 
  cat("\n", "Iterations = ", x$start, ":", x$end, "\n", sep = "")
  cat("Thinning interval =", x$thin, "\n")
  cat("Number of chains =", x$nchain, "\n")
  cat("Sample size per chain =", (x$end -
  x$start)/x$thin + 1, "\n")
  cat(
      "\n", 
      "Mean, standard deviation, and quantiles for marginal posterior",
      " distributions.",
      "\n"
      )
  print(round(x$summary, digits=digits))
  cat("\n")
}
