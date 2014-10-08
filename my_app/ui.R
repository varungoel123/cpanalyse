
shinyUI(fluidPage(
  fluidRow(
    column(12,
      titlePanel("HH Data Visualization Portal V 0.001")
    )
  ),
  fluidRow(
    column(3,
      sidebarPanel(
        selectInput("panchayat","Choose a Panchayat",c("All Panchayats"=".",
                    setNames(as.list(panchval),panch_names)),selected=".",width='100%'
        ),
        radioButtons("variable", "Variable:",names(subdat11)[4:15],selected="caste"
        ),width=8
      )
    ),
    column(8,offset=1,
      plotOutput("varplot",width = "70%",height="450")
    )  
  ),
  fluidRow(
    column(3,
      sidebarPanel(
        selectInput("x","X Axis",names(subdat11)[4:15],selected="newspaper"),
        selectInput("y","Y Axis",names(subdat11)[4:15],selected="hastoilet"),
        selectInput("color","Group By:",c("none"=".",names(subdat11[c(1,4)])))
      ,width=8)
    ),
    column(8,offset=1,
           plotOutput("varplot1",width = "70%",height="450")
    )  
  )
 
))