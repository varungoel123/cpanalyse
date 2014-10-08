library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$varplot<-renderPlot({
    
    if(input$panchayat==".")
      ggplot(data=subdat11,mapping = aes_string(x=input$variable))+geom_histogram()
    else(ggplot(data=subdat11[subdat11$panchid==input$panchayat,],mapping = aes_string(x=input$variable))+geom_histogram())
  }
  )
  
  output$varplot1<-renderPlot({
    
    if(input$y %in% c("hastoilet","lpg","caste"))
    {
      
      if(input$panchayat=="." & !input$color %in% names(subdat11)[c(1,4)])
        ggplot(data=subdat11,mapping = aes_string(x=input$x,fill=input$y))+geom_bar()
      else if(input$panchayat!="." & !input$color %in% names(subdat11)[c(1,4)])
        ggplot(data=subdat11[subdat11$panchid==input$panchayat,],mapping = aes_string(x=input$x,fill=input$y))+geom_bar()
      else if(input$color!="." & input$panchayat==".")
        ggplot(data=subdat11,mapping = aes_string(x=input$x,fill=input$y))+geom_bar()+facet_wrap(input$color)
        else(ggplot(data=subdat11[subdat11$panchid==input$panchayat,],mapping = aes_string(x=input$x,fill=input$y))+geom_bar()+facet_wrap(input$color))
    }
    
     
        
    
    
  })

})
