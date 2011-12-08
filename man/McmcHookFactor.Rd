\name{McmcHookFactor}
\alias{McmcHookFactor}
\title{Hook to Clean-up MCMC Factor Object...}
\usage{McmcHookFactor(obj, model.call, zelig.call, seed, ...)}
\description{Hook to Clean-up MCMC Factor Object}
\details{This method gives valid methods to the resulting MCMC object so that it can
be used with Zelig.}
\note{This function is used internally by the ZeligBayesian package.}
\value{an object useable by Zelig}
\author{Olivia Lau, Kosuke Imai, Gary King and Matt Owen}
\arguments{\item{obj}{the fitted model object (in this case a \code{mcmc} object.}
\item{model.call}{the call made to the external model}
\item{zelig.call}{the actual call to zelig itself}
\item{...}{ignored parameters}}
