library(shiny)
library(tidyverse)

datos <- read_csv("https://raw.githubusercontent.com/nepito/world_cup_semis/develop/tests/data/morocco_vs_spain.csv")
ui <- fluidPage(
  titlePanel(title = span(img(src = "logo.jpeg", height = 35), "")),
  plotOutput("static"),
  dataTableOutput("dynamic")
)
server <- function(input, output, session) {
  p <- datos %>% group_by(Team) %>% summarise(suma_goles = sum(Gls, na.rm = T)) %>% 
    ggplot() + geom_col(aes(Team, suma_goles))
  output$static <- renderPlot(p)
  output$dynamic <- renderDataTable(datos, options = list(pageLength = 5))
}
shinyApp(ui, server)
