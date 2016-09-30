
123 + 456

123 * 456 - 987 / (654 + 321)

pi

print(pi)

print(pi, digits = 16)

x <- 12345
x

print(pi)
pi <- 3
print(pi)
rm(pi)
print(pi)

exp(1)

height <- c(168.5, 172.8, 159.0)
weight <- c(69.5, 75.0, 56.5)

weight / (height / 100)^2

library(pipeR)

(weight / (height / 100)^2) %>>% round

(weight / (height / 100)^2) %>>% round(1)

X <- data.frame(height, weight)
X

X$height

X$sex <- c("M", "M", "F")
X

X$BMI <- with(weight / (height / 100)^2, data = X) %>>% round(0)
X

dir(".")

write.csv(X, "X.csv", quote = FALSE, row.names = FALSE, fileEncoding = "UTF-8", eol = "\r\n")

dir(".")

XX <- read.csv("X.csv")
XX

XXX <- read.csv("http://okumuralab.org/~okumura/stat/data/coal.csv")
str(XXX)

library(ggplot2)

options(repr.plot.height = 4, repr.plot.width = 4)

x <- rnorm(1000000)

hist(x)

library("Cairo")

Cairo(type = "raster")
CairoFonts(regular = "IPAexGothic") # Mac
ggplot(data.frame(x = x), aes(x = x)) + 
    geom_histogram(binwidth = 0.5, boundary = 0.5, fill = "gray", colour = "black") + 
    theme_bw() + 
    theme(plot.title = element_text(family = "IPAexGothic")) + # Win
    scale_x_continuous(breaks = seq(-4, 4, 2)) + 
    scale_y_continuous(labels = scales::comma, breaks = c(50000, 150000)) + 
    ylab("Frequency") + 
    labs(title = "ヒストグラムの例")
dev.off()

library(readxl)

d <- read_excel("test.xlsx")
str(d)

print(d)

devtools::session_info()
