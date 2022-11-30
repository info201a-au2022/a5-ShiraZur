data <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")

# Calculate 3 values:

# When were USA's co2 levels the lowest?

lowest_usa_co2_level <- data %>%
  filter(country == "United States") %>%
  filter(co2 == min(co2)) %>%
  pull(year)

# When were USA's co2 levels the highest?

highest_usa_co2_level <- data %>%
  filter(country == "United States") %>%
  filter(co2 == max(co2)) %>%
  pull(year)

# By how much did USA's co2 levels grow between 1921 to 2021?

usa_co2_1921 <- data %>%
  filter(country == "United States") %>%
  filter(year == "1921") %>%
  pull(co2)

usa_co2_2021 <- data %>%
  filter(country == "United States") %>%
  filter(year == "2021") %>%
  pull(co2)

usa_co2_growth <- (usa_co2_2021 - usa_co2_1921)

# Make ggplot:

server <- function(input, output) {
  # assign values to `output` here
}

output$plot <- renderPlot({
  
# ggplot(data=characters, aes_string(x='Character', 
#  y=input$y_var, fill="Class")) +
#  geom_bar(stat="identity", width=0.8) +
#  labs(x="Character", y=input$y_var) + coord_flip()
  
})
