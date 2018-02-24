# Introduction from UCI ConEx Datasci Course
"VTL, 2/19/18 -- 2/23/18"

## setting a specific variable
approxpi <- 355/119
approxpi
sqrt(approxpi)

## the help function
?sd

## vector basics
primes <- c(1,2,3,5,7,11)
primes
length(primes)
primes[4]  # notice that R is one-indexed
primes[c(3,4,5)]
primes[3:5]
summary(primes)

## vector manipulation
primes[which(primes<11)]
primestimes4 <- primes*4
primestimes4

## vector with strings
somenames <- c("john", "jack", "jill", "scott", "jen")
somenames

## matrices basics
matrix1 <- matrix(data=c(primes,primestimes4),nrow=2,ncol=6)
matrix1
nrow(matrix1)
ncol(matrix1)
t(matrix1) # take transpose
primestimes6 <- primes*6
matrix1 <- rbind(matrix1,primestimes6) # row bind
matrix1

## list basics
### note that lists in R can have diff types of objects unlike in python
### see: https://www.statmethods.net/input/datatypes.html
Jen <- list(gender="female",age="young",height=66,child=2,child_ages=c(3,5))
Jen

## dataframe basics
### here start from vectors
Bkballteams <- c("warriors", "spurs", "suns", "knicks", "celtics", "trailblazers")
Championshipyear <- c(2015,2013,1998,2001,2011,1995)
Jerseycolor <- c("blue", "black","orange","white","green","red")
Gameswonin2015 <- c(73,68,45,40,55,60)
Championshipwon <- c(3,1,10,2,5,1)
bkballdata <- data.frame(Bkballteams, Championshipyear, Jerseycolor, Gameswonin2015, Championshipwon)
bkballdata
### now some processing of the dataframe
summary(bkballdata)
### tell R to treat year is categorical value and not as a number
bkballdata$Championshipyear <- factor(bkballdata$Championshipyear)
summary(bkballdata)

## playing around with built in data
data() # see whole list
summary(WWWusage)
plot(WWWusage)
hist(mtcars$mpg)
ggplot(forecast(WWWusage))

## playing around with ggplot2 package
head(Indometh)
summary(Indometh)
ggplot(subset(Indometh),
       aes(x=Indometh$time,
           y=Indometh$conc,
           color=Indometh$Subject))+
  geom_point()

## how to read in data from file
getwd()
setwd("/home/victoria/Desktop/stock-market")
getwd()
winedata <- read.csv("data_files/Wine.csv")
winedata[,1:9] # print all rows' first 9 columns
### file processing to convert NAs to 0s
winedata[is.na(winedata)] <- 0
winedata[,1:9]

## read in data and build regression model
PregnancyData <- read.csv('data_files/Preg.csv')
str(PregnancyData) # check out structure
### ensure the preg and non-preg are interpreted as distinct 0 1 classes
PregnancyData$PREGNANT <- factor(PregnancyData$PREGNANT)
summary(PregnancyData$PREGNANT)
str(PregnancyData)
### logistic model building (generalized linear model)
Pregnancy.lm <- glm(PREGNANT ~ ., data=PregnancyData, family=binomial("logit"))
summary(Pregnancy.lm)

## install forecast function
#install.packages("forecast",dependencies=TRUE) # this gave me error in configuration failed
# manually install dependencies: curl, TTR, quantmod, tseries, forecast
# sudo apt-get install libcurl4-openssl-dev
'
install.packages("http://cran.cnr.berkeley.edu/src/contrib/curl_3.1.tar.gz",
                 repos=NULL, method="wget")
install.packages("http://cran.cnr.berkeley.edu/src/contrib/TTR_0.23-3.tar.gz",
                 repos=NULL, method="wget")
install.packages("http://cran.cnr.berkeley.edu/src/contrib/quantmod_0.4-12.tar.gz",
                 repos=NULL, method="wget")
install.packages("http://cran.cnr.berkeley.edu/src/contrib/tseries_0.10-43.tar.gz",
                 repos=NULL, method="wget")
install.packages("http://cran.stat.ucla.edu/src/contrib/forecast_8.2.tar.gz",
                 repos=NULL, method="wget")
'

## read in data and build forecasting model
library(forecast)
sword <- read.csv('data_files/DemandforSword.csv')
### tell R this is timeseries data starting at Jan 2010
sword.ts <- ts(sword,frequency=12,start=c(2010,1))
### plot data to explore
plot(sword.ts)
### forecast data
sword.forecast <- forecast(sword.ts)
sword.forecast
plot(sword.forecast)

## read in data and do outlier detection
PregnancyDuration <- read.csv('data_files/DurationOfPregnancy.csv')
summary(PregnancyDuration)
PregnancyDuration.IQR <- IQR(PregnancyDuration$GestationDays)
PregnancyDuration.IQR
LowerInnerFence <- 260 - 1.5*PregnancyDuration.IQR
UpperInnerFence <- 272 + 1.5*PregnancyDuration.IQR
LowerOuterFence <- 260 - 3.0*PregnancyDuration.IQR
UpperOuterFence <- 272 + 3.0*PregnancyDuration.IQR
print(c(LowerInnerFence, UpperInnerFence, LowerOuterFence, UpperOuterFence))
PregnancyDuration$GestationDays[which(PregnancyDuration$GestationDays > UpperInnerFence)]
### box plot
boxplot(PregnancyDuration$GestationDays)
### box plot with Tukey fences
boxplot(PregnancyDuration$GestationDays, range=3)
### extract data from boxplot function
boxplot(PregnancyDuration$GestationDays, range=3) $stats # print stats
boxplot(PregnancyDuration$GestationDays, range=3) $out   # print outliers
