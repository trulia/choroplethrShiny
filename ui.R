shinyUI(fluidPage(
  titlePanel("censusVis"),
  
  sidebarLayout(
    sidebarPanel(
      
      helpText("Create demographic maps with 
        information from the 2010 US Census."),
      
      selectInput("map_name", 
                  label = "Choose a map",
                  choices = c("USA State", "USA County", "USA ZIP"),
                  selected = "USA State"),
      
      sliderInput("buckets", 
                  label = "Number of colors in scale:",
                  min = 1, max = 9, value = 7),
      
      selectInput("var", 
                  label = "Choose a variable to display",
                  choices = c("Percent White", "Percent Black",
                              "Percent Hispanic", "Percent Asian"),
                  selected = "Percent White"),
      
      sliderInput("range", 
                  label = "Range of interest:",
                  min = 0, max = 100, value = c(0, 100))
    ),
    
    mainPanel(plotOutput("map"))
  )
))