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


lINKCINE.POPULARES <- html_nodes(Pagina_Cine,"a")
lINKCINE.POPULARES <- html_attr(lINKCINE.POPULARES, "href")




LINKSCINE <- "https://cdn.superaficionados.com/cine"



LISTACINE_LINKS <- list()
for (x in lINKCINE.POPULARES) {
  
  
  
  LISTACINE_LINKS <- c(LINKSCINE,x)
  print(LISTACINE_LINKS)
}


LISTACINE_LINKS <- gsub("  "," ",LISTACINE_LINKS)


#titulos de los Articulos Populares 
TitulosCine.Populares <- html_nodes(Pagina_Cine, ".card-content")
TitulosCine.Popu <- html_text(TitulosCine.Populares, ".title")



LISTA_Titulos <- list()
for (x in TitulosCine.Popu) {
  
  
  
  LISTA_TitulosCine <- c(LINKSCINE,x)
  print(LISTA_TitulosCine)
}


# Obteniendo los Link de los articulos mas recientes

CINEMASRECIENTES <- html_nodes(Pagina_Cine, "a")
LinkCINE_MASRECIENTES <- html_attr(CINEMASRECIENTES, "href")
print(LinkCINE_MASRECIENTES)


LISTA_LinkCINE <- list()
for (x in LinkCINE_MASRECIENTES) {
  
  
  
  LISTA_LinkCINE <- c(LINKSCINE,x)
  print(LISTA_LinkCINE)
}

# Obteniendo los Titulos de los articulos mas recientes
CINEMASRECIENTES <- html_nodes(Pagina_Cine, "a")
TitulosCine_MASRECIENTES <- html_text(CINEMASRECIENTES, ".title")

LISTA_TitulosCine <- list()
for (x in TitulosCine_MASRECIENTES) {
  
  
  
  LISTA_TitulosCine <- c(LINKSCINE,x)
  print(LISTA_TitulosCine)
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


lINKCOMICS.POPULARES <- html_nodes(Pagina_Comics,"a")
lINKCOMICS.POPULARES <- html_attr(lINKCOMICS.POPULARES, "href")




LINKSCOMICS <- "https://cdn.superaficionados.com/comics"



LISTACOMICS_LINKS <- list()
for (x in lINKCOMICS.POPULARES) {
  
  
  
  LISTACOMICS_LINKS <- c(LINKSCOMICS,x)
  print(LISTACOMICS_LINKS)
}


LISTACOMICS_LINKS <- gsub("  "," ",LISTACOMICS_LINKS)


#titulos de los Articulos Populares 
TitulosComics.Populares <- html_nodes(Pagina_Comics, ".card-content")
TitulosComics.Popu <- html_text(TitulosComics.Populares, ".title")



LISTA_TitulosComics <- list()
for (x in TitulosComics.Popu) {
  
  
  
  LISTA_TitulosComics <- c(LINKSCOMICS,x)
  print(LISTA_TitulosComics)
}


# Obteniendo los Link de los articulos mas recientes

COMICSMASRECIENTES <- html_nodes(Pagina_Comics, "a")
LinkCOMICS_MASRECIENTES <- html_attr(COMICSMASRECIENTES, "href")
print(LinkCOMICS_MASRECIENTES)


LISTA_LinkCOMICS <- list()
for (x in LinkCOMICS_MASRECIENTES) {
  
  
  
  LISTA_LinkCOMICS <- c(LINKSCOMICS,x)
  print(LISTA_LinkCOMICS)
}

# Obteniendo los Titulos de los articulos mas recientes
COMICSMASRECIENTES <- html_nodes(Pagina_Comics, "a")
TitulosComics_MASRECIENTES <- html_text(COMICSMASRECIENTES, ".title")

LISTA_TitulosComics <- list()
for (x in TitulosComics_MASRECIENTES) {
  
  
  
  LISTA_TitulosComics <- c(LINKSCOMICS,x)
  print(LISTA_TitulosComics)
}



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




#SERIES

lINKSERIES.POPULARES <- html_nodes(Pagina_Series,"a")
lINKSERIES.POPULARES <- html_attr(lINKSERIES.POPULARES, "href")




LINKSSERIES <- "https://cdn.superaficionados.com/series"



LISTASERIES_LINKS <- list()
for (x in lINKSERIES.POPULARES) {
  
  
  
  LISTASERIES_LINKS <- c(LINKSSERIES,x)
  print(LISTASERIES_LINKS)
}


LISTASERIES_LINKS <- gsub("  "," ",LISTASERIES_LINKS)


#titulos de los Articulos Populares 
TitulosSeries.Populares <- html_nodes(Pagina_Series, ".card-content")
TitulosSeries.Popu <- html_text(TitulosSeries.Populares, ".title")



LISTASERIES_Titulos <- list()
for (x in TitulosSeries.Popu) {
  
  
  
  LISTASERIES_Titulos <- c(LINKSSERIES,x)
  print(LISTASERIES_Titulos)
}


# Obteniendo los Link de los articulos mas recientes

SERIESMASRECIENTES <- html_nodes(Pagina_Series, "a")
LinkSERIES_MASRECIENTES <- html_attr(SERIESMASRECIENTES, "href")
print(LinkSERIES_MASRECIENTES)


LISTA_LinkSERIES <- list()
for (x in LinkSERIES_MASRECIENTES) {
  
  
  
  LISTA_LinkSERIES <- c(LINKSSERIES,x)
  print(LISTA_LinkSERIES)
}


# Obteniendo los Titulos de los articulos mas recientes
SERIESMASRECIENTES <- html_nodes(Pagina_Series, "a")
TitulosSeries_MASRECIENTES <- html_text(SERIESMASRECIENTES, ".title")

LISTA_TitulosSeries <- list()
for (x in TitulosSeries_MASRECIENTES) {
  
  
  
  LISTA_TitulosSeries <- c(LINKSSERIES,x)
  print(LISTA_TitulosSeries)
}


#TITULOS SERIES MAS POPULARES ANALISIS DE TEXTO

# separar cada una de las palabras y ver su frecuencia
# separando
todoSeriesMasPopulares <- paste(TitulosSeries.Popu,collapse=" ")

print(todoSeriesMasPopulares)

#LIMPIANDO
todoSeriesMasPopulares <- tolower(todoSeriesMasPopulares)

# separando
todoSeriesMasPopulares <- strsplit(todoSeriesMasPopulares," ")[[1]]
table(todoSeriesMasPopulares)
# filtrando registros
todoSeriesMasPopulares <- todoSeriesMasPopulares[todoSeriesMasPopulares != "para"]
todoSeriesMasPopulares <- todoSeriesMasPopulares[todoSeriesMasPopulares != 'los']
todoSeriesMasPopulares <- todoSeriesMasPopulares[todoSeriesMasPopulares != 'lo']
todoSeriesMasPopulares <- todoSeriesMasPopulares[todoSeriesMasPopulares != ',']
todoSeriesMasPopulares <- todoSeriesMasPopulares[todoSeriesMasPopulares != 'las']
todoSeriesMasPopulares <- todoSeriesMasPopulares[todoSeriesMasPopulares !='esperar']
todoSeriesMasPopulares <- todoSeriesMasPopulares[todoSeriesMasPopulares != "espera"]
todoSeriesMasPopulares <- todoSeriesMasPopulares[todoSeriesMasPopulares  != 'del']
todoSeriesMasPopulares <- todoSeriesMasPopulares[todoSeriesMasPopulares  != 'de']
todoSeriesMasPopulares <- todoSeriesMasPopulares[todoSeriesMasPopulares  != 'debes']
todoSeriesMasPopulares <- todoSeriesMasPopulares[todoSeriesMasPopulares != 'más']
todoSeriesMasPopulares <- todoSeriesMasPopulares[todoSeriesMasPopulares  != 'el']


# convirtiendo en DataFrame
dftodoSeriesMasPopulares <- data.frame(palabras=todoSeriesMasPopulares)


# haciendo un grafico
ggplot(dftodoSeriesMasPopulares,aes(x=palabras)) +
  geom_bar() +
  coord_flip()



#ANIME

lINKANIME.POPULARES <- html_nodes(Pagina_Animes,"a")
lINKANIME.POPULARES <- html_attr(lINKANIME.POPULARES, "href")




LINKSANIME <- "https://cdn.superaficionados.com/anime"



LISTAANIME_LINKS <- list()
for (x in lINKANIME.POPULARES) {
  
  
  
  LISTAANIME_LINKS <- c(LINKSANIME,x)
  print(LISTAANIME_LINKS)
}


#titulos de los Articulos Populares 
TitulosAnime.Populares <- html_nodes(Pagina_Animes, ".card-content")
TitulosAnime.Popu <- html_text(TitulosAnime.Populares, ".title")



LISTA_TitulosAnime <- list()
for (x in TitulosAnime.Popu) {
  
  
  
  LISTA_TitulosAnime <- c(LINKSCINE,x)
  print(LISTA_TitulosAnime)
}


# Obteniendo los Link de los articulos mas recientes

ANIMEMASRECIENTES <- html_nodes(Pagina_Animes, "a")
LinkANIME_MASRECIENTES <- html_attr(ANIMEMASRECIENTES, "href")
print(LinkANIME_MASRECIENTES)


LISTA_LinkANIME <- list()
for (x in LinkANIME_MASRECIENTES) {
  
  
  
  LISTA_LinkANIME <- c(LINKSANIME,x)
  print(LISTA_LinkANIME)
}


LISTA_LinkANIME <- gsub("  "," ",LISTA_LinkANIME)

# Obteniendo los Titulos de los articulos mas recientes
ANIMEMASRECIENTES <- html_nodes(Pagina_Animes, "a")
TitulosAnime_MASRECIENTES <- html_text(ANIMEMASRECIENTES, ".title")

LISTA_TitulosAnime <- list()
for (x in TitulosAnime_MASRECIENTES) {
  
  
  
  LISTA_TitulosAnime <- c(LINKSANIME,x)
  print(LISTA_TitulosAnime)
}

#TITULOS ANIMES MAS POPULARES ANALISIS DE TEXTO

# separar cada una de las palabras y ver su frecuencia
# separando
todoAnimeMasReciente <- paste(TitulosAnime_MASRECIENTES,collapse=" ")

print(todoAnimeMasReciente)


#LIMPIANDO
todoAnimeMasReciente <- tolower(todoAnimeMasReciente)

# separando
todoAnimeMasReciente <- strsplit(todoAnimeMasReciente," ")[[1]]
table(todoAnimeMasReciente)
# filtrando registros
todoAnimeMasReciente <- todoAnimeMasReciente[todoAnimeMasReciente != "para"]
todoAnimeMasReciente <- todoAnimeMasReciente[todoAnimeMasReciente != 'los']
todoAnimeMasReciente <- todoAnimeMasReciente[todoAnimeMasReciente != 'lo']
todoAnimeMasReciente <- todoAnimeMasReciente[todoAnimeMasReciente != ',']
todoAnimeMasReciente <- todoAnimeMasReciente[todoAnimeMasReciente != 'las']
todoAnimeMasReciente <- todoAnimeMasReciente[todoAnimeMasReciente !='esperar']
todoAnimeMasReciente <- todoAnimeMasReciente[todoAnimeMasReciente != "espera"]
todoAnimeMasReciente <- todoAnimeMasReciente[todoAnimeMasReciente != 'del']
todoAnimeMasReciente <- todoAnimeMasReciente[todoAnimeMasReciente  != 'de']
todoAnimeMasReciente <- todoAnimeMasReciente[todoAnimeMasReciente  != 'debes']
todoAnimeMasReciente <- todoAnimeMasReciente[todoAnimeMasReciente != 'más']
todoAnimeMasReciente <- todoAnimeMasReciente[todoAnimeMasReciente  != 'el']


# convirtiendo en DataFrame
dftodoSeriesMasPopulares <- data.frame(palabras=todoSeriesMasPopulares)


# haciendo un grafico
ggplot(dftodoSeriesMasPopulares,aes(x=palabras)) +
  geom_bar() +
  coord_flip()


#JUEGOS

lINKJUEGOS.POPULARES <- html_nodes(Pagina_Juegos,"a")
lINKJUEGOS.POPULARES <- html_attr(lINKJUEGOS.POPULARES, "href")




LINKSJUEGOS <- "https://cdn.superaficionados.com/juegos"



LISTAJUEGOS_LINKS <- list()
for (x in lINKJUEGOS.POPULARES) {
  
  
  
  LISTAJUEGOS_LINKS <- c(LINKSJUEGOS,x)
  print(LISTAJUEGOS_LINKS)
}


#titulos de los Articulos Populares 
TitulosJuegos.Populares <- html_nodes(Pagina_Juegos, ".card-content")
TitulosJuegos.Popu <- html_text(TitulosJuegos.Populares, ".title")



LISTA_TitulosJuegos <- list()
for (x in TitulosJuegos.Popu) {
  
  
  
  LISTA_TitulosJuegos <- c(LINKSJUEGOS,x)
  print(LISTA_TitulosJuegos)
}


# Obteniendo los Link de los articulos mas recientes

JUEGOSMASRECIENTES <- html_nodes(Pagina_Juegos, "a")
LinkJUEGOS_MASRECIENTES <- html_attr(JUEGOSMASRECIENTES, "href")
print(LinkJUEGOS_MASRECIENTES)


LISTA_LinkJUEGOS <- list()
for (x in LinkJUEGOS_MASRECIENTES) {
  
  
  
  LISTA_LinkJUEGOS <- c(LINKSJUEGOS,x)
  print(LISTA_LinkJUEGOS)
}


LISTA_LinkJUEGOS <- gsub("  "," ",LISTA_LinkJUEGOS)

# Obteniendo los Titulos de los articulos mas recientes
JUEGOSMASRECIENTES <- html_nodes(Pagina_Juegos, "a")
TitulosJuegos_MASRECIENTES <- html_text(JUEGOSMASRECIENTES, ".title")

LISTA_TitulosJuegos <- list()
for (x in TitulosJuegos_MASRECIENTES) {
  
  
  
  LISTA_TitulosJuegos <- c(LINKSCINE,x)
  print(LISTA_TitulosJuegos)
}



#TITULOS JUEGOS MAS POPULARES ANALISIS DE TEXTO

# separar cada una de las palabras y ver su frecuencia
# separando
todoJuegosMasPopulares <- paste(TitulosJuegos.Popu,collapse=" ")

print(todoJuegosMasPopulares)

#LIMPIANDO
todoJuegosMasPopulares <- tolower(todoJuegosMasPopulares)

# separando
todoJuegosMasPopulares <- strsplit(todoJuegosMasPopulares," ")[[1]]
table(todoJuegosMasPopulares)
# filtrando registros
todoJuegosMasPopulares <- todoJuegosMasPopulares[todoJuegosMasPopulares != "para"]
todoJuegosMasPopulares <- todoJuegosMasPopulares[todoJuegosMasPopulares != 'los']
todoJuegosMasPopulares <- todoJuegosMasPopulares[todoJuegosMasPopulares != 'lo']
todoJuegosMasPopulares <- todoJuegosMasPopulares[todoJuegosMasPopulares != ',']
todoJuegosMasPopulares <- todoJuegosMasPopulares[todoJuegosMasPopulares != 'las']
todoJuegosMasPopulares <- todoJuegosMasPopulares[todoJuegosMasPopulares !='esperar']
todoJuegosMasPopulares <- todoJuegosMasPopulares[todoJuegosMasPopulares != "espera"]
todoJuegosMasPopulares <- todoJuegosMasPopulares[todoJuegosMasPopulares  != 'del']
todoJuegosMasPopulares <- todoJuegosMasPopulares[todoJuegosMasPopulares  != 'de']
todoJuegosMasPopulares <- todoJuegosMasPopulares[todoJuegosMasPopulares  != 'debes']
todoJuegosMasPopulares <- todoJuegosMasPopulares[todoJuegosMasPopulares != 'más']
todoJuegosMasPopulares <- todoJuegosMasPopulares[todoJuegosMasPopulares  != 'el']


# convirtiendo en DataFrame
dftodoJuegosMasPopulares <- data.frame(palabras=todoJuegosMasPopulares)


table(dftodoJuegosMasPopulares)

# haciendo un grafico
ggplot(dftodoJuegosMasPopulares,aes(x=palabras)) +
  geom_bar() +
  coord_flip()

#DATASFRAME




DFTITULOS.POPULAR <- data.frame(TITULOSANIME=TitulosAnime.Populares,TITULOSCINE=TitulosCine.Populares,TITULOSSERIES=TitulosSeries.Populares)
