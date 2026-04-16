############################################################
# PRACTICA DE ESTADISTICA DESCRIPTIVA EN R: SESIÓN 3
# Curso: Estadística Descriptiva
# Tema central:
# 1. Introducción paso a paso a ggplot2
# 2. Interpretación de gráficos
# 3. Descriptiva bivariada
# 4. Correlación y matriz de correlación
# 5. Heatmap de correlaciones
#
# Base utilizada en esta práctica:
# base_practica_3_ggplot_1800.csv
#
# NOTA:
# Esta base es sintética, pero fue construida con relaciones
# realistas de un contexto universitario.
############################################################

##############################
# 0. LIMPIEZA DEL ENTORNO
##############################

# Elimina objetos guardados en memoria
rm(list = ls())

# Limpia la consola
cat("\014")

##############################
# 1. DIRECTORIO DE TRABAJO
##############################

# Muestra la carpeta de trabajo actual
getwd()

# Si hace falta, cambia la carpeta de trabajo manualmente.
# IMPORTANTE: ajusta la ruta a una carpeta real de tu computador.
# Ejemplo:
setwd("D:/GitHub/IUCMC/lll/Estadística Descriptiva/Practica 3")

# Verificamos nuevamente la carpeta actual
getwd()

##############################
# 2. CARGA DE LA BASE DESDE CSV
##############################

# Leemos la base de datos principal.
# stringsAsFactors = FALSE evita que R convierta texto en factor
# automáticamente. Más adelante lo haremos de forma controlada.

library(readxl)
base <- read_excel("base_practica_3_ggplot_1800.xlsx")
#base <- read_excel("diccionario_base_practica_3.csv")

# Revisamos los primeros registros
head(base)

# Revisamos nombres de variables
names(base)

# Dimensión de la base: filas y columnas
dim(base)

##############################
# 3. CARGA DEL PAQUETE ggplot2
##############################

# Instalar ggplot2 solo una vez si no lo tienes:
install.packages("ggplot2")

# Cargamos la librería
library(ggplot2)

##############################
# 4. EXPLORACIÓN INICIAL DE LA BASE
##############################

# Estructura general de la base
str(base)

# Resumen rápido de todas las variables
summary(base)

# Revisamos datos faltantes por variable
colSums(is.na(base))

# También podemos ver el porcentaje de NA por variable
100 * colMeans(is.na(base))

##############################
# 5. CONVERTIR VARIABLES CATEGÓRICAS
##############################

# Convertimos a factor las variables cualitativas.
# Esto ayuda en análisis descriptivo y en gráficos.

base$sexo <- factor(base$sexo)
base$programa <- factor(base$programa)
base$jornada <- factor(base$jornada)
base$trabaja <- factor(base$trabaja)
base$beca <- factor(base$beca)
base$transporte <- factor(base$transporte)
base$modalidad_estudio <- factor(base$modalidad_estudio)

# Variables ordinales:
# Es importante definir un orden lógico.
base$nivel_estres <- factor(base$nivel_estres,
                            levels = c("Bajo", "Medio", "Alto"),
                            ordered = TRUE)

base$satisfaccion_programa <- factor(base$satisfaccion_programa,
                                     levels = c("Baja", "Media", "Alta"),
                                     ordered = TRUE)

# Confirmamos la nueva estructura
str(base)


TPrograma <- table(base$programa)
THEstudio <- hist(base$horas_estudio)

class(TPrograma)
class(THEstudio)

##############################
# 6. RECORDATORIO: LÓGICA BÁSICA DE ggplot2
##############################

# En ggplot2, un gráfico se construye por partes:
#
# 1. ggplot(data = base, aes(...))
#    -> indica la base de datos y qué variables se usarán
#
# 2. + geom_...()
#    -> indica cómo se representarán los datos
#
# 3. + labs(...)
#    -> agrega título y etiquetas
#
# 4. + theme_minimal()
#    -> mejora la apariencia general

# Ejemplo mínimo:

g0x <- ggplot(data = base, aes(x = promedio)) +
  geom_histogram()

g0y <- ggplot(data = base, aes(y = promedio)) +
  geom_histogram()

g00 <- ggplot(data = base, aes(x = promedio))

gBecaX <- ggplot(data = base, aes(x = beca)) +
  geom_bar()

gBecaXY <- ggplot(data = base, aes(x = beca, y=trabaja)) +
  geom_histogram() #No se puede hacer para historgrama

# Si el script se ejecuta completo, conviene usar print()
# para forzar la visualización del gráfico.
print(gBecaXY)

##############################
# 7. PRIMER GRÁFICO EN ggplot:
#    BARRAS PARA VARIABLE CATEGÓRICA
##############################

# Queremos ver la distribución del medio de transporte.
# Como la variable es categórica, usamos geom_bar().

g1 <- ggplot(data = base, aes(x = transporte)) +
  geom_bar(fill = "steelblue") +
  labs(title = "Distribución del medio de transporte",
       x = "Medio de transporte",
       y = "Frecuencia") +
  theme_dark()

print(g1)

# INTERPRETACIÓN:
# La altura de cada barra representa cuántos estudiantes hay
# en cada categoría de transporte.

##############################
# 8. HISTOGRAMA PARA VARIABLE NUMÉRICA
##############################

# Ahora analizamos la distribución de horas de estudio.
# Para variables numéricas continuas, usamos geom_histogram().

g2 <- ggplot(data = base, aes(x = horas_estudio)) +
  geom_histogram(binwidth = 2, fill = "tomato", color = "white") +
  labs(title = "Histograma de horas de estudio",
       x = "Horas de estudio por semana",
       y = "Frecuencia") +
  theme_minimal()

print(g2)

# INTERPRETACIÓN:
# El histograma ayuda a ver:
# - dónde se concentran los datos
# - si la distribución es simétrica o no
# - si hay valores extremos

##############################
# 9. BOXPLOT PARA UNA VARIABLE NUMÉRICA
##############################

# El boxplot resume la distribución con:
# - mediana
# - cuartiles
# - rango intercuartílico
# - posibles valores atípicos

g3 <- ggplot(data = base, aes(y = promedio)) +
  geom_boxplot(fill = "goldenrod1") +
  labs(title = "Boxplot del promedio académico",
       y = "Promedio") +
  theme_minimal()

print(g3)

# INTERPRETACIÓN:
# La línea dentro de la caja es la mediana.
# La caja contiene el 50% central de los datos.
# Los puntos fuera de los bigotes pueden interpretarse
# como posibles valores atípicos.

##############################
# 10. DENSIDAD (OPCIONAL Y MUY ÚTIL)
##############################

# Este gráfico también describe la forma de una distribución.
# Es una alternativa suave al histograma.

g4 <- ggplot(data = base, aes(x = promedio)) +
  geom_density(fill = "skyblue", alpha = 0.6) +
  labs(title = "Curva de densidad del promedio",
       x = "Promedio",
       y = "Densidad") +
  theme_minimal()

print(g4)

##############################
# 11. VARIABLE CATEGÓRICA vs CATEGÓRICA
#     GRÁFICO DE BARRAS AGRUPADAS
##############################

# Queremos comparar programa y beca.
# x = programa
# fill = beca
# position = "dodge" pone las barras una al lado de la otra

g5 <- ggplot(data = base, aes(x = programa, fill = beca)) +
  geom_bar(position = "dodge") +
  labs(title = "Beca según programa",
       x = "Programa",
       y = "Frecuencia",
       fill = "Beca") +
  theme_minimal()

print(g5)

# INTERPRETACIÓN:
# Este gráfico permite comparar, dentro de cada programa,
# cuántos estudiantes tienen beca y cuántos no.

##############################
# 12. TABLA CRUZADA DE APOYO
##############################

# Siempre es bueno complementar el gráfico con una tabla.

tabla_prog_beca <- table(base$programa, base$beca)
tabla_prog_beca

# Proporciones por fila:
# Dentro de cada programa, ¿qué proporción tiene beca?
prop.table(tabla_prog_beca, margin = 1)

##############################
# 13. VARIABLE CATEGÓRICA vs NUMÉRICA
#     BOXPLOT POR GRUPOS
##############################

# Ahora comparamos el promedio académico según si trabaja o no.
# Esto es un análisis bivariado:
# - variable explicativa: trabaja
# - variable numérica: promedio

g6 <- ggplot(data = base, aes(x = trabaja, y = promedio)) +
  geom_boxplot(fill = "mediumpurple1") +
  labs(title = "Promedio académico según si trabaja",
       x = "Trabaja",
       y = "Promedio") +
  theme_minimal()

print(g6)

# INTERPRETACIÓN:
# Aquí comparamos:
# - mediana de cada grupo
# - dispersión
# - presencia de atípicos
# Si una caja está más arriba que la otra, sugiere que
# ese grupo tiene valores mayores de promedio.

##############################
# 14. OTRO EJEMPLO CATEGÓRICA vs NUMÉRICA
##############################

# Horas de estudio según nivel de estrés

g7 <- ggplot(data = base, aes(x = nivel_estres, y = horas_estudio)) +
  geom_boxplot(fill = "darkseagreen2") +
  labs(title = "Horas de estudio según nivel de estrés",
       x = "Nivel de estrés",
       y = "Horas de estudio") +
  theme_minimal()

print(g7)

##############################
# 15. VARIABLE NUMÉRICA vs NUMÉRICA
#     DIAGRAMA DE DISPERSIÓN
##############################

# Relación entre horas de estudio y promedio.
# Cada punto representa un estudiante.

g8 <- ggplot(data = base,
             aes(x = horas_estudio, y = promedio)) +
  geom_point(alpha = 0.5, color = "navy") +
  labs(title = "Relación entre horas de estudio y promedio",
       x = "Horas de estudio por semana",
       y = "Promedio") +
  theme_minimal()

print(g8)

# INTERPRETACIÓN:
# Si los puntos muestran una tendencia ascendente,
# sugiere relación positiva:
# a más horas de estudio, mayor promedio.

##############################
# 16. DISPERSIÓN + LÍNEA DE TENDENCIA
##############################

# Agregamos una línea de tendencia lineal.
# method = "lm" usa una recta ajustada.
# se = FALSE evita mostrar la banda de confianza.

g9 <- ggplot(data = base,
             aes(x = horas_estudio, y = promedio)) +
  geom_point(alpha = 0.45, color = "navy") +
  geom_smooth(method = "lm", se = FALSE, color = "red", linewidth = 1) +
  labs(title = "Horas de estudio y promedio con línea de tendencia",
       x = "Horas de estudio por semana",
       y = "Promedio") +
  theme_minimal()

print(g9)

# INTERPRETACIÓN:
# La línea roja resume la tendencia general.
# Si sube de izquierda a derecha, la relación es positiva.

##############################
# 17. CORRELACIÓN ENTRE DOS VARIABLES
##############################

# La correlación de Pearson mide la intensidad y dirección
# de una relación lineal entre dos variables numéricas.
#
# Va de -1 a 1:
# - cerca de 1  -> relación positiva fuerte
# - cerca de -1 -> relación negativa fuerte
# - cerca de 0  -> relación lineal débil o inexistente

#Solo para numéricas
cor(base$horas_estudio, base$promedio)
#Usar solo observaciones completas(Filas)
cor(base$horas_estudio, base$promedio, use = "complete.obs")

# Otro ejemplo:
cor(base$tiempo_desplazamiento_min, base$promedio, use = "complete.obs")

# IMPORTANTE:
# Correlación no implica causalidad.

##############################
# 18. OTRA DISPERSIÓN INTERESANTE
##############################

# Tiempo de desplazamiento y promedio

g10 <- ggplot(data = base,
              aes(x = tiempo_desplazamiento_min, y = promedio)) +
  geom_point(alpha = 0.45, color = "darkorange3") +
  geom_smooth(method = "lm", se = FALSE, color = "black", linewidth = 1) +
  labs(title = "Tiempo de desplazamiento y promedio",
       x = "Tiempo de desplazamiento (minutos)",
       y = "Promedio") +
  theme_minimal()

print(g10)

##############################
# 19. IDENTIFICAR VARIABLES NUMÉRICAS
##############################

# Para construir una matriz de correlación,
# necesitamos seleccionar solo variables numéricas.

sapply(base, class)

numericas <- sapply(base, is.numeric)
numericas

base_num <- base[, numericas]

# Revisamos cuáles quedaron
names(base_num)

##############################
# 20. MATRIZ DE CORRELACIÓN
##############################

# Calculamos la matriz de correlación usando solo observaciones
# completas por pares.

matriz_cor <- cor(base_num, use = "complete.obs")

# La mostramos redondeada a 2 decimales
round(matriz_cor, 2)

# INTERPRETACIÓN GENERAL:
# 1. La diagonal siempre vale 1
#    porque una variable correlaciona perfectamente consigo misma.
# 2. La matriz es simétrica.
# 3. Valores positivos indican relación directa.
# 4. Valores negativos indican relación inversa.
# 5. Valores cercanos a 0 indican relación lineal débil.

##############################
# 21. PASAR LA MATRIZ A FORMATO LARGO
#     PARA HACER EL HEATMAP EN ggplot2
##############################

# ggplot trabaja mejor con datos en formato largo.
# Convertimos la matriz a data.frame.

cor_largo <- as.data.frame(as.table(matriz_cor))

# Revisamos el resultado
head(cor_largo)

# Cambiamos nombres para mayor claridad
names(cor_largo) <- c("Variable1", "Variable2", "Correlacion")

head(cor_largo)

##############################
# 22. HEATMAP DE CORRELACIONES
##############################

# geom_tile() crea rectángulos coloreados.
# El color representa el valor de la correlación.

g11 <- ggplot(data = cor_largo,
              aes(x = Variable1, y = Variable2, fill = Correlacion)) +
  geom_tile(color = "white") +
  geom_text(aes(label = round(Correlacion, 2)), size = 3) +
  scale_fill_gradient2(low = "steelblue",
                       mid = "white",
                       high = "firebrick",
                       midpoint = 0,
                       limits = c(-1, 1)) +
  labs(title = "Heatmap de la matriz de correlación",
       x = "",
       y = "",
       fill = "Correlación") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

print(g11)

# INTERPRETACIÓN:
# - colores cercanos al rojo indican correlación positiva
# - colores cercanos al azul indican correlación negativa
# - colores cercanos al blanco indican correlación cercana a 0

##############################
# 23. DESCRIPTIVA BIVARIADA EXTRA:
#     PROMEDIO SEGÚN PROGRAMA
##############################

# Podemos complementar boxplots con medias por grupo.

tapply(base$promedio, base$programa, mean, na.rm = TRUE)

# También con ggplot:
g12 <- ggplot(data = base, aes(x = programa, y = promedio)) +
  geom_boxplot(fill = "khaki") +
  labs(title = "Promedio académico según programa",
       x = "Programa",
       y = "Promedio") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 20, hjust = 1))

print(g12)

##############################
# 24. DESCRIPTIVA BIVARIADA EXTRA:
#     ASISTENCIA SEGÚN BECA
##############################

g13 <- ggplot(data = base, aes(x = beca, y = asistencia)) +
  geom_boxplot(fill = "lightblue") +
  labs(title = "Asistencia según beca",
       x = "Beca",
       y = "Asistencia") +
  theme_minimal()

print(g13)

##############################
# 25. RESUMEN RÁPIDO DE IDEAS CLAVE
##############################

# 1. ggplot2 construye los gráficos por capas
# 2. geom_bar() se usa para variables categóricas
# 3. geom_histogram() sirve para variables numéricas
# 4. geom_boxplot() resume y compara distribuciones
# 5. geom_point() sirve para estudiar relaciones entre dos variables numéricas
# 6. geom_smooth(method = "lm") agrega una tendencia lineal
# 7. cor() calcula correlación entre variables numéricas
# 8. una matriz de correlación resume muchas correlaciones a la vez
# 9. un heatmap ayuda a visualizar rápidamente esa matriz

##############################
# 26. ACTIVIDAD PROPUESTA
##############################

# Instrucciones:
# Resuelva los siguientes puntos usando la base y ggplot2.
# Interprete brevemente cada resultado.

#Máximo 6 variables, Entregar en pdf Lunes 20. Script también.

# 1. Haga un gráfico de barras para jornada.
# 2. Haga un histograma para tiempo_desplazamiento_min.
# 3. Compare el promedio según beca con un boxplot.
# 4. Compare horas_sueno según trabaja con un boxplot.
# 5. Haga un diagrama de dispersión entre asistencia y promedio.
# 6. Calcule la correlación entre asistencia y promedio.
# 7. Calcule la matriz de correlación de las variables numéricas.
# 8. Haga un heatmap de esa matriz.
# 9. Interprete cuáles variables parecen relacionarse más con promedio.
# 10. Identifique una relación positiva y una relación negativa
#     observadas en la base.

############################################################
