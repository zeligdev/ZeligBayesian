library(ZeligBayesian)

data(turnout)

z.out <- zelig(
               vote ~ race + educate,
               model = "probit.bayes",
               verbose = FALSE,
               data  = turnout
               )

x.out <- setx(z.out, age=65)
x1.out <- setx(z.out, age=10, educate=5)

s.out <- sim(z.out, x.out, x1.out)

summary(s.out)

# YOU NEVER WAIT SO LONG!
