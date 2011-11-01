\name{param.probit.bayes}
\alias{param.probit.bayes}
\title{Extract Samples from a Distribution in Order to Pass Them to the qi Function...}
\usage{param.probit.bayes(obj, num=1000, ...)}
\description{Extract Samples from a Distribution in Order to Pass Them to the \code{qi} Function
(this is primarily a helper function for the probit.bayes model)}
\value{a list specifying link, link-inverse, random samples, and ancillary parameters}
\arguments{\item{obj}{a zelig object}
\item{num}{an integer specifying the number of simulations to compute}
\item{...}{additional parameters}}
