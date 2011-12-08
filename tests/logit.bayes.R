library(ZeligBayesian)

data(turnout)

z.out <- zelig(
               vote ~ race + educate,
               model = "logit.bayes",
               verbose = FALSE,
               data  = turnout
               )

summary(z.out)

x.out <- setx(z.out, age=65)
x1.out <- setx(z.out, age=10, educate=5)

s.out <- sim(z.out, x.out, x1.out)

summary(s.out)

# YOU NEVER WAIT SO LONG!
