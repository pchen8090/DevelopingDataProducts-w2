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

    states <- as.data.frame(state.x77[,1:7])
    states[,"Population"] <- states$Population/100
    model1 <- lm(Murder~ Illiteracy, data=states)
    model1pred <- reactive({ 
        illInput <- input$illiteracySlider
        predict(model1,newdata = data.frame(Illiteracy = illInput))
    })
    
    output$plot1 <- renderPlot({
        illInput <- input$illiteracySlider
    
        plot(states$Illiteracy, states$Murder, bty="n",pch=16,
             xlim = c(0,3),ylim = c(0,20))
        if(input$showModel1) {
            abline(model1, col = "red", lwd = 2)
        }        
        if(input$showModel2) {
            points(illInput, model1pred(), col = "blue", pch = 16, cex = 2)
        }
    })
    
})
