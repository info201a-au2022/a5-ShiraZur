#library("shiny")
library("dplyr")
library("ggplot2")

#sourcing the two other files 
source("./app_ui.R", local = knitr::knit_global())
source("./app_server.R", local = knitr::knit_global())

# Run the application 
shinyApp(ui = ui, server = server)