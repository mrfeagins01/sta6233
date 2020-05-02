library(DT)
library("tidyverse")
library(shinythemes)
library("plotly")
library(ggplot2)
library(gridExtra)

  fluidPage(theme = shinytheme("united"),
            
            titlePanel(
              h1("Welcome to Math221 Week 2 Lab!",align = "center"),
              h2("Let us crunch some numbers and create some graphs", align = "center")),
            
                sidebarPanel(
                selectInput(inputId = "selected_qualitative_variable",
                            label = "Select a Qualitative Variable",c("State", "Gender","Car"), selected = "Make                                                          a Selection", selectize = FALSE),
                br(),
                selectInput(inputId = "selected_quantitative_variable",
                            label = "Select a Quantitative Variable",c("Drive","Shoe","Height", "Sleep","TV","Money","Coin"),
                            selected = "Make a Selection", selectize = FALSE),
                br(),
                
                sliderInput("bins1", "Select No. of BINs for Histogram of No. of Miles Students Drive", min=5, max = 25, value=15),
                br(), 
               
                sliderInput("bins2", "Select No. of BINs for Histogram of Students' Shoe Size", min=5, max = 25, value=15),
                br(),
                 radioButtons("color1", "Select the color for Histogram of No. of Miles Students Drive", choices=c("Green", "Red", "Yellow"), selected ="Green"),
                radioButtons("color2", "Select the color for Histogram of Students' Shoe Size", choices=c("Green", "Red", "Yellow"), selected ="Red")
                
       ),# end of sidebarPanel
              
            
            
            mainPanel(
          tabsetPanel(type = "tab",
                      
                      tabPanel("Goals",
                          p(("You will use this application to answer questions to week 2 lab. You will need to open the Word file that acompanies
                      this lab. You may download it from inside Canvas/Files/Week2. We seek to answer the following by the end of this lab:")),
                      tags$div(tags$ul(
                              tags$li("What is an observation?"),
                              tags$li("What is a frequency distribution?"),
                              tags$li("What are qualitative variables?"), 
                              tags$li("What are quantitative variables?"),
                              tags$li("What is a histogram?"),
                              tags$li("What does a histogram say about a distribution?"),
                              tags$li("What is a data set summary?"),
                              style="font-size: 15px"))
                      ),
                      
                      tabPanel("Survey Info",
                            p("The data set used in this lab came from asking questions to a group of 35 DeVry students. Here
                              is a list of the questions. The words in bold letters will be considered the name of the variable 
                              associated with each students' response to the question."),                          
                            p(strong("Drive:"),("How long does it take you to drive to the school on average (to the nearest minute)?")), 
                            p(strong("State:"),("What state were you born?")),
                            p(strong("Shoe:"),("What is your shoe size?")),
                            p(strong("Height:"),("What is your height to the nearest inch?")),
                            p(strong("Sleep:"),("How many hours did you sleep last night?")),
                            p(strong("Gender:"),("What is your gender?")),
                            p(strong("Car:"),("What color of car do you drive?")),
                            p(strong("TV:"),("How long (on average) do you spend a day watching TV?")),
                            p(strong("Money:"),("How much money do you have with you right now?")),
                            p(strong("Coin:"),("Flip a coin 10 times. How many times did you get tails?")),
                            p(strong("Die1-10"),("Roll a six-sided die 10 times and record the results."))),
                      
                      tabPanel("Table",DTOutput("survey_table")),
                      tabPanel("Histograms",plotOutput("graph")),
                      tabPanel("Summary",verbatimTextOutput("sum")))
          )

          
    )#end of fluidpage


