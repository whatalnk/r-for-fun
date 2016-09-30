
factorial(10) / (factorial(3) * factorial(7))

choose(10, 3)

choose(10, 3) * 0.4^3 * 0.6^7

dbinom(3, 10, 0.4)

dbinom(0:10, 10, 0.5)

library(ggplot2)

library(pipeR)

options(repr.plot.width = 4, repr.plot.height = 4)

library(Cairo)

Cairo(type = "raster")
data.frame(x = c(0:10), y = dbinom(0:10, 10, 0.5)) %>>% 
    ggplot(aes(x = as.factor(x), y = y)) + 
        geom_bar(stat="identity") + 
        theme_bw() + 
        xlab("表の回数") + ylab("確率") + 
        theme(axis.title = element_text("IPAexGothic"))
dev.off()

binom.test(2, 10, 0.5)

binom.test(1, 10, 0.5)

binom.test(20, 100, 0.5)

x <- c(0:100) / 100
y <- sapply(x, function(t){
    binom.test(4, 10, t)$p.value
})
data.frame(x = x, y = y) %>>% 
    ggplot(aes(x = x, y = y)) + 
    geom_point(shape = 16) + 
    theme_bw() + 
    xlab(expression(italic(theta))) + 
    ylab(expression(italic("p")))

uniroot(function(t){
    binom.test(4, 10, t)$p.value - 0.05
}, c(0.1, 0.2))

uniroot(function(t){
    binom.test(4, 10, t)$p.value - 0.05
}, c(0.6, 0.8))

binom.test(4, 10)

library(exactci)

binom.exact(4, 10, tsmethod = "minlike")
