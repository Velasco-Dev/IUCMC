
############################################################
# PRACTICA INTRODUCTORIA DE ESTADISTICA DESCRIPTIVA EN R
# Curso: Estadística Descriptiva
# Objetivo:
# 1. Introducir el uso básico de R
# 2. Cargar una base de datos
# 3. Explorar variables cualitativas y cuantitativas
# 4. Construir tablas de frecuencias
# 5. Calcular medidas descriptivas
# 6. Realizar gráficas básicas con R base
############################################################
#1+1*20
##############################
# 0. LIMPIEZA DEL ENTORNO
##############################

# Elimina los objetos guardados en memoria
rm(list = ls())

# Limpia la consola (en RStudio a veces funciona mejor con Ctrl + L)
cat("\014")

##############################
# 1. DIRECTORIO DE TRABAJO
##############################

# Muestra la carpeta de trabajo actual
#getwd()

# Si deseas cambiar la carpeta de trabajo, usa setwd().
# IMPORTANTE: cambia la ruta por una existente en tu computador.
# Ejemplo en Windows:
# setwd("C:/Users/TuUsuario/Documents/PracticaR")

setwd("D:/GitHub/IUCMC/lll/Estadística Descriptiva/PR")

# Verificamos nuevamente la carpeta actual
getwd()

##############################
# 2. CARGAR UNA BASE DESDE CSV
##############################

# Ahora cargamos la base desde el archivo CSV recién creado.
base <- read.csv("base_estadistica_descriptiva_100_registros.csv",
                 header = TRUE,
                 stringsAsFactors = FALSE)

#Variables:
#Cualitativa Dicotomica (sexo)
#Cuantitativa Continua (horas_estudio)

#Dimensión
dim(base)
#Encabezado
head(base)
#Nombres de las variables
names(base)
#Acceso a variables específicas 
base$sexo
#Asignamiento a una variable específica - Cargar como vector
VSBase <- base$sexo
#Variable continua
VEBase <- base$edad
VPBase <- base$promedio
#Tipo de dato del elemento
class(base)
class(VSBase)
class(VEBase)
class(VPBase)

# Si aparecen errores de codificación de tíldes
# base <- read.csv("base_estadistica_descriptiva_100_registros.csv",
#                   fileEncoding = "UTF-8",
#                   stringsAsFactors = FALSE)


# Ver los primeros datos
#head(base)

# Estructura (Resumen de la base de datos o DF)
#str(base)

# Cargar La base eligiendo desde explorador de archivos
#base <- read.csv(file.choose(), header = TRUE, stringsAsFactors = FALSE)


##############################
# 3. CARGAR UNA BASE DESDE .xlsx
##############################

# Es necesario cargar un paquete externo (Esto se hace solo una vez)
#install.packages("readxl")

# una vez instalado es necesario llamar la librería 
library(readxl)

# Leer el archivo
baseExcel <- read_excel("base_estadistica_descriptiva_100_registros.xlsx")

# si hay varias hojas
base <- read_excel("base_estadistica_descriptiva_100_registros.xlsx",
                   sheet = "datos")




##############################
# 4. EXPLORACION INICIAL DE LA BASE
##############################

# Estructura de la base:
# muestra nombres de variables, tipo de dato y algunos ejemplos
str(base)

# Nombres de las variables
names(base)

# Dimensión de la base: filas y columnas
dim(base)

# Número de filas
nrow(base)

# Número de columnas
ncol(base)

# Resumen general
summary(base)

#Resumen de una variable
summary(base$edad)
summary(VEBase)

#Promedio
mean(base$promedio)

##############################
# 5. CONVERTIR VARIABLES CATEGORICAS
##############################

# R puede manejar texto, pero para análisis categórico es mejor
# convertir ciertas variables a factor.

#Cada dato es una categoría <-factor (Esa variable que sea de tipo factor (Categoría no ordinal))
base$sexo <- factor(base$sexo)
base$transporte <- factor(base$transporte)
base$beca <- factor(base$beca)

# Para la variable ordinal, definimos un orden lógico (Se definen los niveles) (Ordinal):
base$satisfaccion_r <- factor(base$satisfaccion_r,
                              levels = c("Baja", "Media", "Alta"),
                              ordered = TRUE)

# Verificamos nuevamente la estructura
str(base)

##############################
# 6. ANALISIS DE VARIABLES CATEGORICAS
##############################

#Creación de Tabla (Porcentaje) = Para variables cualitativas
table(base$sexo)/dim(base)[1]
table(base$sexo)/length(base$sexo)

table(base$transporte)/length(base$transporte)

### 6.1 Tabla de frecuencias absolutas

tabla_sexo <- table(base$sexo)
tabla_sexo

tabla_transporte <- table(base$transporte)
tabla_transporte

tabla_beca <- table(base$beca)
tabla_beca

tabla_satisfaccion <- table(base$satisfaccion_r)
tabla_satisfaccion

### 6.2 Frecuencias relativas

prop.table(tabla_sexo)
prop.table(tabla_transporte)
prop.table(tabla_beca)
prop.table(tabla_satisfaccion)

### 6.3 Frecuencias porcentuales

100 * prop.table(tabla_sexo)
100 * prop.table(tabla_transporte)
100 * prop.table(tabla_beca)
100 * prop.table(tabla_satisfaccion)

### 6.4 Tabla completa para una variable categórica

frec_abs <- table(base$transporte)
frec_rel <- prop.table(frec_abs)
frec_por <- 100 * frec_rel
tabla_completa_transporte <- data.frame(
  Frecuencia = as.vector(frec_abs),
  Proporcion = as.vector(frec_rel),
  Porcentaje = as.vector(frec_por)
)

#Otra forma de hacerlo (Menos completa)
cbind(frec_abs, frec_rel)

#Tabla completa transporte
tabla_completa_transporte

rownames(tabla_completa_transporte) <- names(frec_abs)
##Acceder a uno específico
rownames(tabla_completa_transporte)[4] <- "Coche"

tabla_completa_transporte

##############################
# 7. GRAFICAS PARA VARIABLES CATEGORICAS
##############################

# Grafico de barras para sexo
barplot(tabla_sexo,
        main = "Distribucion por sexo",
        xlab = "Sexo",
        ylab = "Frecuencia")

#Ver en ventana (Windows)
windows()
# Grafico de barras para transporte
barplot(tabla_transporte,
        main = "Medio de transporte",
        xlab = "Transporte",
        ylab = "Frecuencia", col="black")

# Diagrama de sectores para beca
pie(tabla_beca,
    main = "Distribucion de beca")

# Barras para variable ordinal
barplot(tabla_satisfaccion,
        main = "Nivel de satisfaccion con R",
        xlab = "Satisfaccion",
        ylab = "Frecuencia")

##############################
# 8. ANALISIS DE VARIABLES CUANTITATIVAS
##############################

# Empezaremos con la variable 'edad'

edad <- base$edad

# Tamaño de muestra
length(edad)

# Minimo y maximo
min(edad)
max(edad)

# Rango
max(edad) - min(edad)

# Media
mean(edad)

# Mediana
median(edad)

# Moda:
# R base no trae una funcion directa para la moda estadistica,
# así que construiremos una función sencilla.
moda <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

moda(edad)

# Varianza
var(edad)

# Desviacion estandar
sd(edad)

# Cuantiles
quantile(edad)

# Resumen general
summary(edad)

##############################
# 9. ANALISIS DE OTRA VARIABLE CUANTITATIVA
##############################

# Ahora con 'promedio'

prom <- base$promedio

mean(prom)
median(prom)
moda(prom)
var(prom)
sd(prom)
summary(prom)
quantile(prom)



##############################
# 10. TABLA DE FRECUENCIAS PARA UNA VARIABLE CUANTITATIVA DISCRETA
##############################

# Con la variable 'semestre'
tabla_semestre <- table(base$semestre)
tabla_semestre

prop.table(tabla_semestre)
100 * prop.table(tabla_semestre) #Porcentual

barplot(tabla_semestre,
        main = "Distribucion por semestre",
        xlab = "Semestre",
        ylab = "Frecuencia")

##############################
# 11. TABLA AGRUPADA POR STURGES
##############################

# Vamos a construir una tabla agrupada para la variable 'horas_estudio'

x <- base$horas_estudio

# Tamaño de muestra
n <- length(x)
n

# Regla de Sturges:
# k = 1 + 3.322 * log10(n)
k <- 1 + 3.322 * log10(n)
k

# Número de clases: redondeamos al entero superior
k <- ceiling(k)
k

#Redondear a número decimal o entero
round(k)
round(k,3)

# Rango
R <- max(x) - min(x)
R

# Amplitud de clase
A <- R / k
A

# Construimos los intervalos
breaks <- seq(from = min(x), to = max(x), length.out = k + 1)
breaks

#secuencias de números
seq(1,40)
1:40

# Clasificamos los datos en los intervalos (cut= corta y a cada dato le asigna un intervalo)
intervalos <- cut(x, breaks = breaks, include.lowest = TRUE, right = FALSE)

# Tabla de frecuencias absolutas
fi <- table(intervalos)
fi

# Frecuencia relativa
hi <- prop.table(fi)

# Frecuencia acumulada
Fi <- cumsum(fi)

#Demostración del funcionamiento
TY <- 1:40
sum(TY)
cumsum(TY)

# Frecuencia relativa acumulada
Hi <- cumsum(hi)

# Tabla final agrupada
tabla_sturges <- data.frame(
  Intervalo = names(fi),
  fi = as.vector(fi),
  hi = as.vector(hi),
  porcentaje = 100 * as.vector(hi),
  Fi = as.vector(Fi),
  Hi = as.vector(Hi)
)

tabla_sturges

##############################
# 12. GRAFICAS PARA VARIABLES CUANTITATIVAS
##############################

# Histograma de horas de estudio (Variables cuantitativas de preferencia continuas)
hist(base$horas_estudio,
     main = "Histograma de horas de estudio",
     xlab = "Horas de estudio por semana",
     ylab = "Frecuencia", col="purple")

# Boxplot de horas de estudio
# Agrupación central - 
boxplot(base$horas_estudio,
        main = "Boxplot de horas de estudio",
        ylab = "Horas de estudio")

# Histograma del promedio
hist(base$promedio,
     main = "Histograma del promedio academico",
     xlab = "Promedio",
     ylab = "Frecuencia")

# Boxplot del promedio (No hay atípicos)
boxplot(base$promedio,
        main = "Boxplot del promedio academico",
        ylab = "Promedio")

##############################
# 13. GRAFICOS COMPARATIVOS
##############################

# Boxplot del promedio segun sexo
boxplot(promedio ~ sexo, data = base,
        main = "Promedio segun sexo",
        xlab = "Sexo",
        ylab = "Promedio")

# Boxplot de horas de estudio segun beca
boxplot(horas_estudio ~ beca, data = base,
        main = "Horas de estudio segun beca",
        xlab = "Beca",
        ylab = "Horas de estudio")


# Boxplot de horas de estudio segun beca
boxplot(horas_estudio ~ beca , data = base,
        main = "Horas de estudio segun beca",
        xlab = "Beca",
        ylab = "Horas de estudio")


#boxplot(base$horas_estudio,
#        base$promedio,
#        base$edad,
#        main = "Comparación de variables",
#        names = c("Horas estudio", "Promedio", "Edad"),
#        ylab = "Valores")



# Diagrama de dispersion entre horas de estudio y promedio
plot(base$horas_estudio, base$promedio,
     main = "Relacion entre horas de estudio y promedio",
     xlab = "Horas de estudio",
     ylab = "Promedio",
     pch = 19)

# Agregamos una linea de tendencia sencilla
abline(lm(promedio ~ horas_estudio, data = base), lwd = 2)

##############################
# 14. TABLAS CRUZADAS
##############################

# Tabla cruzada entre sexo y beca
tabla_cruzada1 <- table(base$sexo, base$beca)
tabla_cruzada1

# Proporciones por fila
prop.table(tabla_cruzada1, margin = 1)

# Proporciones por columna
prop.table(tabla_cruzada1, margin = 2)

# Tabla cruzada entre transporte y satisfaccion
tabla_cruzada2 <- table(base$transporte, base$satisfaccion_r)
tabla_cruzada2

##############################
# 15. IDENTIFICAR VARIABLES NUMERICAS Y CATEGORICAS
##############################

# Esto ayuda a reconocer variables por su tipo en R.

class(base$sexo)

sapply(base, class)

# Variables numéricas
numericas <- sapply(base, is.numeric)
numericas

# Variables categóricas
categoricas <- sapply(base, is.factor)
categoricas

# Subconjunto solo con variables numéricas
base_numerica <- base[, numericas]
base_numerica

##############################
# 16. RESUMEN DESCRIPTIVO DE TODAS LAS NUMERICAS
##############################

summary(base_numerica)

# Media de todas las variables numéricas
sapply(base_numerica, mean)

# Mediana
sapply(base_numerica, median)

# Desviación estándar
sapply(base_numerica, sd)

# Varianza
sapply(base_numerica, var)

##############################
# 17. COMENTARIOS FINALES 
##############################

# Ideas clave:
# 1. str() permite conocer la estructura de la base
# 2. table() sirve para tablas de frecuencia
# 3. prop.table() permite proporciones
# 4. mean(), median(), var(), sd() calculan indicadores descriptivos
# 5. hist(), boxplot(), barplot(), pie(), plot() generan gráficas básicas
# 6. cut() permite agrupar datos en intervalos
# 7. summary() da un resumen rápido de las variables

