list.of.packages <- c("choroplethr", "choroplethrMaps", "choroplethrAdmin1")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

library(choroplethr)
library(choroplethrMaps)
library(choroplethrAdmin1)

shinyServer(
  function(input, output) 
  {
    observe({
      if (input$map_name == "USA State")
      {
        output$map <- renderPlot({
          data(df_pop_state)
          state_choropleth(df_pop_state, "2012 State Population Estimates", "Population")
        })
      } else if (input$map_name == "USA County") {
        output$map <- renderPlot({
          data(df_pop_county)
          county_choropleth(df_pop_county, "2012 County Population Estimates", "Population")
        })
      } else if (input$map_name == "USA ZIP") {
        output$map <- renderPlot({
          data(df_pop_zip)
          zip_map(df_pop_zip, "2012 ZCTA (ZIP Code) Population Estimates", "Population")
        })
      } else if (input$map_name == "Country") {
        output$map <- renderPlot({
          data(df_pop_country)
          country_choropleth(df_pop_country, "2012 Country Population Estimates", "Population")
        })
      }
    })
  }
)