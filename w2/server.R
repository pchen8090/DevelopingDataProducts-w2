#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)
library(ggmap)
library(dbplyr)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    csv <- read.csv("https://raw.githubusercontent.com/nytimes/covid-19-data/master/live/us-states.csv")
    csv1 <- read.csv("./stateGeoCode.csv")
    csv <- csv %>% merge(x=csv,y=csv1,by.x="state",by.y="location",all.y=TRUE)
    csv <- na.omit(csv)
    df <- csv
    output$map <- renderLeaflet({
        leaflet() %>%
            addTiles()
    })
})
