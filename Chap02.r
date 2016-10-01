
date()

sapply(c("pipeR", "dplyr", "tidyr", "ggplot2", "Cairo", "readr", "readxl", "openxlsx"), require, character.only = TRUE)

options(repr.plot.width = 4, repr.plot.height = 4)

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

pnorm(1) - pnorm(-1)

1 - 2 * pnorm(-1)

1 - 2 * pnorm(-2)

1 - 2 * pnorm(-3)

qnorm(0.95)

qnorm(0.99)

x <- read_csv("data/rika_hist.csv")
str(x)

names(x) <- c("correct", "student")

rep(x$correct, x$student) %>>% mean()

rep(x$correct, x$student) %>>% sd()

Cairo(type = "raster")
CairoFonts(regular = "IPAexGothic")
x %>>% ggplot(aes(x = correct, y = student / sum(student))) + 
    geom_bar(stat="identity", colour = "white", fill = "gray") + 
    theme_bw() + 
    scale_x_continuous(breaks = seq(0, 25, 5)) +
    scale_y_continuous(limits = c(0, 0.07), breaks = seq(0, 0.07, 0.01)) + 
    stat_function(fun = dnorm, args = list(mean = 13.37, sd = 5.74)) + 
    geom_vline(xintercept = 13.37, size = 0.3) + 
    xlab("正答数") + 
    ylab("生徒数の割合")
dev.off()

ggplot(data.frame(x = c(-3, 3)), aes(x)) + 
    stat_function(fun = dnorm) + 
    annotate(label = "Normal", geom = "text", x = 1.2, y = 0.35) + 
    stat_function(fun = dcauchy, size = 1) + 
    annotate(label = "Cauchy", geom = "text", x = 0.3, y = 0.16) + 
    scale_x_continuous(breaks = seq(-3, 3, 1)) + 
    scale_y_continuous(limits = c(0, 0.4)) + 
    theme_bw()

x <- rcauchy(1000000)

hist(x)

sort(x) %>>% head()

mean(x)

sd(x)

ggplot(data.frame(x = rnorm(1000000)), aes(x)) + 
    geom_histogram()

ggplot(data.frame(x = rnorm(1000000)^2), aes(x)) + 
    geom_histogram(aes(y = ..density..), colour = "black", fill = gray(0.8)) + 
    stat_function(fun = dchisq, args = list(df = 1)) + 
    theme_bw() + 
    scale_x_continuous(limits = c(0, 8)) + 
    scale_y_continuous(limits = c(0, 1))

ggplot(data.frame(x = rnorm(1000000)^2 + rnorm(1000000)^2), aes(x)) + 
    geom_histogram(aes(y = ..density..), colour = "black", fill = gray(0.8)) + 
    stat_function(fun = dchisq, args = list(df = 2)) + 
    theme_bw() + 
    scale_x_continuous(limits = c(0, 8)) + 
    scale_y_continuous(limits = c(0, 1))

fun.t <- function(x){
    (mean(x)-0.5)/(sd(x)/sqrt(12))
}
t <- c(1:12) %>>% 
    lapply(function(x){runif(1000000)}) %>>% 
    {do.call(rbind, (.))} %>>%
    apply(2, fun.t)

ggplot(data.frame(x = t), aes(x)) + 
    geom_histogram(aes(y = ..density..), colour = "black", fill = "gray", size = 0.1) + 
    theme_bw() + 
    scale_x_continuous(breaks =seq(-4, 4, 2), limits = c(-5, 5)) + 
    stat_function(fun = dnorm, size = 0.3, linetype = 2) + 
    stat_function(fun = dt, args = list(df = 11), size = 0.3)

ggplot(data.frame(x = c(0, 5)), aes(x)) + 
    stat_function(fun = df, args = list(df1 = 1, df2 = 10)) + 
    stat_function(fun = df, args = list(df1 = 5, df2 = 10), linetype = 2) 

devtools::session_info()
