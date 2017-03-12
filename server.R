library(shiny)
library(leaflet)
library(RColorBrewer)



# Define server logic for slider examples
shinyServer(function(input, output, session) {
  
  TermsTaxonstand <- reactive({
   
   
    require(Taxonstand)
   
    VALOR <- input$text
    #VALOR <- c("Acacia Angustissima")
    LL <- TPLck(VALOR)
    t(LL)
    LLa <- LL[c(8,9,10,12,13,14)]
    t(LLa)
    #vec1 <- as.vector(names(LLa))
    FF <- as.data.frame(t(LLa))
    dim(FF)
    names(FF)[1] <- c("Taxonstand")
    Taxonstand1 <- FF
    
    
  })
    # Show the values using an HTML table
  
  TermsTaxize <- reactive({
    input$update
    require(taxize)
    library(curl)
    VALOR <- input$text
    #VALOR<-"gossipium hirsutum"
    LL1 <- tnrs(query = VALOR, source = "iPlant_TNRS")
    
    LL1a <- as.data.frame(t(LL1))
    names(LL1a)[1] <- c("taxize")
    taxize1 <- LL1a
      
    })
  
  #For the MAP
  points <- reactive({
    input$update
    require(leaflet)
    require(spocc)
    #require(ggmap)
    #require(ggplot2)
    require(taxize)
    VALOR <- input$text
    LL1 <- tnrs(query = VALOR, source = "iPlant_TNRS")
    LL1
    LL1a <- as.data.frame(t(LL1))
    VALOR1 <- LL1$matchedname
    rm(LL1)
    #VALOR<-levels(taxize1[4,1])[2]
    #L <- c()
    #L2 <- c(input$gbif)
    #FF <- c(L,L2)
    
    LL2 <- occ(VALOR1, from = "gbif", has_coords = T)
    #LL2
    LL2 <- occ2df(LL2)
    str(LL2)
    #LL2
    LL2 <- na.omit(data.frame(LL2$longitude, LL2$latitude))
    names(LL2)[1] <- c("lng")
    names(LL2)[2] <- c("lat")
    
    #LL3 <- occ(VALOR1, from=input$gbif, has_coords=T)
    #LL3 <- occ2df(LL3)
    #LL3 <- data.frame(LL3$longitude, LL3$latitude)
    #names(LL3)[1] <- c("longitude")
    #names(LL3)[2] <- c("latitude")
    #LL4 <- rbind(LL2,LL3)
    #print(LL2)
    })
    
  
  output$mymap <- renderLeaflet({
    
    #pal3 <- pal2
    TTT <- sample(brewer.pal(8,"Dark2"),1)
    Goldberg <- points()
    #Goldberg <- LL2
    
    #Goldberg1 <-InterEstellar()
    leaflet(data = Goldberg) %>%
      clearShapes() %>%
      addTiles() %>%
      setView(lng=-101.383331, lat=22.583332, zoom=5, options=list(reset=T))%>%
      #addCircleMarkers(~longitude, ~latitude, radius=2, fillOpacity = 0.5, color=TTT[1])%>%
      addCircleMarkers(Goldberg$lng, Goldberg$lat, weight=4, radius=7, stroke=F, fillOpacity = 0.8, color=TTT[1],clusterOptions = markerClusterOptions())%>%
      #addMeasure(primaryLengthUnit = "kilometers", primaryAreaUnit = "hectares",activeColor = '#FF00FF')%>%
      #addProviderTiles("OpenStreetMap.DE")
      addProviderTiles("OpenStreetMap.HOT")
    #addPolygons(stroke=F, smoothFactor=0, fillColor='#FF00FF', fillOpacity=0.7, data=points())
    #mapOptions(zoomToLimits="first")
    #addCircleMarkers(~longitude, ~latitude, popup =paste(sep = " ","Altitud=",as.factor(TableL$Altitud), "msnm","Altura del maiz",as.factor(TableL$Altura_de_planta),"cm"), radius=3, fillOpacity = 0.5, color=UUUH())
  })
  
  
#  output$Ceratti2 <- renderPrint({
#    summary(Ceratti1())
#  })  
  
  
  output$TableL <- renderTable(
    print(TermsTaxonstand()), rownames = T)
  
  output$TableL1 <- renderTable(
    print(TermsTaxize()), rownames = T
  )
#  output$Tabla33 <- renderTable({
#    Goldberg <- points()
#    print(Goldberg)
#  })
  output$map <- renderPlot({
    mymap()
  })
})
  
