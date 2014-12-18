# ui.R

shinyUI(fluidPage(
  titlePanel("choroplethr Web App"),
  
  sidebarLayout(
    sidebarPanel(
      
      selectInput("map_name", 
                  label = "Choose a map",
                  choices = c("USA State", "USA County", "USA ZIP"),
                  selected = "USA State"),
      
      sliderInput("buckets", 
                  label = "Number of colors in scale:",
                  min = 1, max = 9, value = 7)
    ),
    mainPanel(plotOutput("map"))
  )
))