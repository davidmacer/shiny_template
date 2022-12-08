library(shiny)
ui <- fluidPage(
  "Un saludo a familia bonita del NIES"
)
server <- function(input, output, session) {
}
shinyApp(ui, server)