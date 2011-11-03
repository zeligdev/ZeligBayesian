library(ZeligBayesian)

data(mexico)

z.out <- zelig(
               vote88 ~ pristr + othcok + othsocok,
               model = "mlogit.bayes", 
               data = mexico
               )

x.out <- setx(z.out)

s.out <- sim(z.out, x = x.out)

summary(z.out)
summary(s.out)
