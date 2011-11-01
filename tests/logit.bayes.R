library(ZeligBayesian)

data(turnout)

z.out <- zelig(
               vote ~ race + educate,
               model = "logit.bayes",
               verbose = FALSE,
               data  = turnout
               )

x.out <- setx(z.out, age=65)

s.out <- sim(z.out, x.out)


# YOU NEVER WAIT SO LONG!
