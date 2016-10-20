# Contains several chunks of syntax. First is for describing and plotting scores
# on tests and essays. The next two involve combining different spreadsheets 
# to get a single file of marks.


#########################################################

library(psych)
library(ggplot2)
path <- "C:/Users/jckenned/Documents/Teaching/Completed Courses/2016_114240 OB/Class List/Grades-114240_1601_ALBN_I-Test-1637554-20160511_2251-comma_separated.csv"
path <- "C:/Users/jckenned/Documents/Teaching/2016_114326 HR/Class List/Grades-114326_1602_ALBN_I-Assessment 2 - Essay-1678290-20161009_2021-comma_separated.csv"
testMarks <- read.table(path, header=TRUE, row.names="ID.number", sep=",")
essayMarks <- read.table(path, header=TRUE, sep=",")
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

#########################################################

# I used an early list of names to note who had submitted essay. List included people
# who didn't continue in paper, and left out late enrollees. I added late enrollees to my list.
# Downloaded marking spreadsheet from Stream, which has a field for full names but not surname
# and forename. So this script uses student id to combine the two spreadsheets (in csv format).
# Before combining, I renamed the ID variable in Stream download to 'stud_code' to match list from RPS.

library(dplyr)
Roll <- read.table("C:/Users/jckenned/Documents/Teaching/2016_114240 OB/Submission - Essays/CurrentRoll.csv", header=TRUE, sep=",")
Submissions  <- read.table("C:/Users/jckenned/Documents/Teaching/2016_114240 OB/Submission - Essays/essaysubmissions.csv", header=TRUE, sep=",")
# head(Roll)
# head(Submissions)
OnTimeSubmissions <- dplyr::left_join(Roll, Submissions, by = "stud_code")
View(Roll)
View(OnTimeSubmissions)
write.table(OnTimeSubmissions, file = "C:/Users/jckenned/Documents/Teaching/2016_114240 OB/Submission - Essays/OnTimeSubmissions.csv", col.names=TRUE, row.names=FALSE, sep=",")
# ?write.table

#########################################################

# Before entering case mark for groups, I wanted to check overall marks distribution, boundary cases etc.
# I downloaded the gradebook from Stream, which had test and essay marks already in.
# I then used my N++ txt doc which had group members and names to copy into excel to create a csv file 
# containing ID, names, group number, and mark. This syntax will combine the sheets so I can
# look at final distribution etc. Then I can sort, and copy and paste case mark into a downloaded mark
# sheet from Stream for the Case assignment.
library(dplyr)
GradeBook <- read.table("C:/Users/jckenned/Documents/Teaching/2016_152761 IB/Class List/152761_1601_ALBN_I Grades.csv", header=TRUE, sep=",")
CaseMark  <- read.table("C:/Users/jckenned/Documents/Teaching/2016_152761 IB/Class List/20160617 Internal Case marks.csv", header=TRUE, sep=",")
head(GradeBook)
head(CaseMark)
AllGrades <- dplyr::left_join(GradeBook, CaseMark, by = "ID")
head(AllGrades)
write.table(AllGrades, file = "C:/Users/jckenned/Documents/Teaching/2016_152761 IB/Class List/20160617 Internal All Marks.csv", col.names=TRUE, row.names=FALSE, sep=",")
