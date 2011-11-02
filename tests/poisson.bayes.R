library(ZeligBayesian)

data(sanction)

z.out <- zelig(
               num ~ target + coop, 
               model = "poisson.bayes",
               data = sanction, 
               verbose=TRUE
               )

x.out <- setx(z.out)
x1.out <- setx(z.out, coop=3)

s.out <- sim(z.out, x.out, x1.out)

summary(z.out)
summary(s.out)
