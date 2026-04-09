############################################################
# PRACTICA DE ESTADISTICA DESCRIPTIVA EN R: SESIÓN 2
# Curso: Estadística Descriptiva
############################################################

##############################
# 0. LIMPIEZA DEL ENTORNO
##############################
rm(list = ls())
cat("\014")

##############################
# 1. DIRECTORIO DE TRABAJO
##############################
getwd()

# Si hace falta, cambiar la carpeta:
setwd("D:/GitHub/IUCMC/lll/Estadística Descriptiva/Practica 2")

getwd()

##############################
# 2. CARGA DE LA BASE DESDE CSV
##############################

base <- read.csv("base_practica_descriptiva_1000.csv",
                 header = TRUE,
                 stringsAsFactors = FALSE,
                 fileEncoding = "UTF-8")


#install.packages("readxl") # o desde la consola
library(readxl)
base <- read_excel("base_practica_descriptiva_1000.xlsx")

dim(base)

##############################
# 3. GUARDAR Y CARGAR DATOS EN FORMATO .RData
##############################

# Guardar un solo objeto
save(base, file = "base_practica_descriptiva_1000.RData")

# Comprobar que el archivo quedó guardado en la carpeta de trabajo
list.files()

# Eliminar temporalmente el objeto de memoria
rm(base)

# Verificamos que ya no esté
ls()

# Cargar nuevamente el objeto desde .RData
load("base_practica_descriptiva_1000.RData")

# Verificamos que volvió a cargarse
ls()
head(base)

# También se pueden guardar varios objetos a la vez:
resumen_inicial <- summary(base)
dim_base <- dim(base)

save(base, resumen_inicial, dim_base, file = "objetos_practica.RData")

# Si después eliminamos todo:
rm(list = ls())
ls()

# Podemos recuperar todos los objetos guardados
load("objetos_practica.RData")
ls()

names(base)
sapply(base, class)

##############################
# 4. CONVERTIR VARIABLES
##############################
#variable categórica
base$sexo <- factor(base$sexo)
base$jornada <- factor(base$jornada)
base$programa <- factor(base$programa)
base$beca <- factor(base$beca)
base$trabaja <- factor(base$trabaja)
base$transporte <- factor(base$transporte)
base$modalidad_estudio <- factor(base$modalidad_estudio)
#Variable ordinal
base$satisfaccion_r <- factor(base$satisfaccion_r,
                              levels = c("Baja", "Media", "Alta"),
                              ordered = TRUE)

str(base)




############################################################
# MENCIÓN ESPECIAL: CONECTIVOS LOGICOS EN R
############################################################

# En R, los conectivos logicos se usan para combinar condiciones.
# Son fundamentales para filtrar datos y tomar decisiones.

# 1. OPERADOR AND (&)
# Significa: "Y"
# Se cumple solo si TODAS las condiciones son verdaderas

# Ejemplo:
x <- c(2, 5, 10, 15)

x > 3 & x < 12
# TRUE si el valor es mayor que 3 Y menor que 12

# 2. OPERADOR OR (|)
# Significa: "O"
# Se cumple si AL MENOS UNA condicion es verdadera

x > 8 | x < 3
# TRUE si el valor es mayor que 8 O menor que 3


# 3. OPERADOR NOT (!)
# Significa: "NO" o negacion
# Invierte el valor logico

y <- c(TRUE, FALSE, TRUE)

!y

# 4. USO EN BASES DE DATOS

# Filtrar datos:
# Ejemplo: estudiantes con promedio alto o muchas horas de estudio

B3 = base[base$promedio > 4 | base$horas_estudio > 15, ]
B33 <- base[base$promedio > 4 | base$horas_estudio > 15, ]

# Ejemplo: estudiantes que cumplen ambas condiciones

B4 = base[base$promedio > 4 & base$horas_estudio > 15, ]

sum(is.na(base))/dim(base)[1]

# Ejemplo: eliminar valores faltantes

BNA = base[!is.na(base$promedio), ]

sum(is.na(base$edad))

############################################################


##############################
# 5. REVISION DE DATOS FALTANTES
##############################

colSums(is.na(base))

# Porcentaje de faltantes por variable (Mean = Promedio por columna)
100 * colMeans(is.na(base))

# Base sin NA en promedio para algunos análisis puntuales
# Nos quedamos con las filas donde no hay faltantes en promedio
base_prom <- base[!is.na(base$promedio), ]


mean(na.omit(base$ingreso_hogar_millones))
#na.
##############################
# 6. MEDIDAS DESCRIPTIVAS AMPLIADAS
##############################
prom <- base$promedio

mean(prom, na.rm = TRUE)
median(prom, na.rm = TRUE)
sd(prom, na.rm = TRUE)
var(prom, na.rm = TRUE)

# Rango
max(prom, na.rm = TRUE) - min(prom, na.rm = TRUE)

# Coeficiente de variación
sd(prom, na.rm = TRUE) / mean(prom, na.rm = TRUE) * 100

# Cuartiles
quantile(prom, probs = c(0.25, 0.5, 0.75), na.rm = TRUE)

# Deciles (Partir en 10 partes)
quantile(prom, probs = seq(0.1, 0.9, by = 0.1), na.rm = TRUE)
# El 70% de los estudiantes tiene un promedio por debajo de 3,93

# Percentiles seleccionados
quantile(prom, probs = c(0.05, 0.95), na.rm = TRUE)
#el 5% de los estudiantes tiene un promedio por encima de 4,36

##############################
# 7. RESUMEN DE VARIAS NUMERICAS
##############################
numericas <- sapply(base, is.numeric)
base_num <- base[, numericas]

names(base_num)

summary(base_num)

#Aplicando función a base_num quitando los NA
sapply(base_num, mean, na.rm = TRUE)
sapply(base_num, median, na.rm = TRUE)
sapply(base_num, sd, na.rm = TRUE)

##############################
# 8. TABLAS DE FRECUENCIA
##############################
tabla_programa <- table(base$programa)
tabla_programa
prop.table(tabla_programa)
100 * prop.table(tabla_programa)

tabla_trabaja <- table(base$trabaja)
tabla_trabaja
100 * prop.table(tabla_trabaja)

##############################
# 9. GRAFICAS BASICAS ADICIONALES
##############################

# Histograma de asistencia
hist(base$asistencia,
     main = "Histograma de asistencia",
     xlab = "Porcentaje de asistencia",
     ylab = "Frecuencia")
# Histograma mas segmentado (Limite en el eje x)
hist(base$asistencia,
     main = "Histograma de asistencia",
     xlab = "Porcentaje de asistencia",
     ylab = "Frecuencia", xlim = c(0,100))

# Poligono de frecuencias simple (objeto)
h <- hist(base$horas_estudio, plot = FALSE)

class(h)

#Contenido de "h": h$
h$breaks

#?hist Ayuda

plot(h$mids, h$counts, type = "b",
     main = "Poligono de frecuencias: horas de estudio",
     xlab = "Horas de estudio",
     ylab = "Frecuencia")

plot(h)


# Ojiva simple
plot(cumsum(h$counts), type = "o",
     main = "Frecuencia acumulada de horas de estudio",
     xlab = "Clase",
     ylab = "Frecuencia acumulada")
#600 personas tienen menos de 10 horas de estudio.

# Boxplot de varias variables
boxplot(base$horas_estudio,
        base$horas_sueno,
        base$promedio,
        names = c("Horas estudio", "Horas sueño", "Promedio"),
        main = "Comparacion de variables")

##############################
# 10. VALORES ATIPICOS CON IQR
##############################
Q1 <- quantile(base$horas_estudio, 0.25, na.rm = TRUE)
Q3 <- quantile(base$horas_estudio, 0.75, na.rm = TRUE)
RIQ <- Q3 - Q1

lim_inf <- Q1 - 1.5 * RIQ
lim_sup <- Q3 + 1.5 * RIQ

lim_inf
lim_sup

atipicos <- base$horas_estudio[base$horas_estudio < lim_inf |
                                 base$horas_estudio > lim_sup]
atipicos







##############################
# 11. DESCRIPTIVA POR GRUPOS
##############################
# La función tapply() se utiliza para aplicar una función
# a subconjuntos de datos definidos por una variable categórica.
tapply(base$promedio, base$sexo, mean, na.rm = TRUE)

# Significa:
# 1. base$promedio->  variable numérica que queremos analizar
# 2. base$sexo -> variable categórica que define los grupos
# 3. mean -> función que se aplicará (media)
# 4. na.rm -> TRUE  : na remove


tapply(base$promedio, base$sexo, mean, na.rm = TRUE)
tapply(base$promedio, base$beca, mean, na.rm = TRUE)
tapply(base$horas_estudio, base$programa, mean, na.rm = TRUE)

# La función by() permite aplicar una función a una variable
# numérica, separando los datos por grupos definidos por una
# variable categórica.

by(base$promedio, base$sexo, summary)



##############################
# 12. TABLAS CRUZADAS
##############################
tabla1 <- table(base$programa, base$beca)
tabla1

# Porcentajes por fila
prop.table(tabla1, margin = 1)

# Porcentajes por columna
prop.table(tabla1, margin = 2)

tabla2 <- table(base$sexo, base$trabaja)
tabla2
100 * prop.table(tabla2)

##############################
# 13. GRAFICOS COMPARATIVOS
##############################
boxplot(promedio ~ programa, data = base,
        main = "Promedio por programa",
        xlab = "Programa",
        ylab = "Promedio")

boxplot(horas_estudio ~ trabaja, data = base,
        main = "Horas de estudio segun si trabaja",
        xlab = "Trabaja",
        ylab = "Horas de estudio")

##############################
# 14. RELACION ENTRE DOS VARIABLES NUMERICAS
##############################
plot(base$horas_estudio, base$promedio,
     main = "Relacion entre horas de estudio y promedio",
     xlab = "Horas de estudio",
     ylab = "Promedio",
     pch = 19)

abline(lm(promedio ~ horas_estudio, data = base), lwd = 2)


# Correlacion
cor(base$horas_estudio, base$promedio, use = "complete.obs")

##############################
# 15. SUBCONJUNTOS Y FILTROS
##############################
base_beca <- subset(base, beca == "Si")
dim(base_beca)

sis_trab <- subset(base, programa == "Ingenieria de Sistemas" & trabaja == "Si")
dim(sis_trab)

mean(sis_trab$promedio, na.rm = TRUE)

##############################
# 16. ORDENAR DATOS
##############################
base_ordenada <- base[order(base$promedio, decreasing = TRUE), ]
head(base_ordenada)

##############################
# 17. ACTIVIDAD
##############################
# Instrucciones:
# Resuelva los siguientes puntos usando R.
# Interprete brevemente cada resultado.

# 1. Construya una tabla de frecuencias para jornada.
# 2. Calcule media, mediana y desviación estándar para edad.
# 3. Haga un histograma de ingreso_hogar_millones.
# 4. Compare el promedio académico según beca con un boxplot.
# 5. Haga una tabla cruzada entre sexo y programa.
# 6. Calcule la correlación entre asistencia y promedio.
# 7. Identifique posibles valores atípicos en asistencia usando IQR.
# 8. Filtre los estudiantes de jornada nocturna y calcule su promedio medio.
# 9. Guarde la base y los resultados principales en un archivo .RData.
# 10. Cierre R, vuelva a cargar el archivo .RData y verifique que los objetos aparezcan otra vez.

############################################################
