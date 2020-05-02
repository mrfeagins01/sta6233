library("DT")
library("tidyverse")
library(shiny)
library(datasets)

survey_data <- read_csv("data/MATH221_LabData_B_Excel_vs20190620.csv")

Drive<- as.numeric(survey_data$Drive)
Shoe<- as.numeric(survey_data$Shoe)
Height<- as.numeric(survey_data$Height)
Sleep<-as.numeric(survey_data$Sleep)
TV<-as.numeric(survey_data$TV)
Money<-as.numeric(survey_data$Money)
Coin<-as.numeric(survey_data$Coin)

function(input, output, session){
  
  output$survey_table <- renderDT({
    survey_data %>%
      datatable(rownames=FALSE,extensions = "Responsive")
  })
  
 output$data <- renderTable({
   colm <- input$selected_qualitative_variable
   survey_data[colm]
 })

output$graph<- renderPlot({
  par(mfrow = c(2,1))
  hist(survey_data$Drive, col = input$color1, main = "Histogram of No. of Miles Students Drive",xlab="Miles",ylab="No. of Students",breaks=seq(0, max(survey_data$Drive), l=input$bins1))
  hist(survey_data$Shoe, col = input$color2, main = "Histogram of Students' Shoe Size",xlab="Size",ylab="No. of Students",breaks=seq(0, max(survey_data$Shoe), l=input$bins2))
  par(mfrow = c(1,1))
})


output$sum <- renderPrint({
  summary(survey_data[,input$selected_quantitative_variable],digits = 4, align = "center")
})


 }