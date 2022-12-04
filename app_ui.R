#library("shiny")
library("dplyr")
library("ggplot2")
library("rsconnect")

data <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")

introduction_page <- tabPanel(
  "Introduction Page",
  titlePanel("A5 Shira Zur"),
  p("This shiny app explores the data given by analyzing the co2 levels of the 7 continents during a specific range -- from 1990 to 2021.
    This exploration allows the user to understand ideas such as which continent is the leading one in co2 emissions, during what time
    during the past 3 decades have continents emitted the most co2, and which continent compared to another continent emits higher co2 levels."),
  p("I also explored 3 additional variables to understand more about co2 emissions and the data set itself. I asked the question,", em("Which continent emitted the most co2 in the past 3 decades?"),
    "and I found that Asia has emitted the most co2. I then asked,", em("Which continent emitted the least co2 in the past 3 decades?"), "and I found that
    Antartica has emitted the least co2. Lastly, the third variable I found was,", em("When were co2 emissions the highest in North America?"), "and I found that
    in 2007, North America emitted the most co2.")
)

plot_page <- tabPanel(
  "Plot Page",
  titlePanel("Co2 Plot"),
  
  sidebarLayout(
    sidebarPanel(
      uiOutput("selectContinent"),
      uiOutput("selectRange")
    ),
    
    mainPanel(
      plotOutput("continentPlot")
    ),
    
  ),
  
  p("The interactive plot above shows the co2 levels of each continent since 1990 to 2021. The user can select which continent they want to focus on
    and during which year range, starting from 1990, they want to focus on, and the plot returns a bar graph of the co2 levels per the selected year range 
    of the selected continent.")
  
  
)

ui <- navbarPage(
  "A5 Shira Zur",
  introduction_page,
  plot_page
)

