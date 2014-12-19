library(choroplethrMaps)

data(state.regions, package="choroplethrMaps")
usa.zoom = state.regions$region
data(country.regions, package="choroplethrMaps")
country.zoom = country.regions$region
data(admin1.regions, package="choroplethrAdmin1")
admin1.zoom = get_admin1_countries()


shinyUI(fluidPage(
  titlePanel("choroplethr"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("An interactive website based on the R package ",
               a("choroplethr", target="_blank", href="https://github.com/trulia/choroplethr")),
      
      selectInput("map_name", 
                  label = "Choose a map",
                  choices = c("USA State", "USA County", "USA ZIP", "Country", "Admin1"),
                  selected = "USA State"),

      conditionalPanel(
        condition = "input.map_name == 'USA State' || input.map_name == 'USA County' || input.map_name == 'USA ZIP'",
        selectInput("usa_zoom", 
                    label = "Choose a zoom",
                    choices = usa.zoom,
                    selected = "USA State",
                    multiple = TRUE)
      ),
        
      conditionalPanel(
        condition = "input.map_name == 'Country'",
        selectInput("country_zoom", 
                    label = "Choose a zoom",
                    choices = country.zoom,
                    selected = "all",
                    multiple = TRUE)
      ),
        
      conditionalPanel(
        condition = "input.map_name == 'Admin1'",
        selectInput("admin1_zoom", 
                    label = "Choose a zoom",
                    choices = admin1.zoom,
                    selected = "japan"
                    )
      ),
      
      sliderInput("num_buckets", 
                  label = "Number of colors in scale:",
                  min = 1, max = 9, value = 7)
    ),
    
    mainPanel(plotOutput("map"))
  )
))