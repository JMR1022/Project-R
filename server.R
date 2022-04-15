#Jessica's R Project


library(shiny)
library(dplyr)
library(ggplot2)
library(tidyr)
library(tidyverse)


happy <- read.csv(file = "./happy.csv")

happy$AGE = factor(happy$AGE, levels = c("Less than 20", "21 to 35", "36 to 50", "51 or more"))

function(input, output) {
  
  happy_react <- reactive({
    happy %>%
      filter(YEAR == input$Year & GENDER == input$Gender)
  })
  

  output$stress_plot <- renderPlot(
    happy_react() %>%
      ggplot(aes(x = AGE)) +
      geom_bar(aes(fill = as.factor(DAILY_STRESS)), position = "fill") +
      ggtitle("Daily Stress Levels") +
      ylab("Percent") +
      scale_y_continuous(labels = scales::percent) +
      labs(fill = "Stress Levels")
  )
  
  output$support_plot <- renderPlot(
    happy_react() %>%
      ggplot(aes(x = AGE, y = CORE_CIRCLE)) +
      geom_boxplot() +
      ggtitle("Support System") +
      labs(y = "Number of Close Friends")
  )
  output$meditation_plot <- renderPlot(
    happy_react() %>%
      ggplot(aes(x = AGE, y = WEEKLY_MEDITATION)) +
      geom_boxplot() +
      ggtitle("Weekly Meditiation")+
      labs(y = "Hours")
  )
  
  output$passion_plot <- renderPlot(
    happy_react() %>%
      ggplot(aes(y = DAILY_STRESS, x = TIME_FOR_PASSION)) +
      geom_jitter()+
      facet_grid(~AGE) +
      labs(y = "Stress Levels", x = "Hours") +
      ggtitle("Daily Time for Passions")
  )
}


















































