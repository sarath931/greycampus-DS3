## I. Data: The World Values Survey is an ongoing worldwide survey that polls the world population about perceptions of life, work, family, politics, etc.
# The most recent phase of the survey that polled 77,882 people from 57 countries estimates that 36.2% of the world's population agrees with the statement 
# "Men should have more right to a job than women." The survey also estimates that 13.8% of people have a university degree or higher and that 3.6% of people fit both criteria. 


# Question 1: Are agreeing with the statement "Men should have more right to a job than women" and having a university degree or higher disjoint events?
p(agree)<- 0.362
p(degree)<-0.138
p(agree_and_degree)<-0.036
 
there is common cause for both degree and agree which is not equal to 0 . so this is not disjoint



# Question 2: Draw a Venn diagram summarizing the variables and their associated probabilities.

if (!require(devtools)) install.packages("devtools")
devtools::install_github("gaospecial/ggVennDiagram")

library("ggVennDiagram")
install.packages("VennDiagram")`

grid.newpage()  # Move to new plotting page
draw.pairwise.venn(area1 = pa,   # Create pairwise venn diagram
                   area2 = pb,
                   cross.area = pboth,
                   lty = "blank",
                   fill = c("pink", "green"),
                   category = c("agree","degree"))


# Question 3: What is the probability that a randomly drawn person has a university degree or higher or 
# agrees with the statement about men having more right to a job than women?

p(agree_or_degree)=p(agree)+p(degree)-p(agree_and_degree)
p(agree_or_degree)=0.362+0.138-0.036= 0.464


Question 4: What percent of the world population do not have a university degree and disagree with the statement
# about men having more right to a job than women?

p(neiher_agree_nor_degree)=1-p(agree_or_degree)=1-0.464=  0.536




# Question 5: Does it appear that the event that someone agrees with the statement is independent of the event 
# that they have a university degree or higher?



p( agree_and degree)=p(agree)* p(degree)
0.036 != 0.362*0.138

not independent


# Question 6: What is the probability that at least 1 in 5 randomly selected people to agree with the statement 
# about men having more right to a job than women?



# II. Data: As of 2009, Swaziland had the highest HIV prevalence in the world. 25.9% of this country's population 
# is infected with HIV. The ELISA test is one of the first and most accurate tests for HIV. For those who carry HIV, 
# the ELISA test is 99.7% accurate. For those who do not carry HIV, the test is 92.6% accurate. If an individual from 
# Swaziland has tested positive, what is the probability that he carries HIV? Create a tree diagram to calculate the 
# probability.


P(HIV) = 0.259
P(Not HIV) = 1-0.259 = 0.741
P(Positive|HIV) = 0.997 
P(Positive|Not HIV) = 0.926



hiv <-0.259
not_hiv <=0.741
positive_given_hiv<-0.997
positive_not_given_hiv<=0.926

hiv_positive_given<-hiv_and_positive/hiv=0.8248434


 #Question 2: According to a 2013 Gallup poll, worldwide only 13% of employees are engaged at work (psychologically committed to their jobs and
  # likely to be making positive contributions to their organizations).Among a random sample of 10 employees, what is the probability that 8 of 
 # them are engaged at work?
                                                                                                  
# using binomial distribution coz we need to find the success rate of 8 out of 10 ppl being engaged at work independently
# every person who is engaged has a probability of 0.13/1
# if we want 8 persons then 0.13 * 0.13 * 8 times and for the remaining 2 ppl it will be 0.87*0.87
 # also we are selecting 8 ppl out of 10, so the combination will be 10C8 = 45
          
      engaged<    0.13
      not_enganed <-1-engaged
      n=10 and x= 8
      
      dbinom(8, 10, 0.13)
      2.77842e-06
      
      
#Question 3: Recent study: "Facebook users get more than they give"
      
#friend requests: 40% made, 63% received at least one
#likes: liked 14 times, had their content "liked" 20 times, on average
#messages: sent 9 messages, received 12, on average
 #tags:12% tagged a friend in a photo, but 35% tagged other findings:
#25% considered power users
#average Facebook user has 245 friends
#P(70 or more power user friends) = ?
      
      # Let N = Number of power user friends
      # The data represents binomial distribution
      # n=245, p = 0.25 , q = 0.75 
      
      sum(dbinom(70:245, size = 245, p = 0.25))
     
        0.112763  
        
        
        
# Question 4: According to a 2014 Gallup poll, 56% of uninsured Americans who plan to get health insurance say they will do so through 
#a government health insurance exchange. What is the probability that in a random sample of 10 people exactly 6 plan to get health
  #insurance through a government health insurance exchange?
        
        
  # The data represents Binomial distribution.
  # n = 10, x = 6 and p = 0.56
        
        dbinom(6, 10, 0.56)
        
         0.2427494
        
        



