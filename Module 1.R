name <-"Mohit Patel"
name
install.packages("vcd")
library(vcd)
sales <-c(7,11,15,20,19,11,18,10,6,22)
temp <-c(69,81,77,84,80,97,87,70,65,90)
plot(sales,temp)
mean(temp)
sales <-sales[-3]
sales
sales <-c(c(7,11),16,c(20,19,11,18,10,6,22))
sales
names <-c("Tom","Dick","Harry")
names
y <-matrix(1:10, nrow=5, ncol=2)
y
icScales <-data.frame(sales,temp)
icScales
summary(icScales)
marks <-read.csv("Student.csv", header= TRUE, sep=",")
names(marks)
