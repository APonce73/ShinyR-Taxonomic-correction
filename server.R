library(shiny)
library(leaflet)
library(RColorBrewer)



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
  
  #For the MAP
  points<-reactive({
    input$update
    require(leaflet)
    require(spocc)
    #require(ggmap)
    #require(ggplot2)
    require(taxize)
    VALOR<-input$text
    LL1<- tnrs(query = VALOR, source = "iPlant_TNRS")
    LL1a<-as.data.frame(t(LL1))
    VALOR1<-LL1$matchedname
    rm(LL1)
    #VALOR<-levels(taxize1[4,1])[2]
    
    LL2 <- occ(VALOR1, from="inat", has_coords=T)
    LL2 <- occ2df(LL2)
    LL2 <- data.frame(LL2$longitude, LL2$latitude)
    names(LL2)[1] <- c("longitude")
    names(LL2)[2] <- c("latitude")
    print(LL2)
    })
    
  
  output$mymap <- renderLeaflet({
    
    #pal3 <- pal2
    TTT <- sample(brewer.pal(8,"Dark2"),1)
    Goldberg <- points()
    #Goldberg1 <-InterEstellar() 
    leaflet(data = Goldberg) %>%
      clearShapes() %>%
      addTiles() %>%
      setView(lng=-101.383331, lat=22.583332, zoom=6, options=list(reset=T))%>%
      #addCircleMarkers(~longitude, ~latitude, radius=2, fillOpacity = 0.5, color=TTT[1])%>%
      addCircleMarkers(Goldberg$longitude, Goldberg$latitude, weight=4, radius=7, stroke=F, fillOpacity = 0.8, color=TTT[1],clusterOptions = markerClusterOptions())%>%
      #addMeasure(primaryLengthUnit = "kilometers", primaryAreaUnit = "hectares",activeColor = '#FF00FF')%>%
      #addProviderTiles("OpenStreetMap.DE")
      addProviderTiles("OpenStreetMap.HOT")
    #addPolygons(stroke=F, smoothFactor=0, fillColor='#FF00FF', fillOpacity=0.7, data=points())
    #mapOptions(zoomToLimits="first")
    #addCircleMarkers(~longitude, ~latitude, popup =paste(sep = " ","Altitud=",as.factor(TableL$Altitud), "msnm","Altura del maiz",as.factor(TableL$Altura_de_planta),"cm"), radius=3, fillOpacity = 0.5, color=UUUH())
  })
  
  

  output$TableL<-renderTable({
    TermsTaxonstand()
  })
  output$TableL1<-renderTable({
    TermsTaxize()
  })
  output$Tabla33<-renderTable({
    Goldberg <- points()
    print(Goldberg)
  })
  output$map1<-renderPlot({
    Termsinat()
  })
})
  
