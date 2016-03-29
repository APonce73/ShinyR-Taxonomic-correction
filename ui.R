shinyUI(fluidPage(
  titlePanel("Correccion Taxon??mica"),
  
  fluidRow(
    
    column(3, 
           textInput("text", label = h3("Especie vegetal"), 
                     value = "Helianthus annuus")),
    column(3,
           h3("Actualizar"),
           #actionButton("update", label = "Action"),
           submitButton("Submit"),
           br(),
           br()
           ),
    column(8,
           h4("Resumen Taxonstand"),
      tableOutput("TableL"),
          h6("Cayuela, L. Granzow-de la Cerda,I. Albuquerque FS, Golicher DJ (2012), taxonstand: An r package for species names stndardisation in vegetation database. Methods in Ecology and Evolution, 3: 1078-1083. doi: 10.1111/j.2041-210X2012.00232.X"),
          h4("Resumen taxize"),
          tableOutput("TableL1"),
          h6("Scott Chamberlain and Eduard Szocs (2013). taxize - taxonomic search and retrieval in R. F1000Research, 2:191. URL: http://f1000research.com/articles/2-191/v2. ")
    ),
    mainPanel(plotOutput("map1"))
    
  )
  
))
