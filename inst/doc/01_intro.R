## ---- eval=FALSE---------------------------------------------------------
## help.start()

## ---- eval=FALSE---------------------------------------------------------
## >

## ---- eval=FALSE---------------------------------------------------------
## help()

## ---- eval=FALSE---------------------------------------------------------
## hepl()
## help() # Use up arrow and fix

## ------------------------------------------------------------------------
a = 1 
b = 2
a+b

## ------------------------------------------------------------------------
x = 1:10
y = rep(c(1,2), each=5)
m = lm(y~x)
s = summary(m)

## ---- eval=FALSE---------------------------------------------------------
## x
## y
## m
## s
## s$r.squared

## ------------------------------------------------------------------------
1+2
1-2
1/2
1*2

## ------------------------------------------------------------------------
(1+3)*2 + 100^2  # standard order of operations
sin(2*pi)        # the result is in scientific notation, i.e. -2.449294 x 10^-16 
sqrt(4)
10^2
log(10)          # the default is base e
log(10, base=10)

## ------------------------------------------------------------------------
a = 1
b = 2
a+b
a-b
a/b
a*b

## ------------------------------------------------------------------------
a <- 1
2 -> b
c = 3  # is the same as <-

## ------------------------------------------------------------------------
a
b
c

## ------------------------------------------------------------------------
population = 1000
number_infected = 200
deaths = 3

death_rate = deaths / number_infected
attack_rate = number_infected / population

death_rate
attack_rate

## ---- echo=FALSE---------------------------------------------------------
# Find the probability the individual has the disease if 
# specificity is 0.95, sensitivity is 0.99, and prevalence is 0.001

## ---- eval=FALSE---------------------------------------------------------
## setwd(choose.dir(getwd()))

## ---- eval=FALSE---------------------------------------------------------
## install.packages('dplyr')

## ---- eval=FALSE---------------------------------------------------------
## library('dplyr')

## ---- warning=FALSE------------------------------------------------------
library('ISDSWorkshop')

## ---- warning=FALSE------------------------------------------------------
workshop()

## ------------------------------------------------------------------------
# This is just a comment. 
1+1 # So is this
# 1+2

## ------------------------------------------------------------------------
GI = read.csv("GI.csv")

## ---- tidy=FALSE---------------------------------------------------------
GI2 = read.table("GI.csv", 
                 header=TRUE, # There is a header.
                 sep=",")     # The column delimiter is a comma.

## ------------------------------------------------------------------------
all.equal(GI, GI2)

## ---- eval=FALSE---------------------------------------------------------
## install.packages("readr") # run this command if the readr package is not installed
## library('readr')
## GI <- read_csv("GI.csv")

## ---- eval=FALSE---------------------------------------------------------
## install.packages('xlsx')
## library('xlsx')
## d = read.xlsx("filename.xlsx", sheetIndex=1) # or
## d = read.xlsx("filename.xlsx", sheetName="sheetName")

## ---- eval=FALSE---------------------------------------------------------
## install.packages('haven')
## library('haven')
## d = read_sas('filename.sas7bdat')

## ---- eval=FALSE---------------------------------------------------------
## library('dplyr')
## my_db <- src_sqlite("my_db.sqlite3", create = T)

## ---- eval=FALSE---------------------------------------------------------
## install.packages("RODBC")
## library('RODBC')
## 
## # RODBC Example
## # import 2 tables (Crime and Punishment) from a DBMS
## # into R data frames (and call them crimedat and pundat)
## 
## library(RODBC)
## myconn <-odbcConnect("mydsn", uid="Rob", pwd="aardvark")
## crimedat <- sqlFetch(myconn, "Crime")
## pundat <- sqlQuery(myconn, "select * from Punishment")
## close(myconn)

## ------------------------------------------------------------------------
dim(GI)
nrow(GI)
ncol(GI)
names(GI) # column names
head(GI, n=5) # first 5 rows of the data.frame
tail(GI, n=5) # last5 rows of the data.frame

## ---- eval=FALSE, tidy=FALSE---------------------------------------------
## d = read.table("filename.csv", # Make sure to change filename>to your filename and
##                                # make sure you use the extension, e.g. .csv.
##                header = TRUE,  # If there is no header column, change TRUE to FALSE.
##                sep =",",       # The column delimiter is a comma.
##                skip = 0        # Skip this many lines before starting to read the file
##                )

## ---- eval=FALSE---------------------------------------------------------
## ?read.table

## ---- echo=FALSE---------------------------------------------------------
# Read in the csv file

## ------------------------------------------------------------------------
summary(GI)

## ---- eval=FALSE---------------------------------------------------------
## GI$age     # or
## GI[,'age'] # or
## GI[,5]     # since age is the 5th column

## ------------------------------------------------------------------------
min(GI$age)
max(GI$age)
mean(GI$age)
median(GI$age)
quantile(GI$age, c(.025,.25,.5,.75,.975))
summary(GI$age)

## ------------------------------------------------------------------------
table(GI$gender)

## ------------------------------------------------------------------------
summary(GI$gender)

## ------------------------------------------------------------------------
table(GI$facility)
summary(GI$facility)

## ------------------------------------------------------------------------
library('dplyr')

GI_37 <- GI %>% 
  filter(facility == 37) # Notice the double equal sign!

nrow(GI_37)              # Number of rows (observations) in the new data set

## ------------------------------------------------------------------------
GI_AbdPain <- GI %>% 
  filter(chief_complaint == "Abd Pain") # Need to quote non-numeric variable level

nrow(GI_AbdPain)

## ------------------------------------------------------------------------
GI_37a = GI[GI$facility==37,]
all.equal(GI_37, GI_37a)

GI_37b = subset(GI, facility==37)
all.equal(GI_37, GI_37b)


GI_AbdPain1 = GI[GI$chief_complaint == "Abd Pain",]
all.equal(GI_AbdPain, GI_AbdPain1)

GI_AbdPain2 = subset(GI, chief_complaint == "Abd Pain")
all.equal(GI_AbdPain, GI_AbdPain2)

## ---- eval=FALSE---------------------------------------------------------
## GI %>% filter(age <   5)
## GI %>% filter(age >= 60)
## GI %>% filter(chief_complaint %in% c("Abd Pain","ABD PAIN")) # Abd Pain or ABD PAIN
## GI %>% filter(tolower(chief_complaint) == "abd pain")        # any capitalization pattern
## GI %>% filter(!(facility %in% c(37,66)))                     # facility is NOT 37 or 66

## ------------------------------------------------------------------------
summary(GI_37$age)
summary(GI_AbdPain$age)

## ---- echo=FALSE---------------------------------------------------------
# Find the min, max, mean, and median age for zipcode 20032.

## ------------------------------------------------------------------------
hist(GI$age)

## ------------------------------------------------------------------------
hist(GI$age, 50)

## ------------------------------------------------------------------------
hist(GI$age, 0:158)

## ------------------------------------------------------------------------
boxplot(GI$age)

## ------------------------------------------------------------------------
boxplot(age ~ facility, data  = GI, xlab = "Facility", ylab = "Age")

## ------------------------------------------------------------------------
GI$date = as.Date(GI$date)
plot(age ~ date, data = GI)

## ------------------------------------------------------------------------
counts = table(GI$facility)
barplot(counts, 
        xlab = "Facility", 
        ylab = "Count", 
        main = "Number of observations at each facility")

## ---- echo=FALSE---------------------------------------------------------
# Construct a histogram for age at facility 37.

# Construct a boxplot for age at facility 37. 

## ---- echo=FALSE---------------------------------------------------------
# Construct a bar chart for the zipcode at facility 37.

## ---- eval=FALSE---------------------------------------------------------
## ?mean

## ---- eval=FALSE---------------------------------------------------------
## help.search("mean")

