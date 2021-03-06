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
library(magrittr)
library(dbplyr)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    csv <- read.csv("https://raw.githubusercontent.com/nytimes/covid-19-data/master/live/us-states.csv")
    csv1 <- read.csv("https://raw.githubusercontent.com/pchen8090/DevelopingDataProducts-w2/master/stateGeoCode.csv")
    csv$state <- as.character(csv$state)
    csv <- csv %>% merge(x=csv,y=csv1,by.x="state",by.y="location",all.y=TRUE)
    csv <- csv[c("cases","lat","lng")]
    df <- csv[rep(row.names(csv), csv$cases/1000),]
    output$map <- renderLeaflet({
        df %>% leaflet() %>%
            addTiles() %>%
            addMarkers(
                clusterOptions = markerClusterOptions(showCoverageOnHover = FALSE,spiderfyOnMaxZoom=FALSE,zoomToBoundsOnClick = FALSE))
    })
})
