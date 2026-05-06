##############################
# Autor: Rubén Darío Velasco Burbano.
# Presentado a: PhD. Cristhian Leonardo Urbano.
# Ingeniería Informática.
# Código: 90125035. 
# SOLUCIÓN ACTIVIDAD PROPUESTA
##############################

# Instrucciones:
# Resuelva los siguientes puntos usando la base y ggplot2.
# Interprete brevemente cada resultado.

#Máximo 6 variables, Entregar en pdf Lunes 20. Script también.

# Elimina objetos guardados en memoria
rm(list = ls())

# Limpia la consola
cat("\014")

# Muestra la carpeta de trabajo actual
getwd()

# Directorio de trabajo:
setwd("D:/GitHub/IUCMC/lll/Estadística Descriptiva/Practica 3")

# Leemos la base de datos principal.
library(readxl)
base <- read_excel("base_practica_3_ggplot_1800.xlsx")

# Instalar ggplot2 solo una vez si no lo tienes:
install.packages("ggplot2")

# Cargamos la librería
library(ggplot2)

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

# Paleta de colores
scale_fill_brewer(palette = "Set2")

# 1. Haga un gráfico de barras para jornada.

jornada_plot <- ggplot(data = base, aes(x = jornada, fill = jornada)) +
  geom_bar() +
  labs(title = "Distribución de estudiantes por jornada",
       x = "Jornada",
       y = "Cantidad de estudiantes") +
  scale_fill_brewer(palette = "Set2") +
  theme_minimal() +
  theme(legend.position = "none",
        plot.title = element_text(hjust = 0.5, face = "bold"),
        axis.title = element_text(face = "bold"))

# Visualización del gráfico.
print(jornada_plot)

# 2. Haga un histograma para tiempo_desplazamiento_min.

tiempo_desplazamiento_min_plot <- ggplot(data = base, aes(x = tiempo_desplazamiento_min)) +
  geom_histogram(fill = "#66C2A5", color = "white", bins = 15) +
  labs(title = "Distribución del tiempo de desplazamiento",
       x = "Tiempo de desplazamiento (minutos)",
       y = "Frecuencia") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, face = "bold"),
        axis.title = element_text(face = "bold"))

# Visualización del gráfico.
print(tiempo_desplazamiento_min_plot)

# 3. Compare el promedio según beca con un boxplot.

promedio_por_beca_plot <- ggplot(data = base, aes(x = beca, y = promedio, fill = beca)) +
  geom_boxplot() +
  labs(title = "Distribución del promedio según beca",
       x = "Beca",
       y = "Promedio académico") +
  scale_fill_brewer(palette = "Set2") +
  theme_minimal() +
  theme(legend.position = "none",
        plot.title = element_text(hjust = 0.5, face = "bold"),
        axis.title = element_text(face = "bold"))

# Visualización del gráfico.
print(promedio_por_beca_plot)

# 4. Compare horas_sueno según trabaja con un boxplot.

horas_sueno_segun_trabaja_plot <- ggplot(data = base, aes(x = trabaja, y = horas_sueno, fill = trabaja)) +
  geom_boxplot() +
  labs(title = "Horas de sueño según condición laboral",
       x = "Trabaja",
       y = "Horas de sueño") +
  scale_fill_brewer(palette = "Set2") +
  theme_minimal() +
  theme(legend.position = "none",
        plot.title = element_text(hjust = 0.5, face = "bold"),
        axis.title = element_text(face = "bold"))

# Visualización del gráfico.
print(horas_sueno_segun_trabaja_plot)

# 5. Haga un diagrama de dispersión entre asistencia y promedio.

asistencia_promedio_plot <- ggplot(data = base,
                                   aes(x = asistencia, y = promedio)) +
  geom_point(alpha = 0.5, color = "#66C2A5") +
  geom_smooth(method = "lm", se = FALSE, color = "#FC8D62", linewidth = 1) +
  labs(title = "Relación entre asistencia y promedio",
       x = "Asistencia",
       y = "Promedio académico") +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    axis.title = element_text(face = "bold")
  )


# Visualización del gráfico.
print(asistencia_promedio_plot)

# 6. Calcule la correlación entre asistencia y promedio.

#Usar solo observaciones completas(Filas) || 0.469377 (cerca de 1  -> relación positiva fuerte)
cor(base$asistencia, base$promedio, use = "complete.obs")

# 7. Calcule la matriz de correlación de las variables numéricas.

# Para construir una matriz de correlación, necesitamos seleccionar solo variables numéricas.

sapply(base, class)

numericas <- sapply(base, is.numeric)
numericas

base_num <- base[, numericas]

# Revisamos cuáles quedaron
names(base_num)

# Calculamos la matriz de correlación usando solo observaciones completas por pares.
matriz_cor <- cor(base_num, use = "complete.obs")

# La mostramos redondeada a 2 decimales
round(matriz_cor, 2)

# ggplot trabaja mejor con datos en formato largo.
# Convertimos la matriz a data.frame.

cor_largo <- as.data.frame(as.table(matriz_cor))

# Revisamos el resultado
head(cor_largo)

# Cambiamos nombres para mayor claridad
names(cor_largo) <- c("Variable_1", "Variable_2", "Correlacion")

head(cor_largo)

# 8. Haga un heatmap de esa matriz.

# Matriz de correlaciones
matriz_correlaciones_plot <- ggplot(data = cor_largo,
                                    aes(x = Variable_1, y = Variable_2, fill = Correlacion)) +
  geom_tile(color = "white") +
  geom_text(aes(label = round(Correlacion, 2)), size = 3) +
  scale_fill_gradient2(
    low = "#66C2A5",   # verde (Set2)
    mid = "white",
    high = "#FC8D62",  # naranja (Set2)
    midpoint = 0,
    limits = c(-1, 1)
  ) +
  labs(title = "Matriz de correlación entre variables numéricas",
       x = "Variables",
       y = "Variables",
       fill = "Correlación") +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    axis.text.x = element_text(angle = 45, hjust = 1),
    axis.title = element_text(face = "bold")
  )

# Visualización del gráfico.
print(matriz_correlaciones_plot)

# 9. Interprete cuáles variables parecen relacionarse más con promedio.

# Se relacionan con 0.51 horas_estudio y asistencia con 0.48, además de horas_sueno con 0.39.

# 10. Identifique una relación positiva y una relación negativa observadas en la base.

# Relación negativa: distancia_campus_km se relaciona con horas_sueno obteniendo -0.25.
# Relación positiva: tiempo_desplazamiento_min se relaciona con distancia_campus_km obteniendo 0.82.

############################################################