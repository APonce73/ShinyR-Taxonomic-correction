library(shiny)

# Define server logic for slider examples
shinyServer(function(input, output, session) {
  
  TermsTaxonstand<-reactive({
   
   
    require(Taxonstand)
   
    VALOR<-input$text
    LL<- TPLck(VALOR)
    
    LLa<-LL[c(8,9,10,12,13,14)]
    FF<-as.data.frame(t(LLa))
    names(FF)[1]<-c("Taxonstand")
    Taxonstand1<-FF
    #print(Taxonstand1)
    
  })
    # Show the values using an HTML table
  
  TermsTaxize<-reactive({
    input$update
    require(taxize)
    library(curl)
    VALOR<-input$text
    #VALOR<-"gossipium hirsutum"
    LL1<- tnrs(query = VALOR, source = "iPlant_TNRS")
    
    LL1a<-as.data.frame(t(LL1))
    names(LL1a)[1]<-c("taxize")
    taxize1<-LL1a
    #print(taxize1)  
      
    })
  Termsinat<-reactive({
    input$update
    
    require(rinat)
    library(ggmap)
    library(ggplot2)
    require(taxize)
    VALOR<-input$text
    LL1<- tnrs(query = VALOR, source = "iPlant_TNRS")
    LL1a<-as.data.frame(t(LL1))
    VALOR1<-LL1$matchedname
    #VALOR<-levels(taxize1[4,1])[2]
    Data1 <- get_inat_obs(query=VALOR1, quality="research")
    
    #Data1
    #Data1$scientific_name
    #names(Data1)
    #El primer renglon son los datos de Nestor
    
    map <- get_map(location = "Mexico", zoom = 5, source = "google")
    p <- ggmap(map, fullpage = TRUE)
    p
    #Ahora adicionamos los datos
    p+ geom_point(aes(x = longitude, y = latitude, colour = scientific_name), size=3,data = Data1)
    
  })

  output$TableL<-renderTable({
    TermsTaxonstand()
  })
  output$TableL1<-renderTable({
    TermsTaxize()
  })
  output$map1<-renderPlot({
    Termsinat()
  })
})
  
