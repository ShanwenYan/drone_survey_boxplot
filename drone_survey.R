library(dplyr)
library(readxl)
library(stringr)

Drone_Controller_Questionnaire <- read_excel("Rstudio_File/drone_survey/Drone-Controller-Questionnaire.xlsx", range = "D1:AG12")

View(Drone_Controller_Questionnaire)

H <- colnames(Drone_Controller_Questionnaire)
H


Q1 <- str_detect(H,'comfortable')
Q2 <- str_detect(H,'layout') 
Q3 <- str_detect(H,'liked')
Q4 <- str_detect(H,'natural')
Q5 <- str_detect(H,'fun')
Q6 <- str_detect(H,'frustrated')
Q7 <- str_detect(H,'discomfort')
Q8 <- str_detect(H,'easy')
Q9 <- str_detect(H,'predictable')
Q10 <- str_detect(H,'Completion')

Q = array(c(Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10),dim = c(30,10))

par(mfrow=c(4,3))

for (i in 1:10){
  Drone_Controller_Questionnaire%>%
    select(H[Q[,i]])%>%
    boxplot(main = paste0('Q',i),col = c('red','green','blue'),names = c('JoyStick','VR','VIVE'))
}
