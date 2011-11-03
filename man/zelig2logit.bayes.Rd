\name{zelig2logit.bayes}
\alias{zelig2logit.bayes}
\title{Interface between the Zelig Model logit...}
\usage{zelig2logit.bayes(formula, burnin=1000, mcmc=10000, verbose=0, ...,
    data)}
\description{Interface between the Zelig Model logit.bayes and 
the Pre-existing Model-fitting Method}
\value{a list specifying '.function'}
\arguments{\item{formula}{a formula}
\item{burnin}{a parameter corresponding to the 'burnin' paramater for the
MCMCprobit function}
\item{mcmc}{a parameter corresponding to the 'mcmc' paramater for the
MCMCprobit function}
\item{verbose}{a parameter corresponding to the 'verbose' paramater for the
MCMCprobit function}
\item{...}{additonal parameters}
\item{data}{a data.frame}}
