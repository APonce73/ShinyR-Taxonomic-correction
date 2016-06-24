library(shiny)
library(shinydashboard)
library(leaflet)

shinyUI(bootstrapPage(
  titlePanel("Taxonomic corrections"),
  h6("We use two different packages in R to do almost the same analysis. The functions in R use different algorithm to correct"),
  h6("mispelling or synonyms of flora."),
  h3("Why Plant list?"),
  h6("Plant list is a database with the support of Missouri Botanical Garden and the Royal Botanical Gardens, Kew"),
  h4("Important notes:"),
  h6("if you decide to use this plataform, please do credits to each package in R!"),
  
  
  fluidRow(
    column(3, 
           textInput("text", label = h3("Plant Species"), 
                     value = "Pinus cembroides")),
   
    column(3,
      h3("Actualizar"),
      #actionButton("update", label = "Action"),
      submitButton("Submit"),
      br(),
      br()
    ),
    column(10,h5("All sample points (dots) come from iNaturalist database"),
      column(12,leafletOutput("mymap",height=800)),
      h4("Citation of leaflet package:"),
      h6("Citation: : Joe Cheng and Yihui Xie (2016). Leaflet: Create Interactive web Maps with the JavaScript 'leaflet' Library"), 
      h6("R package version 1.0.1.900."),    
      h6("http://rstudio.github.io/leaflet/")
    ),
    column(6,
      h4("Taxonstand package result:"),
      tableOutput("TableL"),
          h5("Citation of Taxonstand package:"),
          h6("Cayuela, L. Granzow-de la Cerda,I. Albuquerque FS, Golicher DJ (2012),"), 
          h6("taxonstand: An r package for species names stndardisation in vegetation database." ),   
          h6("Methods in Ecology and Evolution, 3: 1078-1083." ),   
          h6("doi: 10.1111/j.2041-210X2012.00232.X")
    ),
    column(2,
      h4("taxize package result:"),
      tableOutput("TableL1"),
          h5("Citation of taxize package:"),
          h6("Scott Chamberlain and Eduard Szocs (2013). taxize -"), 
          h6("taxonomic search and retrieval in R. F1000Research, 2:191."),    
          h6("URL: http://f1000research.com/articles/2-191/v2.")
          #tableOutput("Tabla33")
      
    )
   
  )
  
))
