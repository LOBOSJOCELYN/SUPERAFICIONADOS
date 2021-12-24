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

lINKSA.POPULARES <- html_nodes(Pagina_SA, ".article-no-img card-img card-img--5by4")
lINKSA.POPULARES <- html_nodes(Pagina_SA, "img")
print(lINKSA.POPULARES)

#titulos de los Articulos Populares 
Titulos.Populares <- html_nodes(Pagina_SA, ".card-content")
Titulos.Popu <- html_text(Titulos.Populares, ".title")
print(Titulos.Popu)



# Obteniendo los Link de los articulos mas recientes
Mas_Reciente <- html_nodes(Pagina_SA, css=".sidebar")
print(html_text(Mas_Reciente))
MasReciente <- html_nodes(Mas_Reciente, css=".article")
MASRECIENTES <- html_nodes(MasReciente, "a")
Link_MASRECIENTES <- html_attr(MASRECIENTES, "href")
print(Link_MASRECIENTES)

# Obteniendo los Titulos de los articulos mas recientes
Mas_Reciente <- html_nodes(Pagina_SA, css=".sidebar")
print(html_text(Mas_Reciente))
MasReciente <- html_nodes(Mas_Reciente, css=".article")
MASRECIENTES <- html_nodes(MasReciente, "a")
Titulos_MASRECIENTES <- html_text(MASRECIENTES, ".title")
print(Titulos_MASRECIENTES)


#CATEGORIA CINE


for (pagina in 1:9) {
  # Leyendo pagina

PaginaCinesSA <- read_html(paste("https://www.superaficionados.com/cine/",Pagina_Cine,sep = ""))
  
  # Obteniendo la clase listing_thumbs
Cine_pag <- html_nodes(Pagina_Cine, css=".main-content")

# Obteniendo los Titulos de los articulos mas recientes

Articulos_Cine <- html_nodes(Cine_pag, css=".articles")
print(Articulos_Cine)
TITLECINE.MASRECIENTE <- html_nodes(Articulos_Cine, "a")
TITLECINE.MASRECIENTE <- html_nodes(TITLECINE.MASRECIENTE, ".title")
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

Cine_Popu <- html_nodes(Cine_pag, css=".sidebar")
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

LINKCINE.POPULARES <- html_nodes(Articulos_PopuC, "a")
LINKCINE.POPULARES <- html_nodes(LINKCINE.POPULARES, "img")
print(LINKCINE.POPULARES)



for (articulo in 2:length(Cine_pag)) {
  print(paste("##################################### ARTICULO", articulo - 1 , " - PAGINA", pagina, "############################################"))
  print(html_nodes(TITLECINE.MASRECIENTE[articulo - 1]))

 }

}






#RECIENTE

Cine_pag <- html_nodes(Pagina_Cine, css=".main-content")
print(html_text(Cine_pag))
Articulos_Cine <- html_nodes(Cine_pag, css=".articles")
print(Articulos_Cine)
TITLECINE.MASRECIENTE <- html_nodes(Articulos_Cine, "a")
TITLECINE.MASRECIENTE <- html_text(TITLECINE.MASRECIENTE, ".title")
print(TITLECINE.MASRECIENTE)
TITLECINE.MASRECIENTE <- gsub("\n","",TITLECINE.MASRECIENTE)
TITLECINE.MASRECIENTE <- gsub("\t","",TITLECINE.MASRECIENTE)
TITLECINE.MASRECIENTE <- gsub("  "," ",TITLECINE.MASRECIENTE)
TITLECINE.MASRECIENTE <- gsub("  "," ",TITLECINE.MASRECIENTE)
TITLECINE.MASRECIENTE <- gsub("  "," ",TITLECINE.MASRECIENTE)



lINKCINE.MASRECIENTES <- html_nodes(Articulos_Cine, "a")
lINKCINE.MASRECIENTES <- html_nodes(lINKCINE.MASRECIENTES, "img")
print(lINKCINE.MASRECIENTES)

#popular

Cine_Popu <- html_nodes(Pagina_Cine, css=".sidebar")
print(html_text(Cine_Popu))
Articulos_PopuC <- html_nodes(Cine_Popu, css=".articles")
print(Articulos_PopuC)
TITLECINE.POPULARES <- html_nodes(Articulos_PopuC, "a")
TITLECINE.POPULARES <- html_text(TITLECINE.POPULARES, ".title")
print(TITLECINE.POPULARES)
TITLECINE.POPULARES <- gsub("\n","",TITLECINE.POPULARES)
TITLECINE.POPULARES <- gsub("\t","",TITLECINE.POPULARES)
TITLECINE.POPULARES <- gsub("  "," ",TITLECINE.POPULARES)
TITLECINE.POPULARES <- gsub("  "," ",TITLECINE.POPULARES)
TITLECINE.POPULARES <- gsub("  "," ",TITLECINE.POPULARES)
print(TITLECINE.POPULARES)



LINKCINE.POPULARES <- html_nodes(Articulos_PopuC, "a")
LINKCINE.POPULARES <- html_nodes(LINKCINE.POPULARES, "img")
print(LINKCINE.POPULARES)

# separar cada una de las palabras y ver su frecuencia
# separando
parrafo1Separado <- strsplit(TITLECINE.MASRECIENTE," ")[[1]]
parrafo2Separado <- strsplit(TITLECINE.MASRECIENTE," ")[[2]]
parrafo3Separado <- strsplit(TITLECINE.MASRECIENTE," ")[[3]]
parrafo4Separado <- strsplit(TITLECINE.MASRECIENTE," ")[[4]]
parrafo5Separado <- strsplit(TITLECINE.MASRECIENTE," ")[[5]]
parrafo6Separado <- strsplit(TITLECINE.MASRECIENTE," ")[[6]]
parrafo7Separado <- strsplit(TITLECINE.MASRECIENTE," ")[[7]]
parrafo8Separado <- strsplit(TITLECINE.MASRECIENTE," ")[[8]]
parrafo9Separado <- strsplit(TITLECINE.MASRECIENTE," ")[[9]]
parrafo10Separado <- strsplit(TITLECINE.MASRECIENTE," ")[[10]]
parrafo11Separado <- strsplit(TITLECINE.MASRECIENTE," ")[[11]]
parrafo12Separado <- strsplit(TITLECINE.MASRECIENTE," ")[[12]]


                                                      
print(parrafo8Separado)


# filtrando registros
parrafo8Separado <- parrafo8Separado[parrafo8Separado != 'de']
parrafo8Separado <- parrafo8Separado[parrafo8Separado != 'los']

# convirtiendo en DataFrame
dfParrafos8Separados <- data.frame(palabras=parrafo8Separado)

# haciendo un grafico
ggplot(dfParrafos8Separados,aes(x=palabras)) +
  geom_bar() +
  coord_flip()



