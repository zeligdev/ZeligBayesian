library(ZeligBayesian)
## Attaching the example dataset:
data(swiss)
names(swiss) <- c("Fert","Agr","Exam","Educ","Cath","InfMort")

z.out <- zelig(cbind(Agr,Exam,Educ,Cath,InfMort)~NULL, 
	       model="factor.bayes",
               data=swiss, factors=2,
               lambda.constraints=list(Exam=list(1,"+"),
                                 Exam=list(2,"-"), Educ=c(2,0),
                                 InfMort=c(1,0)),
               verbose=TRUE, a0=1, b0=0.15,
               burnin=5000, mcmc=10000)

## Checking for convergence before summarizing the estimates:
geweke.diag(coef(z.out))
heidel.diag(coef(z.out))
raftery.diag(coef(z.out))

## summarizing the output
summary(z.out)

# These methods should not work.
#setx(z.out)
#sim(z.out)
