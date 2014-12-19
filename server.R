list.of.packages <- c("choroplethr", "choroplethrMaps", "choroplethrAdmin1", "zipcode")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

library(choroplethr)
library(choroplethrMaps)
library(choroplethrAdmin1)
library(zipcode)

shinyServer(
  function(input, output) 
  {
    observe({
      num_buckets = input$num_buckets
      if (input$map_name == "USA State") {
        output$map <- renderPlot({
          data(df_pop_state)
          zoom = if(length(input$zoom) == 0) NULL else input$zoom
          state_choropleth(df_pop_state, "2012 State Population Estimates", "Population", num_buckets, zoom)
        })
      } else if (input$map_name == "USA County") {
        output$map <- renderPlot({
          data(df_pop_county)
          zoom = if(length(input$zoom) == 0) NULL else input$zoom
          county_choropleth(df_pop_county, "2012 County Population Estimates", "Population", num_buckets, zoom)
        })
      } else if (input$map_name == "USA ZIP") {
        data(df_pop_zip)
        zoom = if(length(input$zoom) == 0) NULL else input$zoom
        output$map <- renderPlot({
          zip_map(df_pop_zip, "2012 ZCTA (ZIP Code) Population Estimates", "Population", num_buckets, zoom)
        })
      } else if (input$map_name == "Country") {
        output$map <- renderPlot({
          data(df_pop_country)
          country_choropleth(df_pop_country, "2012 Country Population Estimates", "Population", num_buckets)
        })
      }
    })
  }
)