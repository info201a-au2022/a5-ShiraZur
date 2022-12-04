#library("shiny")
library("dplyr")
library("ggplot2")


data <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")

# Calculations for co2 levels of each continent in the past 3 decades:

co2_level <- data %>%
  filter(year > 1989) %>%
  filter(country %in% c("Asia", "Africa", "Europe", "North America", "South America", "Australia", "Antarctica")) %>%
  select(country, year, co2)

# Calculate 3 values:

# Which continent emitted the most co2 in the past 3 decades?

highest_co2_level <- co2_level %>%
  group_by(country) %>%
  summarize(co2 = sum(co2)) %>%
  filter(co2 == max(co2)) %>%
  pull(country)

# Which continent emitted the least co2 in the past 3 decades?

lowest_co2_level <- co2_level %>%
  group_by(country) %>%
  summarize(co2 = sum(co2)) %>%
  filter(co2 == min(co2)) %>%
  pull(country)

# When were co2 emissions the highest in North America?

highest_co2_level_north_america <- co2_level %>%
  filter(country == "North America") %>%
  group_by(country, year) %>%
  summarize(co2 = sum(co2)) %>%
  filter(co2 == max(co2)) %>%
  pull(year)

server <- function(input, output) {
  
  output$selectContinent <- renderUI({
    selectInput("Continent", "Choose a continent:", choices = unique(co2_level$country))
  })
  
  output$selectRange <- renderUI({ 
    sliderInput("Range", "Choose a year range:", min = 1990, max = 2021, value = 1990)
  })
  
  barPlot <- reactive({
    plotData <- co2_level %>%
      filter(country %in% input$Continent) %>%
      filter(year <= input$Range)
    
    ggplot(plotData, aes(x = year, y = co2)) +
      geom_bar(stat="identity") +
      labs(x = "Year", y = "Co2 Levels",
           title = "Co2 Levels Per Continent")
    
  })
  
  output$continentPlot <- renderPlot({
    barPlot()
  })
  
}