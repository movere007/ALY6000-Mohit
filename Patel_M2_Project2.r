print('Plotting Basics: Patel')
install.packages("FSA")
install.packages("FSAdata")
install.packages("magrittr")
install.packages("dplyr")
install.packages("plotrix")
install.packages("ggplot2")
install.packages("moments")
library(FSA)
library(FSAdata)
library(magrittr)
library(dplyr)
library(plotrix)
library(ggplot2)
library(moments)
help("FSAdata")
force(BullTroutRML2)
head(BullTroutRML2, 3)
tail(BullTrouRML2, 3)
tail(BullTroutRML2, 3)
BullTrout<- subset (BullTroutRML2, BullTroutRML2$lake=="Harrison")
View(BullTrout)
head(BullTrout, 5)
tail(BullTrout, 5)
str(BullTrout)
summary(BullTrout)
x <- BullTrout$fl
y <- BullTrout$age
era<- BullTrout$era
plot(x,y, xlim=c(0,500), ylim=c(0,15), main="Plot 1: Harrison Lake Trout ", xlab="Fork Length (mm)", ylab="Age (yrs)",pch=16)
hist(y, xlim=c(0,15), ylim=c(0,15), main="Plot 2: Harrison Fish Age Distribution",col.main="cadetblue", xlab="Age (yrs)", ylab="Frequency", col="cadetblue", freq=TRUE)
plot(x,y, xlim=c(0,500),ylim=c(0,15), main="Plot 3: Harrison Density Shaded by Era", xlab="Fork Length(mm)", ylab="Age (yrs)",col=c("green","forestgreen") ,pch=19)
legend(x="topleft", legend=paste(levels(BullTrout$era)), col=c("green","forestgreen"), pch=19)
tmp <-c(head(BullTrout,3), tail(BullTrout,3))
tmp$era
pchs <-c("+","x")
cols <-c("red","gray60")
tmp$era = as.numeric(tmp$era)
initialize(cols,tmp$era)
plot(x,y, xlim=c(0,500), ylim=c(0,15), main="Plot 4:Symbol & Color by Era", xlab="Fork Length(mm)", ylab="Age (yrs)", pch=pchs, col=cols)
plot(x,y, xlim=c(0,500), ylim=c(0,15), main="Plot 5: Regression Overlay ", xlab="Age (yrs)", ylab="Fork Length (mm)",pch=pch, col= cols, abline(lm(y~x)))
plot(x,y, xlim=c(0,500), ylim=c(0,15), main="Plot 6: Legend Overlay ", xlab="Age (yrs)", ylab="Fork Length (mm)",pch=pch, col= cols, abline(lm(y~x)))
legend(x="topleft", legend=paste(levels(BullTrout$era)),col=cols , pch=pchs)





