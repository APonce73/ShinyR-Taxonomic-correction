library(shiny)
#library(shinydashboard)
library(leaflet)


################################

#dashboardPage(
#  dashboardHeader(),
#  dashboardSidebar(),
#  dashboardBody()
#)



shinyUI(navbarPage(
  #title = "Mauricio Bellon paper",
  title = "Correcciones Taxonómicas",
  h3("Se utilizaron dos paquetes en R que realizan análisis similares. Sin embargo, utilizan distintos algoritmos"),
  h3("para flora que tenga algún error ortográfico o si esta en categoría de sinonímia o en revisión."),
  h2("¿Porque Plant List?"),
  h3("Plant list es una base de datos con el apoyo del Missouri Botanical Garden y the Royal Botanical Gardens, Kew"),
  h4("Notas Importantes:"),
  h5("Si ésta plataforma te sirve, no olvides citar, los paquetes en R"),
  
  
  
  
           # Define UI for slider demo application
           shinyUI(fluidPage(
             #Application title
            # titlePanel("Debunking Myth"),
             #h4("Suplementary analysis for the article Bellon et al., 2016"),
             #tags$a(href = "http://www.sagarpa.gob.mx/quienesomos/datosabiertos/siap/Paginas/Catalogos.aspx", "Base de Datos"),
             
             sidebarLayout(
               sidebarPanel(
                
                        textInput("text", label = h3("Plant Species"), 
                                  value = "Pinus cembroides"),
                 
                        h3("Actualizar"),
                        #actionButton("update", label = "Action"),
                        submitButton("Submit"),
                        
            
                 br(),
                 h5("comments: aponce@conabio.gob.mx"),
                 h5("aponce73pm@gmail.com"),
                 br(),
                 h4("Code:"),
                 tags$a(href = "https://github.com/APonce73/ShinyR-Taxonomic-correction", "Github"), width = 2),
               
               fluidRow(
                 #verbatimTextOutput("summary"),
                 #column(9,leafletOutput("mymap", width = "1200", height = "800"))
               
                 column(5,
                        h3("Resultado del paquete Taxonstand:"),
                        h4(tableOutput("TableL")),
                        h4("Citation of Taxonstand package:"),
                        h5("Cayuela, L. Granzow-de la Cerda,I. Albuquerque FS, Golicher DJ (2012),"), 
                        h5("taxonstand: An r package for species names stndardisation in vegetation database." ),   
                        h5("Methods in Ecology and Evolution, 3: 1078-1083." ),   
                        h5("doi: 10.1111/j.2041-210X2012.00232.X")
                 ),
                 column(3,
                        h3("Resultado del paquete taxize:"),
                        h4(tableOutput("TableL1")),
                        h4("Citation of taxize package:"),
                        h5("Scott Chamberlain and Eduard Szocs (2013). taxize -"), 
                        h5("taxonomic search and retrieval in R. F1000Research, 2:191."),    
                        h5("URL: http://f1000research.com/articles/2-191/v2.")
                        #tableOutput("Tabla33")
                        
                 ),
                 
#                 column(8,
                         column(11,leafletOutput("mymap", width = "1000", height = "800"),
                        h4("Los registros presentes en el mapa probienen del GBIF, con un máximo de 500"),
                        h4("Citation of leaflet package:"),
                        h5("Citation: : Joe Cheng and Yihui Xie (2016). Leaflet: Create Interactive web Maps with the JavaScript 'leaflet' Library"), 
                        h5("R package version 1.0.1.900."),    
                        h5("http://rstudio.github.io/leaflet/"))
                 )
                 
                 )
               #leafletOutput("mymap", width = "100%", height = "100%")
             )
         )) 
)



##############################

#shinyUI(bootstrapPage(
#  titlePanel("Taxonomic corrections"),
#  h6("We use two different packages in R to do almost the same analysis. The functions in R use different algorithm to correct"),
#  h6("mispelling or synonyms of flora."),
#  h3("Why Plant list?"),
#  h6("Plant list is a database with the support of Missouri Botanical Garden and the Royal Botanical Gardens, Kew"),
#  h4("Important notes:"),
#  h6("if you decide to use this plataform, please do credits to each package in R!"),
  
  
#  fluidRow(
#    column(3, 
#           textInput("text", label = h3("Plant Species"), 
#                     value = "Pinus cembroides")),
   
#    column(3,
#      h3("Actualizar"),
#     #actionButton("update", label = "Action"),
#      submitButton("Submit"),
#      br(),
#      br()
#    ),
#    column(6,
#           h4("Taxonstand package result:"),
#           tableOutput("TableL"),
#           h5("Citation of Taxonstand package:"),
#           h6("Cayuela, L. Granzow-de la Cerda,I. Albuquerque FS, Golicher DJ (2012),"), 
#           h6("taxonstand: An r package for species names stndardisation in vegetation database." ),   
#           h6("Methods in Ecology and Evolution, 3: 1078-1083." ),   
#           h6("doi: 10.1111/j.2041-210X2012.00232.X")
#    ),
#    column(2,
#           h4("taxize package result:"),
#           tableOutput("TableL1"),
#           h5("Citation of taxize package:"),
#           h6("Scott Chamberlain and Eduard Szocs (2013). taxize -"), 
#           h6("taxonomic search and retrieval in R. F1000Research, 2:191."),    
#           h6("URL: http://f1000research.com/articles/2-191/v2.")
#           #tableOutput("Tabla33")
           
#    ),
#    
#    column(10,h5("All sample points (dots) come from iNaturalist database"),
#      column(12,leafletOutput("mymap",height =  800)),
#      h4("Citation of leaflet package:"),
#      h6("Citation: : Joe Cheng and Yihui Xie (2016). Leaflet: Create Interactive web Maps with the JavaScript 'leaflet' Library"), 
#      h6("R package version 1.0.1.900."),    
#      h6("http://rstudio.github.io/leaflet/")
#    )
#    
#   
#  )
#  
#))
