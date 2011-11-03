library(ZeligBayesian)

data(sanction)

sanction$ncost <- factor(sanction$ncost, ordered = TRUE,
                         levels = c("net gain", "little effect", 
                         "modest loss", "major loss"))


z.out <- zelig(
               ncost ~ mil + coop,
               model = "oprobit.bayes",
               data = sanction, verbose=FALSE
               )

x.out <- setx(z.out)
x1.out <- setx(z.out, coop=3)

s.out <- sim(z.out, x = x.out, num=10000)

summary(z.out)
summary(s.out)
