#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Predict murder cases from state.x77, created at 8/29/2020"),

    sidebarLayout(
        sidebarPanel(
            sliderInput("illiteracySlider", "What is the Illiteracy expection", 1.0, 3.0, value = 1, step = .1),
            checkboxInput("showModel1","Show/Hide Model", value = TRUE),
            checkboxInput("showModel2","Show/Hide Predict", value = TRUE)
        ),
        # Show a plot of the generated distribution
        mainPanel(
            h3("Perdicted Murder cases from Model 1:"),
            plotOutput("plot1"),
            textOutput("pred1")
        )
    )

))
