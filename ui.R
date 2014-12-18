shinyUI(fluidPage(
  titlePanel("choroplethr"),
  
  sidebarLayout(
    sidebarPanel(
      
      helpText("An interactive website based on the R package choroplethr"),
      
      selectInput("map_name", 
                  label = "Choose a map",
                  choices = c("USA State", "USA County", "USA ZIP", "Country"),
                  selected = "USA State"),
      
      sliderInput("num_buckets", 
                  label = "Number of colors in scale:",
                  min = 1, max = 9, value = 7)
    ),
    
    mainPanel(plotOutput("map"))
  )
))