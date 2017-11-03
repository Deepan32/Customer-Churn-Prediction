
#remove the variables in the Global Environment 
rm(list = ls())
churn<-read.csv('CustomerChurn.csv')


#UNDERSTANDING AND PLAYING AROUND WITH DATA
summary(churn)
str(churn)

levels(churn$Partner)<-c(0,1)
levels(churn$Dependents)<-c(0,1)
levels(churn$gender)<-c(0,1)
levels(churn$PhoneService)<-c(0,1)


#separating the factor variables for dummy variable creation
churnFactor<-churn[,-c(1,3,6,19,20)]
str(churnFactor)

# creating dummy variables for factor attributes using model.matrix(), a function used to create design matrix
dummies1<- data.frame(sapply(churnFactor, 
                            function(x) data.frame(model.matrix(~x,data =churnFactor))[,-1]))


#separating out the non factor attributes to join with the output of model.matrix()
churnNonFactor<- churn[,c(1,3,6,19,20)]

#joining the 2 using cbind() as there is no common foreign key to perform a join
churnMaster<- cbind(churnNonFactor,dummies1)
View(churnMaster)

#master file is ready. And the customerid column looks insignificant, so I am removing it.
churnMaster<-churnMaster[,-1]

#Now the data looks neat. 3 continuous variables and the remaining are categorical variables.


#Lets start with EDA(Exploratory Data Analysis using graphs)
#I need ggplot2 library so, importing it.

library(ggplot2)












