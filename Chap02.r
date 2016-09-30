
X <- c(0, 7, 8, 9, 100)
mean(X)

Y <- c(0, 7, 8, NA, 0/0)
Y

mean(Y)

mean(Y, na.rm = TRUE)

mean(X, trim = 0.2)

mean(X[2:4])

median(X)

x <- 1:5
var(x)

apply(combn(c(1:5), 4), 2, var)

library(pipeR)

apply(combn(c(1:5), 4), 2, var) %>>% mean()

varp <- function(x){var(x) * (length(x) - 1) / length(x)}

varp(x)

var(x)

x <- 1:10
sd(x)

x <- 1:9
IQR(x)

quantile(x)

fivenum(x)

y <- c(1, 2, 4, 8, 16, 32)
IQR(y)

quantile(y)

fivenum(y)

runif(1)

runif(10)

library(ggplot2)

options(repr.plot.width = 4, repr.plot.height = 4)

X <- runif(1000000) - 0.5
data.frame(x = X) %>>% 
    ggplot(aes(x = x, y = ..density..)) + 
        geom_histogram(bins = 50, fill = "gray", colour = "white") + 
        theme_bw() + 
        scale_x_continuous(limits = c(-2.1, 2.1))

X <- (runif(1000000) - 0.5) + (runif(1000000) - 0.5)
data.frame(x = X) %>>% 
    ggplot(aes(x = x, y = ..density..)) + 
        geom_histogram(bins = 50, fill = "gray", colour = "white") + 
        theme_bw() + 
        scale_x_continuous(limits = c(-2.1, 2.1))

X <- (runif(1000000) - 0.5) + (runif(1000000) - 0.5) + (runif(1000000) - 0.5)
data.frame(x = X) %>>% 
    ggplot(aes(x = x, y = ..density..)) + 
        geom_histogram(bins = 50, fill = "gray", colour = "white") + 
        theme_bw() + 
        scale_x_continuous(limits = c(-2.1, 2.1))

c(1:12) %>>% 
    lapply(function(x){
        runif(10) - 0.5}
    ) %>>% 
    {do.call(rbind, (.))} %>>%
    apply(2, sum)

X <- c(1:12) %>>% 
        lapply(function(x){
            runif(1000000) - 0.5}
        ) %>>% 
        {do.call(rbind, (.))} %>>%
        apply(2, sum)

data.frame(x = X) %>>% 
    ggplot(aes(x)) + 
        geom_histogram(aes(y = ..density..), bins = 50, fill = "gray", colour = "white") + 
        theme_bw() + 
        scale_x_continuous(limits = c(-5, 5)) + 
        stat_function(fun = dnorm)

dnorm(1)

(1 / sqrt(2 * pi)) * exp(-1^2 / 2)

integrate(function(x){exp(-x^2/2)}, -Inf, Inf)

sqrt(2 * pi)
