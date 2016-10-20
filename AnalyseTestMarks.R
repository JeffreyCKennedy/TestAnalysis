library(psych)
library(ggplot2)
# testMarks <- read.table("C:/Users/jckenned/Documents/Teaching/2015_114326 HR/Class List/Test_326_for_R_Analysis.csv", header=TRUE, row.names="ID", sep=",")
#testMarks <- read.table("C:/Users/jckenned/Documents/Teaching/2016_114240 OB/Class List/Grades-114240_1601_ALBN_I-Test-1637554-20160511_2251-comma_separated.csv", header=TRUE, row.names="ID.number", sep=",")
essayMarks <- read.table("C:/Users/jckenned/Documents/Teaching/2016_114240 OB/Class List/Grades-114240_1601_ALBN_I-Essay-1637400-20160609_0236-comma_separated.csv", header=TRUE, row.names="ID.number", sep=",")
essayMarks[essayMarks==0] <- NA # Convert 0 marks to NA
psych::describe(essayMarks$Grade)
hist(essayMarks$Grade, 8)
qplot(Grade, data = essayMarks, geom = "histogram", binwidth = 1, xlim = c(35,100), ylim = c(0,8), main="Marks Distribution", xlab = "Percent (Mark out of 100")

psych::describe(testMarks$Grade)
hist(testMarks$Grade, 8)
psych::describe(testMarks$Grade*100/60)
hist(testMarks$Grade*100/60, 8)
Percent = testMarks$Grade*100/60
qplot(Grade, data = testMarks, geom = "histogram")
qplot(Grade, data = testMarks, geom = "histogram", binwidth = 2, xlim = c(20,60), ylim = c(0,10), main="Marks Distribution", xlab = "Mark out of 60")


psych::describe(testMarks$X1a)
psych::describe(testMarks$X1b)
psych::describe(testMarks$X2)
psych::describe(testMarks$Out.of.25)
barplot(testMarks$Out.of.25)
hist(testMarks$Out.of.25, 8)

# Additional line added to test git
