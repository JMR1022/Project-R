# Jessica's R Project



library(shiny)
library(shinydashboard)

happy <- read.csv(file = "./happy.csv")
dashboardPage(
  dashboardHeader(title = "Stress and Supports"),
  
  dashboardSidebar(
    selectizeInput(inputId = "Year",
                   label = "Year",
                   choices = unique(happy$YEAR)),
      selectizeInput(inputId = "Gender",
                     label = "Gender",
                     choices = unique(happy$GENDER))
    ),
    dashboardBody(
      fluidRow(
        column(6, plotOutput("stress_plot")),
        column(6, plotOutput("support_plot"))
      ),
      
      fluidRow(
        column(6, plotOutput("meditation_plot")),
        column(6, plotOutput("passion_plot"))
      )
    )
  )
  






















































