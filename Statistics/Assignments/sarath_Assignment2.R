#Question 1: The final score of the World Cup finals of football is France  4 
#and Croatia 2. Please use a control structure to print the results as 
#Team ---- Wins -----.

C_score = 2
F_score = 4

if (C_score > F_score){
  print("Team Croatia Wins")
}else{
  print("Team France Wins")
}

#Question 2: The mtcars data set has several factor variables. 
#However, R is reading them as numeric. 
#Please convert them into factors using a for loop. 
#Please use column 8 to 11 for the loop.

library(readr)
data(mtcars)
mtcarsfactor <- c(8:11)
for (mtcarsfactor  in mtcarsfactor ) {
  mtcars[, mtcarsfactor ] <- as.factor(mtcars[, mtcarsfactor ])
}
str(mtcars)




#You will receive a data set (Dataset 2.1). 
#This data set is a subset of a real data set.  
#library(readxl)
Dataset_2_1 <- read.table("Downloads/Dataset - 2.1.xlsx")
View(Dataset_2_1)



#Question 3: Write a function to get the percentage of NAs in each column.
colMeans(is.na(Dataset_2_1))
library(tidyverse)
means <- Dataset_2_1 %>% summarize_all(funs(sum(is.na(.)) / length(.)))

#Question 5: Write a function to get a summary of numeric columns 
#(use the summary function) such as THC, CO, CO2, and so on in the data set. 
#With the same function, try to generate box plot using base R.

boxplot(Dataset_2_1$THC)
boxplot(Dataset_2_1$CO)
boxplot(Dataset_2_1$CO2)


#Question 6: Write a function to create histograms of numeric columns, 
#such as THC, CO, CO2, and so on in the data set. Use ggpot2 to generate figures.
library(ggplot2)
ggplot(Dataset_2_1, aes(x=THC)) + geom_histogram()


#Question 7: The data set contains date columns. 
#All of these date columns are untidy. 
#Please create a better formatted data set. 
#The date should be dd/mm/yyyy in the final format. Use columns 2, 3, and 5 only.

Data_set_2_2 <- read_csv("Downloads/Data set - 2.2.csv")
dates <- c(2,3,5,8)
for (dates  in dates ) {
  Data_set_2_2[, dates ] <- format(as.Date(Data_set_2_2[,dates ]), "%d/%m/%Y")
}
