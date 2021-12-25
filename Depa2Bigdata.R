#setwd "es el espacio de trabajo"





#Importando Librerias
#instal.packages("rvest")("xml2")(tidyverse)(ggplot2)



library("xml2")
library("rvest")
library("tidyverse")
library("ggplot2")





#guardando la pagina web
PaginaSuperAficionados <- ("https://www.superaficionados.com/")




PaginaCineSA <- ("https://www.superaficionados.com/cine/")
PaginaComicsSA <- ("https://www.superaficionados.com/comics/")
PaginaSeriesSA <- ("https://www.superaficionados.com/series/")
PaginaAnimesSA <- ("https://www.superaficionados.com/animes/")
PaginaJuegosSA <- ("https://www.superaficionados.com/juegos/")



#Leyendo el codigo de Super Aficionados



Pagina_SA <- read_html(PaginaSuperAficionados)
Pagina_Cine <- read_html(PaginaCineSA)
Pagina_Comics <- read_html(PaginaComicsSA)
Pagina_Series <- read_html(PaginaSeriesSA)
Pagina_Animes <- read_html(PaginaAnimesSA)
Pagina_Juegos <- read_html(PaginaJuegosSA)




#PAGINA INICIO SUPERAFICIONADO
#Entrando a los links de los articulos mas populares




lINKSA.POPULARES <- html_nodes(Pagina_SA,"a")
lINKSA.POPULARES <- html_attr(lINKSA.POPULARES, "href")




LINKS <- "https://cdn.superaficionados.com/"



LISTA_LINKS <- list()
for (x in lINKSA.POPULARES) {
  
  
  
  LISTA_LINKS <- c(LINKS,x)
  print(LISTA_LINKS)
}


LISTA_LINKS <- gsub("  "," ",LISTA_LINKS)


#titulos de los Articulos Populares 
Titulos.Populares <- html_nodes(Pagina_SA, ".card-content")
Titulos.Popu <- html_text(Titulos.Populares, ".title")



LISTA_Titulos <- list()
for (x in Titulos.Popu) {
  
  
  
  LISTA_Titulos <- c(LINKS,x)
  print(LISTA_Titulos)
}


# Obteniendo los Link de los articulos mas recientes

MASRECIENTES <- html_nodes(Pagina_SA, "a")
Link_MASRECIENTES <- html_attr(MASRECIENTES, "href")
print(Link_MASRECIENTES)


LISTA_LinkR <- list()
for (x in Link_MASRECIENTES) {
  
  
  
  LISTA_LinkR <- c(LINKS,x)
  print(LISTA_LinkR)
}

# Obteniendo los Titulos de los articulos mas recientes
MASRECIENTES <- html_nodes(Pagina_SA, "a")
Titulos_MASRECIENTES <- html_text(MASRECIENTES, ".title")

LISTA_TitulosR <- list()
for (x in Titulos_MASRECIENTES) {
  
  
  
  LISTA_TitulosR <- c(LINKS,x)
  print(LISTA_TitulosR)
}



SuperAfiRecientes <- data.frame(Link=Link_MASRECIENTES,
                                
                                Titulos=Titulos_MASRECIENTES)



view(SuperAfiRecientes)


#CATEGORIA CINE


for (PaginaCine in 1:9) {
  # Leyendo pagina

PaginaCinesSA <- read_html(paste("https://www.superaficionados.com/cine/",Pagina_Cine,sep = ""))
  
  # Obteniendo la clase listing_thumbs
Articulos_Cine <- html_nodes(Pagina_Cine, css=".articles")

# Obteniendo los Titulos de los articulos mas recientes

print(Articulos_Cine)
TITLECINE.MASRECIENTE <- html_nodes(Articulos_Cine, "a")
TITLECINE.MASRECIENTE <- html_nodes(TITLECINE.MASRECIENTE, ".title")
TITLECINE.MASRECIENTE <- html_text(TITLECINE.MASRECIENTE)
print(TITLECINE.MASRECIENTE)
TITLECINE.MASRECIENTE <- gsub("\n","",TITLECINE.MASRECIENTE)
TITLECINE.MASRECIENTE <- gsub("\t","",TITLECINE.MASRECIENTE)
TITLECINE.MASRECIENTE <- gsub("  "," ",TITLECINE.MASRECIENTE)
TITLECINE.MASRECIENTE <- gsub("  "," ",TITLECINE.MASRECIENTE)
TITLECINE.MASRECIENTE <- gsub("  "," ",TITLECINE.MASRECIENTE)



# Obteniendo los Link de los articulos mas recientes

lINKCINE.MASRECIENTES <- html_nodes(Articulos_Cine, "a")
lINKCINE.MASRECIENTES <- html_nodes(lINKCINE.MASRECIENTES, "img")
print(lINKCINE.MASRECIENTES)




#popular
#Titulos Mas Populares Del Cine

Cine_Popu <- html_nodes(Pagina_Cine, css=".sidebar")
print(html_text(Cine_Popu))
Articulos_PopuC <- html_nodes(Cine_Popu, css=".articles")
print(Articulos_PopuC)
TITLECINE.POPULARES <- html_nodes(Articulos_PopuC, "a")
TITLECINE.POPULARES <- html_nodes(TITLECINE.POPULARES, ".title")
print(TITLECINE.POPULARES)
TITLECINE.POPULARES <- gsub("\n","",TITLECINE.POPULARES)
TITLECINE.POPULARES <- gsub("\t","",TITLECINE.POPULARES)
TITLECINE.POPULARES <- gsub("  "," ",TITLECINE.POPULARES)
TITLECINE.POPULARES <- gsub("  "," ",TITLECINE.POPULARES)
TITLECINE.POPULARES <- gsub("  "," ",TITLECINE.POPULARES)
print(TITLECINE.POPULARES)

#Link cine Popular
CineRecientes <- data.frame(Link=lINKCINE.MASRECIENTES,
                              Titulos=TITLECINE.MASRECIENTE)
LINKCINE.POPULARES <- html_nodes(Articulos_PopuC, "a")
LINKCINE.POPULARES <- html_nodes(LINKCINE.POPULARES, "img")
print(LINKCINE.POPULARES)

for (ArticuloCine in 2:length(TITLECINE.MASRECIENTE)) {
  print(paste("##################################### INIT: ARTICULO", ArticuloCine- 1 , " - PAGINA", PaginaCine, "############################################"))
  print(TITLECINE.MASRECIENTE[ArticuloCine - 1])
}
}


CINEPopulares <- data.frame(Link=LINKCINE.POPULARES,
                            
                            TITLECINE.POPULARES)


CINERecientes <- data.frame(Link=lINKCINE.MASRECIENTES,
                                
                                TITLECINE.MASRECIENTE)


# separar cada una de las palabras y ver su frecuencia
# separand
todoCineMasReciente <- paste(TITLECINE.MASRECIENTE,collapse=" ")

print(todoCineMasReciente)

#LIMPIANDO
todoCineMasReciente <- tolower(todoCineMasReciente)

#separar cada una de las palabras y ver su frecuencia
# separando
todo.CineMasReciente <- strsplit(todoCineMasReciente," ")[[1]]
print(todo.CineMasReciente)
# filtrando registros
todo.CineMasReciente <- todo.CineMasReciente[todo.CineMasReciente != 'de']
todo.CineMasReciente <- todo.CineMasReciente[todo.CineMasReciente != 'las']
todo.CineMasReciente <- todo.CineMasReciente[todo.CineMasReciente != 'la']
todo.CineMasReciente <- todo.CineMasReciente[todo.CineMasReciente != 'del']
todo.CineMasReciente <- todo.CineMasReciente[todo.CineMasReciente != 'en']
todo.CineMasReciente <- todo.CineMasReciente[todo.CineMasReciente != 'palabras']
todo.CineMasReciente <- todo.CineMasReciente[todo.CineMasReciente != '35']
todo.CineMasReciente <- todo.CineMasReciente[todo.CineMasReciente != '22']
todo.CineMasReciente <- todo.CineMasReciente[todo.CineMasReciente != '2021']
todo.CineMasReciente <- todo.CineMasReciente[todo.CineMasReciente != '20']
todo.CineMasReciente <- todo.CineMasReciente[todo.CineMasReciente != '17']
todo.CineMasReciente <- todo.CineMasReciente[todo.CineMasReciente != '23']
todo.CineMasReciente <- todo.CineMasReciente[todo.CineMasReciente != '36']
todo.CineMasReciente <- todo.CineMasReciente[todo.CineMasReciente != '23']
todo.CineMasReciente <- todo.CineMasReciente[todo.CineMasReciente != '36']
todo.CineMasReciente <- todo.CineMasReciente[todo.CineMasReciente != '43']
todo.CineMasReciente <- todo.CineMasReciente[todo.CineMasReciente != '27']
todo.CineMasReciente <- todo.CineMasReciente[todo.CineMasReciente != 'los']
todo.CineMasReciente <- todo.CineMasReciente[todo.CineMasReciente != 'que']
todo.CineMasReciente <- todo.CineMasReciente[todo.CineMasReciente != 'películas']
todo.CineMasReciente <- todo.CineMasReciente[todo.CineMasReciente != 'ver']
todo.CineMasReciente <- todo.CineMasReciente[todo.CineMasReciente != 'el']
todo.CineMasReciente <- todo.CineMasReciente[todo.CineMasReciente != 'venom']
todo.CineMasReciente <- todo.CineMasReciente[todo.CineMasReciente != 'mexicanas']
todo.CineMasReciente <- todo.CineMasReciente[todo.CineMasReciente != '¿quién']
todo.CineMasReciente <- todo.CineMasReciente[todo.CineMasReciente != '¿conoces']
todo.CineMasReciente <- todo.CineMasReciente[todo.CineMasReciente != 'mejores']
todo.CineMasReciente <- todo.CineMasReciente[todo.CineMasReciente != 'para']
todo.CineMasReciente <- todo.CineMasReciente[todo.CineMasReciente != 'más']
todo.CineMasReciente <- todo.CineMasReciente[todo.CineMasReciente != 'es']
todo.CineMasReciente <- todo.CineMasReciente[todo.CineMasReciente != 'y']
todo.CineMasReciente <- todo.CineMasReciente[todo.CineMasReciente != '2020']
todo.CineMasReciente <- todo.CineMasReciente[todo.CineMasReciente != '70']
# convirtiendo en DataFrame
dftodo.CineMasReciente <- data.frame(palabras=todo.CineMasReciente)

# haciendo un grafico
ggplot(dftodo.CineMasReciente,aes(x=palabras)) +
  geom_bar() +
  coord_flip()


#CATEGORIA COMICS


for (PaginaComics in 1:9) {
  # Leyendo pagina
  
  PaginaComicsSA <- read_html(paste("https://www.superaficionados.com/comics/",Pagina_Comics,sep = ""))
  
  # Obteniendo la clase listing_thumbs
  Articulos_Comics <- html_nodes(PaginaComicsSA, css=".articles")
  
  # Obteniendo los Titulos de los articulos mas recientes
  
  print(Articulos_Comics)
  TITLECOMICS.MASRECIENTE <- html_nodes(Articulos_Comics, "a")
  TITLECOMICS.MASRECIENTE <- html_nodes(TITLECOMICS.MASRECIENTE, ".title")
  TITLECOMICSMASRECIENTE <- html_text(TITLECOMICS.MASRECIENTE)
  print(TITLECOMICSMASRECIENTE)
  TITLECOMICSMASRECIENTE <- gsub("\n","",TITLECOMICSMASRECIENTE)
  TITLECOMICSMASRECIENTE <- gsub("\t","",TITLECOMICSMASRECIENTE)
  TITLECOMICSMASRECIENTE <- gsub("  "," ",TITLECOMICSMASRECIENTE)
  TITLECOMICSMASRECIENTE <- gsub("  "," ",TITLECOMICSMASRECIENTE)
  TITLECOMICSMASRECIENTE <- gsub("  "," ",TITLECOMICSMASRECIENTE)
  
  
  
  # Obteniendo los Link de los articulos mas recientes
  
  lINKCOMICS.MASRECIENTES <- html_nodes(Articulos_Comics, "a")
  lINKCOMICS.MASRECIENTES <- html_nodes(lINKCOMICS.MASRECIENTES, "img")
  print(lINKCOMICS.MASRECIENTES)
  
  
  
  
  #popular
  #Titulos Mas Populares De los Comics
  
  Comics_Popu <- html_nodes(Pagina_Comics, css=".sidebar")
  print(html_text(Comics_Popu))
  Articulos_PopuComics <- html_nodes(Comics_Popu, css=".articles")
  print(Articulos_PopuComics)
  TITLECOMICS.POPULARES <- html_nodes(Articulos_PopuComics, "a")
  TITLECOMICS.POPULARES <- html_nodes(TITLECOMICS.POPULARES, ".title")
  print(TITLECOMICS.POPULARES)
  TITLECOMICS.POPULARES <- gsub("\n","",TITLECOMICS.POPULARES)
  TITLECOMICS.POPULARES <- gsub("\t","",TITLECOMICS.POPULARES)
  TITLECOMICS.POPULARES <- gsub("  "," ",TITLECOMICS.POPULARES)
  TITLECOMICS.POPULARES <- gsub("  "," ",TITLECOMICS.POPULARES)
  TITLECOMICS.POPULARES <- gsub("  "," ",TITLECOMICS.POPULARES)
  print(TITLECOMICS.POPULARES)
  
  #Link Comics Popular
  
  LINKCOMICS.POPULARES <- html_nodes(Articulos_PopuComics, "a")
  LINKCOMICS.POPULARES <- html_nodes(LINKCOMICS.POPULARES, "img")
  print(LINKCOMICS.POPULARES)
  
  for (ArticuloComics in 2:length(TITLECOMICSMASRECIENTE)) {
    print(paste("##################################### INIT: ARTICULO", ArticuloComics - 1 , " - PAGINA", PaginaComics, "############################################"))
    print(TITLECOMICSMASRECIENTE[ArticuloComics - 1])
  }
}

TITULOSCINEPOPU <- (TITLECINE.POPULARES)

COMICSPopulares <- data.frame(Link=LINKCINE.POPULARES,
                              
                              TITLECINE.POPULARES)


COMICSRecientes <- data.frame(Link=lINKCOMICS.MASRECIENTES,
                              
                              TITLECOMICS.MASRECIENTE)





#TITULOS COMICS MAS RECIENTE ANALISIS DE TEXTO

# separar cada una de las palabras y ver su frecuencia
# separando
todoComicsMasPopulares <- paste(TITLECOMICS.POPULARES,collapse=" ")

print(todoComicsMasPopulares)

#LIMPIANDO
todoComicsMasPopulares <- tolower(todoComicsMasPopulares)

#separar cada una de las palabras y ver su frecuencia
# separando
todoComicsMasPopulares <- strsplit(todoComicsMasPopulares," ")[[1]]
table(todoComicsMasPopulares)
# filtrando registros
todoComicsMasPopulares <- todoComicsMasPopulares[todoComicsMasPopulares != "</span>"]
todoComicsMasPopulares <- todoComicsMasPopulares[todoComicsMasPopulares != 'class="title">descubre']
todoComicsMasPopulares <- todoComicsMasPopulares[todoComicsMasPopulares != 'class="title">las']
todoComicsMasPopulares <- todoComicsMasPopulares[todoComicsMasPopulares != 'class="title">los']
todoComicsMasPopulares <- todoComicsMasPopulares[todoComicsMasPopulares != '<span']
todoComicsMasPopulares <- todoComicsMasPopulares[todoComicsMasPopulares !='los']
todoComicsMasPopulares <- todoComicsMasPopulares[todoComicsMasPopulares != 'sus']
todoComicsMasPopulares <- todoComicsMasPopulares[todoComicsMasPopulares  != 'del']
todoComicsMasPopulares <- todoComicsMasPopulares[todoComicsMasPopulares  != 'completa)</span>']
todoComicsMasPopulares <- todoComicsMasPopulares[todoComicsMasPopulares  != 'de']
todoComicsMasPopulares <- todoComicsMasPopulares[todoComicsMasPopulares  != 'más']
todoComicsMasPopulares <- todoComicsMasPopulares[todoComicsMasPopulares  != 'el']


# convirtiendo en DataFrame
dftodoComicsMasPopulares <- data.frame(palabras=todoComicsMasPopulares)


# haciendo un grafico
ggplot(dftodoComicsMasPopulares,aes(x=palabras)) +
  geom_bar() +
  coord_flip()


data_filtrado <- filter(dftodoComicsMasPopulares,todoComicsMasPopulares != 1)
table(data_filtrado)
 

max(dftodoComicsMasReciente$todoComicsReciente)
TablaComics <- table(dftodoComicsMasReciente)
      
view



dftodoComicsMasReciente%>%
  filter(todoComicsMasReciente, frecuencia != 1) %>%
  arrange(desc(todoComicsMasReciente))




ggplot(filtradoValormaximo, aes(x=categoria, y=precioNormal)) +
  geom_boxplot() +
  coord_flip()



#SERIES


for (PaginaSeries in 1:9) {
  # Leyendo pagina
  
  PaginaSeriesSA <- read_html(paste("https://www.superaficionados.com/series/",Pagina_Series,sep = ""))
  
  # Obteniendo la clase listing_thumbs
  Articulos_Series <- html_nodes(PaginaSeriesSA, css=".articles")
  
  # Obteniendo los Titulos de los articulos mas recientes
  
  print(Articulos_Series)
  TITLESERIES.MASRECIENTE <- html_nodes(Articulos_Series, "a")
  TITLESERIES.MASRECIENTE <- html_nodes(TITLESERIES.MASRECIENTE, ".title")
  TITLESERIES.MASRECIENTE <- html_text(TITLESERIES.MASRECIENTE)
  print(TITLESERIES.MASRECIENTE)
  TITLESERIES.MASRECIENTE <- gsub("\n","",TITLESERIES.MASRECIENTE)
  TITLESERIES.MASRECIENTE <- gsub("\t","",TITLESERIES.MASRECIENTE)
  TITLESERIES.MASRECIENTE <- gsub("  "," ",TITLESERIES.MASRECIENTE)
  TITLESERIES.MASRECIENTE <- gsub("  "," ",TITLESERIES.MASRECIENTE)
  TITLESERIES.MASRECIENTE <- gsub("  "," ",TITLESERIES.MASRECIENTE)
  
  
  
  # Obteniendo los Link de los articulos mas recientes
  
  lINKSERIES.MASRECIENTES <- html_nodes("Articulos_Series")
  lINKSERIES.MASRECIENTES <- html_nodes(lINKSERIES.MASRECIENTES, "img")
  print(lINKSERIES.MASRECIENTE)
  
  
  
#popular
#Titulos Mas Populares De los Comics
  
  Series_Popu <- html_nodes(Pagina_Series, css=".sidebar")
  print(html_text(Series_Popu))
  Articulos_PopuSeries <- html_nodes(Series_Popu, css=".articles")
  print(Articulos_PopuSeries)
  TITLESERIES.POPULARES <- html_nodes(Articulos_PopuSeries, "a")
  TITLESERIES.POPULARES <- html_nodes(TITLESERIES.POPULARES, ".title")
  print(TTITLESERIES.POPULARES)
  TITLESERIES.POPULARES <- gsub("\n","",TITLESERIES.POPULARES)
  TITLESERIES.POPULARES <- gsub("\t","",TITLESERIES.POPULARES)
  TITLESERIES.POPULARES <- gsub("  "," ",TITLESERIES.POPULARES)
  TITLESERIES.POPULARES <- gsub("  "," ",TITLESERIES.POPULARES)
  TITLESERIES.POPULARES <- gsub("  "," ",TITLESERIES.POPULARES)
  print(TITLESERIES.POPULARES)
  
  #Link series Popular
  
  LINKSERIES.POPULARES <- html_nodes(Articulos_PopuSeries, "a")
  LINKSERIES.POPULARES <- html_nodes(LINKSERIES.POPULARES, "img")
  print(LINKSERIES.POPULARES)
  
  for (ArticuloSeries in 2:length(TITLESERIES.MASRECIENTE)) {
    print(paste("##################################### INIT: ARTICULO", ArticuloSeries - 1 , " - PAGINA", PaginaSeries, "############################################"))
    print(TITLESERIES.MASRECIENTE. [ArticuloSeries- 1])
  }
}

#TITULOS SERIES MAS POPULARES ANALISIS DE TEXTO

# separar cada una de las palabras y ver su frecuencia
# separando
todoSeriesMasPopulares <- paste(TITLESERIES.,collapse=" ")

print(todoComicsMasPopulares)

#LIMPIANDO
todoComicsMasPopulares <- tolower(todoComicsMasPopulares)

#separar cada una de las palabras y ver su frecuencia
# separando
todoComicsMasPopulares <- strsplit(todoComicsMasPopulares," ")[[1]]
table(todoComicsMasPopulares)
# filtrando registros
todoComicsMasPopulares <- todoComicsMasPopulares[todoComicsMasPopulares != "</span>"]
todoComicsMasPopulares <- todoComicsMasPopulares[todoComicsMasPopulares != 'class="title">descubre']
todoComicsMasPopulares <- todoComicsMasPopulares[todoComicsMasPopulares != 'class="title">las']
todoComicsMasPopulares <- todoComicsMasPopulares[todoComicsMasPopulares != 'class="title">los']
todoComicsMasPopulares <- todoComicsMasPopulares[todoComicsMasPopulares != '<span']
todoComicsMasPopulares <- todoComicsMasPopulares[todoComicsMasPopulares !='los']
todoComicsMasPopulares <- todoComicsMasPopulares[todoComicsMasPopulares != 'sus']
todoComicsMasPopulares <- todoComicsMasPopulares[todoComicsMasPopulares  != 'del']
todoComicsMasPopulares <- todoComicsMasPopulares[todoComicsMasPopulares  != 'completa)</span>']
todoComicsMasPopulares <- todoComicsMasPopulares[todoComicsMasPopulares  != 'de']
todoComicsMasPopulares <- todoComicsMasPopulares[todoComicsMasPopulares  != 'más']
todoComicsMasPopulares <- todoComicsMasPopulares[todoComicsMasPopulares  != 'el']


# convirtiendo en DataFrame
dftodoComicsMasPopulares <- data.frame(palabras=todoComicsMasPopulares)


# haciendo un grafico
ggplot(dftodoComicsMasPopulares,aes(x=palabras)) +
  geom_bar() +
  coord_flip()


#ANIMES

for (PaginaAnime in 1:9) {
  # Leyendo pagina
  
  PaginaAnimeSA <- read_html(paste("https://www.superaficionados.com/animes/",Pagina_Animes,sep = ""))
  
  # Obteniendo la clase listing_thumbs
  Articulos_Anime <- html_nodes(PaginaAnimeSA, css=".articles")
  
  # Obteniendo los Titulos de los articulos mas recientes
  
  print(Articulos_Anime)
  TITLEANIME.MASRECIENTE <- html_nodes(Articulos_Anime, "a")
  TITLEANIME.MASRECIENTE <- html_nodes(TITLEANIME.MASRECIENTE, ".title")
  TITLEANIME.MASRECIENTE <- html_text(TITLEANIME.MASRECIENTE)
  print(TITLEANIME.MASRECIENTE)
  TITLEANIME.MASRECIENTE <- gsub("\n","",TITLEANIME.MASRECIENTE)
  TITLEANIME.MASRECIENTE <- gsub("\t","",TITLEANIME.MASRECIENTE)
  TITLEANIME.MASRECIENTE <- gsub("  "," ",TITLEANIME.MASRECIENTE)
  TITLEANIME.MASRECIENTE <- gsub("  "," ",TITLEANIME.MASRECIENTE)
  TITLEANIME.MASRECIENTE <- gsub("  "," ",TITLEANIME.MASRECIENTE)
  
  
  
  # Obteniendo los Link de los articulos mas recientes
  
  lINKANIME.MASRECIENTE <- html_nodes(Articulos_Anime, "a")
  lINKANIME.MASRECIENTE <- html_nodes(lINKANIME.MASRECIENTE, "img")
  print(lINKANIME.MASRECIENTE)
  
  
  
  
  #popular
  #Titulos Mas Populares De los Comics
  
  Anime_Popu <- html_nodes(Pagina_Animes, css=".sidebar")
  print(html_text(Anime_Popu))
  Articulos_PopuAnime <- html_nodes(Anime_Popu, css=".articles")
  print(Articulos_PopuAnime)
  TITLEANIME.POPULARES <- html_nodes(Articulos_PopuComics, "a")
  TITLEANIME.POPULARES <- html_nodes(TITLEANIME.POPULARES, ".title")
  print(TITLEANIME.POPULARES)
  TITLEANIME.POPULARES <- gsub("\n","",TITLEANIME.POPULARES)
  TITLEANIME.POPULARES <- gsub("\t","",TITLEANIME.POPULARES)
  TITLEANIME.POPULARES <- gsub("  "," ",TITLEANIME.POPULARES)
  TITLEANIME.POPULARES <- gsub("  "," ",TITLEANIME.POPULARES)
  TITLEANIME.POPULARES <- gsub("  "," ",TITLEANIME.POPULARES)
  print(TITLEANIME.POPULARES)
  
  #Link Comics Popular
  
  LINKANIME.POPULARES <- html_nodes(Articulos_PopuAnime, "a")
  LINKANIME.POPULARES <- html_nodes(LINKANIME.POPULARES, "img")
  print(LINKANIME.POPULARES)
  
  for (ArticuloAnime in 2:length(TITLEANIME.MASRECIENTE)) {
    print(paste("##################################### INIT: ARTICULO", ArticuloAnime - 1 , " - PAGINA", PaginaAnime, "############################################"))
    print(TITLEANIME.MASRECIENTE[ArticuloAnime - 1])
  }
}













#JUEGOS
for (PaginaJuegos in 1:9) {
  # Leyendo pagina
  
  PaginaJuegosSA <- read_html(paste("https://www.superaficionados.com/juegos/",Pagina_Juegos,sep = ""))
  
  # Obteniendo la clase listing_thumbs
  Articulos_Juegos <- html_nodes(PaginaJuegosSA, css=".articles")
  
  # Obteniendo los Titulos de los articulos mas recientes
  
  print(Articulos_Juegos)
  TITLEJUEGOS.MASRECIENTE <- html_nodes(Articulos_Juegos, "a")
  TITLEJUEGOS.MASRECIENTE <- html_nodes(TITLEJUEGOS.MASRECIENTE, ".title")
  TITLEJUEGOS.MASRECIENTE <- html_text(TITLEJUEGOS.MASRECIENTE)
  print(TITLEJUEGOS.MASRECIENTE)
  TITLEJUEGOS.MASRECIENTE <- gsub("\n","",TITLEJUEGOS.MASRECIENTE)
  TITLEJUEGOS.MASRECIENTE <- gsub("\t","",TITLEJUEGOS.MASRECIENTE)
  TITLEJUEGOS.MASRECIENTE <- gsub("  "," ",TITLEJUEGOS.MASRECIENTE)
  TITLEJUEGOS.MASRECIENTE <- gsub("  "," ",TITLEJUEGOS.MASRECIENTE)
  TITLEJUEGOS.MASRECIENTE <- gsub("  "," ",TITLEJUEGOS.MASRECIENTE)
  
  
  
  # Obteniendo los Link de los articulos mas recientes
  
  lINKJUEGOS.MASRECIENTES <- html_nodes(Articulos_Juegos, "a")
  lINKJUEGOS.MASRECIENTES <- html_nodes(lINKJUEGOS.MASRECIENTES, "img")
  print(lINKJUEGOS.MASRECIENTES)
  
  
  
  
  #popular
  #Titulos Mas Populares De los Comics
  
  Juegos_Popu <- html_nodes(Pagina_Juegos, css=".sidebar")
  print(html_text(Juegos_Popu))
  Articulos_PopuJuegos <- html_nodes(Juegos_Popu, css=".articles")
  print(Articulos_PopuJuegos)
  TITLEJUEGOS.POPULARES <- html_nodes(Articulos_PopuJuegos, "a")
  TITLEJUEGOS.POPULARES <- html_nodes(TITLEJUEGOS.POPULARES, ".title")
  print(TITLEJUEGOS.POPULARES)
  TITLEJUEGOS.POPULARES <- gsub("\n","",TITLEJUEGOS.POPULARES)
  TITLEJUEGOS.POPULARES <- gsub("\t","",TITLEJUEGOS.POPULARES)
  TITLEJUEGOS.POPULARES <- gsub("  "," ",TITLEJUEGOS.POPULARES)
  TITLEJUEGOS.POPULARES <- gsub("  "," ",TITLEJUEGOS.POPULARES)
  TITLEJUEGOS.POPULARES <- gsub("  "," ",TITLEJUEGOS.POPULARES)
  print(TITLEJUEGOS.POPULARES)
  
  #Link Comics Popular
  
  LINKJUEGOS.POPULARES <- html_nodes(Articulos_PopuJuegos, "a")
  LINKJUEGOS.POPULARES <- html_nodes(LINKJUEGOS.POPULARES, "img")
  print(LINKJUEGOS.POPULARES)
  
  for (ArticuloJuegos in 2:length(TITLEJUEGOS.MASRECIENTE)) {
    print(paste("##################################### INIT: ARTICULO", ArticuloJuegos - 1 , " - PAGINA", PaginaJuegos, "############################################"))
    print(TITLEJUEGOS.MASRECIENTE[ArticuloJuegos - 1])
  }
}

