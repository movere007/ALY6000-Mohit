getwd()
print("Mohit Patel")
library(FSA)
library(FSAdata)
library(magrittr)
library(dplyr)
install.packages("tidyverse")
install.packages(c("tidyr", "plyr"))
library(tidyverse)
library(tidyr)
library(plyr)
Bio <-read.csv("1.csv", header= TRUE, sep=",")
head(Bio)
tail(Bio)
str(Bio)
count(Bio$species)
counts<- count(Bio$species)
counts <- cbind(length(Bio$species), list(Bio$species))
levels(Bio$species)
tmp <- table(Bio$species)
tmp
tmp2 <- subset(Bio, select=species)
tmp2
w <- table(Bio$species)
w
class(w)
t=as.data.frame(w)
t
class(t)
table(t$Freq)
cSpec <-table(Bio$species)
cSpec
class(cSpec)
cSpecPct <- prop.table(table(Bio$species))
cSpecPct*100
cSpecPct <- cSpecPct*100
class(cSpecPct)
u=as.data.frame(cSpecPct)
u
class(u)
barplot(cSpec, ylab =" COUNTS", col="LightGreen", main="Fish Count", las=2, cex.axis=1.6)
barplot(cSpecPct/100, ylim=c(0,4), main = "Fish Relative Frequency", col.axis="lightblue", las=2)
d <-u[order(-u$Freq),]
names(d)[names(d) == "Var1"] <- "Species"
names(d)[ names(d)=="Freq"] <- "RelFreq"
d
d < - transform(d, cumfreq = cumsum(RelFreq))
d
Dcount <- as.data.frame(t[order(-t$Freq),])
d <- transform(d, count=Dcount$Freq)
d
d <- transform(d, cumcounts=cumsum(count))
d
def_par <- par() 
par(mar=c(10,5,5,8))
pc <-barplot(d$count, axes = F,width=1, spacing = 0.15,
                ylim = c(0,3.05*max(d$count, na.rm = TRUE)),
                ylab = "Cumulative Counts",
             cex.axis = 1.7,
                names.arg = d$Species,
                main = "Species Pareto", las = 2)
lines(pc, d$cumcounts, type = "b",cex.axis= 0.7, pch = 19, col="cyan4")
box(col= "grey62")
axis(side = 2, at = c(0, d$cumcounts), tick = TRUE, line = NA, col.axis = "grey62", col.ticks =  "grey62", cex.axis = 0.8, las=2)
axis(side = 4, at = c(0, d$cumcounts), labels = paste(c(0, round(d$cumfreq * 100)) ,"%",sep=""), 
     las = 2, col.axis = "cyan4", col = "cyan4", cex.axis = 0.8)
pc <-barplot(d$count, width = 1, space = 0.15,
                border = NA, axes = F,
                ylim = c(0, 3.05 * max(d$count, na.rm = TRUE)),
                ylab = "Cumulative Counts",
                  cex.axis = 1.7,
                names.arg = d$Species,
                main = "PATEL",
                  las = 2)




