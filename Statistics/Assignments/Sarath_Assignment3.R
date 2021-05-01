
library(readxl)
require(readr)
state_nay <- read.csv("Downloads/COVID19.csv")
head(state_nay)
install.packages("tidyverse")
install.packages("readxl")
library(ggplot2)
library(moments)


getwd()
state_nay <- read.csv('C:/Users/sarath/Documents/R_workling _files_greycampus/COVID19.csv')
state_nay
library(dplyr)
new_covid_19<-state_nay [-c(1:9), ]
new_covid_19

colSums(is.na(new_covid_19))
new_covid_19

# getting the NA percentage of each column

colMeans(is.na(new_covid_19)*100)


# removing the columns with more than 5% NAs
new_covid_191 <- new_covid_19 %>%
  select(!c(4:6,8,10:15,17:19))

for (i in c(3:15,17:19)) {
  new_covid_191[,i] <- as.numeric(gsub(",","",new_covid_191[,i]))
}


head(new_covid_191)
str(new_covid_191)

# giving new column names
colnames(new_covid_19) <- c("Serial No.", "Country", "TotalCases","NewCases","TotalDeaths","NewDeaths", "TotalRecovered","NewRecovered", "ActiveCases","SeriousCritical","million_Pop_Cases", "million_Pop_Deaths", "TotalTests","million_Pop_Tests","Population", "Continent", "CaseEvery_X_PPL", "DeathEvery_X_PPL","TestEvery_X_PPL")


#plot for Total cases
hist(new_covid_19$TotalCases) # right skewed

# Total cases > Total Recovery > Total Deaths
boxplot(cbind(new_covid_19$TotalCases, new_covid_19$TotalRecovered, 
              new_covid_19$TotalDeaths ), main = 'Plots for cases, recovery and deaths.', 
        names = c('Total Cases', 'Total Recovery', 'Total deaths'))


#3.2 Relation between cases and population (Not able to understand it)
ggplot(new_covid_19, aes(TotalCases, Population, colour = Continent)) + geom_point()



# 3.3. Create a plot to examine the correlation between Tot Cases/1M pop and total population.
new_covid_19 <- new_covid_19 %>%
  mutate(Cases_Pop = (TotalCases/million_Pop_Cases)%/% 1)

ggplot(new_covid_19, aes(Cases_Pop, Population)) + geom_point()



# 3.4 Which column do you feel is better for comparison purposes, total cases or TotCases/1M pop.

y <- cbind(new_covid_19$TotalCases, new_covid_19$Cases_Pop)
y

#  total cases are better because there are no NA values, and the numbers are not complex




## 3.5. Create a plot to examine the correlation between total cases and total death.
ggplot(new_covid_19, aes(TotalCases, TotalDeaths)) + geom_point()
#  deaths are more when the cases are high




## 3.6. Create a plot to examine the correlation between total cases and Deaths/1M pop. Explain the figure. 
# Which column is more suitable to compare the result, total death or Death/1Mpop?
new_covid_19 <- new_covid_19 %>%
  mutate(Deaths_Pop = (TotalCases/million_Pop_Deaths)%/% 1)

ggplot(new_covid_19, aes(TotalCases, Deaths_Pop)) + geom_point()


y <- cbind(new_covid_19$TotalCases, new_covid_19$Deaths_Pop)
y

# Total cases 

str(new_covid_19)







## 3. 7. Compare Tot Cases/1M pop by continent, and explain your result. 
ggplot(new_covid_19, aes(x = Continent, y = Cases_Pop, fill = Continent)) + geom_bar(position = 'dodge', stat = 'identity')
# Asia is having the highest ratio of Cases/1M pop






# 3.8.Compare Deaths/1M pop by continent, and explain your result. 
ggplot(new_covid_19, aes(x = Continent, y = Deaths_Pop, fill = Continent)) + geom_bar(position = 'dodge', stat = 'identity')
#Again Asia is having the highest ratio of Deaths/1M pop








# 3. 9. Which country is best among testing the COVID19 and which country is worst? There are two columns total test vs. test/M. Choose appropriate column. 
head(new_covid_19)
summary(new_covid_19$million_Pop_Tests)

new_covid_19%>%
  filter(million_Pop_Tests == c(575, 5540672))%>%
  select(2:2)








# 3. 10. Compare your COVID19 test results by continent? There are two columns total test vs test/M. Choose appropriate column. 
new_covid_19%>%
  filter(million_Pop_Tests == c(575, 5540672))%>%
  select(16:16)





# 3. 11. Check if Tests/1M pop is skewed or normally distributed.
skewness(new_covid_19$million_Pop_Tests)
summary(new_covid_19$million_Pop_Tests)
#As mean is greater than median it is right skewed
hist(new_covid_19$million_Pop_Tests)



