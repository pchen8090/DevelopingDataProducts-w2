#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Week 2 project, created at 8/22/2020"),

        # Show a plot of the generated distribution
    mainPanel(
            tabPanel("Order Locations", leafletOutput("map",width="90%", height="600px")),
    )
    
))
