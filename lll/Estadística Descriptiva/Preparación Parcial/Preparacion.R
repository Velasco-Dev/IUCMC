# =========================================================
# PARCIAL ESTADÍSTICA DESCRIPTIVA - SCRIPT BASE COMPLETO
# =========================================================
# Este script está diseñado para:
# ✔ Filtrar subgrupo
# ✔ Clasificar variables
# ✔ Aplicar análisis según tipo de variable
# ✔ Generar gráficos consistentes
# ✔ Incluir comentarios EXACTOS para el informe
#
# IMPORTANTE:
# - NO hacer inferencias (NO causas, NO suposiciones)
# - SOLO describir lo que muestran los datos
# - Usar frases como: "Se observa", "Se identifica", "Los datos muestran"
# =========================================================


# =========================================================
# 0. LIMPIEZA Y LIBRERÍAS
# =========================================================
rm(list = ls())
cat("\014")

library(readxl)
library(ggplot2)
library(dplyr)

setwd("TU_RUTA_AQUI")

base <- read_excel("base_hospitalaria_exam.xlsx")

str(base)


# =========================================================
# 1. FILTRADO DEL SUBGRUPO (AJUSTAR SEGÚN EXAMEN)
# =========================================================
# EJEMPLO:
subgrupo <- base %>%
  filter(Diagnostico_Principal == "Oncologia" | Reingreso_30_dias == "Si")

dim(subgrupo)


# =========================================================
# 2. PALETA DE COLORES CONSISTENTE
# =========================================================
color_principal <- "#66C2A5"   # verde suave
color_secundario <- "#FC8D62"  # naranja suave


# =========================================================
# 3. FUNCIÓN GUÍA SEGÚN TIPO DE VARIABLE
# =========================================================

# =========================================================
# 🔹 VARIABLE CUALITATIVA NOMINAL
# =========================================================

# Tabla de frecuencias
tabla_diag <- table(subgrupo$Diagnostico_Principal)
prop.table(tabla_diag)

# Gráfico
ggplot(subgrupo, aes(x = Diagnostico_Principal, fill = Diagnostico_Principal)) +
  geom_bar() +
  labs(title = "Distribución del diagnóstico principal",
       x = "Diagnóstico",
       y = "Frecuencia") +
  scale_fill_brewer(palette = "Set2") +
  theme_minimal() +
  theme(legend.position = "none")

# 📝 FRASE PARA INFORME:
# "Variable cualitativa nominal. El gráfico muestra la frecuencia de cada categoría.
# Se observa que la categoría más frecuente es ______, mientras que ______ presenta menor frecuencia.
# La distribución no es uniforme entre las categorías."


# =========================================================
# 🔹 VARIABLE CUALITATIVA ORDINAL
# =========================================================

tabla_sat <- table(subgrupo$Satisfaccion_1_10)
prop.table(tabla_sat)

# 📝 FRASE:
# "Variable cualitativa ordinal. Se observa la distribución ordenada de las categorías.
# La mayor concentración se encuentra en ______, mientras que los niveles más bajos/altos presentan menor frecuencia."


# =========================================================
# 🔹 VARIABLE CUANTITATIVA CONTINUA (HISTOGRAMA)
# =========================================================

summary(subgrupo$CEA_ng_mL)
sd(subgrupo$CEA_ng_mL, na.rm = TRUE)

ggplot(subgrupo, aes(x = CEA_ng_mL)) +
  geom_histogram(fill = color_principal, color = "white", bins = 20) +
  labs(title = "Distribución del marcador CEA",
       x = "CEA (ng/mL)",
       y = "Frecuencia") +
  theme_minimal()

# 📝 FRASE:
# "Variable cuantitativa continua. El histograma muestra la distribución de los datos.
# Se observa mayor concentración en el rango ______.
# La distribución presenta (simetría/asimetría hacia la derecha/izquierda).
# Se identifican posibles valores extremos."


# =========================================================
# 🔹 VARIABLE CUANTITATIVA (BOXPLOT)
# =========================================================

summary(subgrupo$Dias_Estancia)

ggplot(subgrupo, aes(x = "", y = Dias_Estancia)) +
  geom_boxplot(fill = color_principal) +
  labs(title = "Distribución de días de estancia",
       y = "Días") +
  theme_minimal()

# 📝 FRASE:
# "Variable cuantitativa continua. El boxplot muestra la mediana, los cuartiles y la dispersión.
# Se observa que la mediana se ubica en ______.
# La variabilidad se evidencia en el tamaño de la caja.
# Se identifican posibles valores atípicos."


# =========================================================
# 🔹 VARIABLE CUANTITATIVA VS CUALITATIVA (BOXPLOT COMPARATIVO)
# =========================================================

ggplot(subgrupo, aes(x = Adherencia_Tratamiento, y = Dias_Estancia, fill = Adherencia_Tratamiento)) +
  geom_boxplot() +
  scale_fill_brewer(palette = "Set2") +
  theme_minimal() +
  theme(legend.position = "none")

# 📝 FRASE:
# "Se compara una variable cuantitativa con una cualitativa.
# Se observan diferencias en la mediana entre los grupos.
# La dispersión varía entre categorías, evidenciada en el tamaño de las cajas.
# Se identifican posibles valores atípicos en algunos grupos."


# =========================================================
# 🔹 TABLAS DE PROPORCIONES
# =========================================================

tabla <- table(subgrupo$Resultado_Egreso)
prop.table(tabla)

# 📝 FRASE:
# "Se presentan frecuencias absolutas y relativas.
# La categoría con mayor proporción es ______.
# Las demás categorías presentan menor participación en el total."


# =========================================================
# 🔹 MATRIZ DE CORRELACIÓN (SI APLICA)
# =========================================================

numericas <- sapply(subgrupo, is.numeric)
base_num <- subgrupo[, numericas]

matriz_cor <- cor(base_num, use = "complete.obs")
round(matriz_cor, 2)

# 📝 FRASE:
# "La matriz de correlación muestra la relación entre variables numéricas.
# Los valores cercanos a 1 indican relación positiva fuerte,
# cercanos a -1 relación negativa, y cercanos a 0 relación débil."


# =========================================================
# 🔹 DISPERSIÓN (SCATTER)
# =========================================================

ggplot(subgrupo, aes(x = Dias_Estancia, y = Costo_Total_COP)) +
  geom_point(alpha = 0.5, color = color_principal) +
  geom_smooth(method = "lm", se = FALSE, color = color_secundario) +
  labs(title = "Relación entre días de estancia y costo",
       x = "Días de estancia",
       y = "Costo") +
  theme_minimal()

# 📝 FRASE:
# "El gráfico de dispersión muestra la relación entre dos variables cuantitativas.
# Se observa una tendencia (ascendente/descendente/sin patrón claro).
# Los datos presentan dispersión alrededor de la tendencia."


# =========================================================
# 🔥 ADAPTACIÓN RÁPIDA EN EL EXAMEN
# =========================================================

# 👉 SI LA VARIABLE ES:
#
# CUALITATIVA NOMINAL:
# ✔ table()
# ✔ prop.table()
# ✔ geom_bar()
#
# CUALITATIVA ORDINAL:
# ✔ table()
# ✔ prop.table()
# ✔ (opcional) barplot
#
# CUANTITATIVA CONTINUA:
# ✔ summary()
# ✔ sd()
# ✔ histograma
# ✔ boxplot
#
# CUANTITATIVA vs CUALITATIVA:
# ✔ boxplot comparativo
#
# DOS CUANTITATIVAS:
# ✔ scatter plot
# ✔ correlación


# =========================================================
# 🔚 FRASE FINAL PARA CONCLUSIÓN
# =========================================================

# 📝 USAR EN EL PDF:
# "El análisis descriptivo permitió caracterizar el subgrupo a partir de la distribución
# de sus variables cualitativas y cuantitativas. Se identificaron diferencias en frecuencias,
# niveles de dispersión y posibles valores atípicos, describiendo el comportamiento de los datos
# sin establecer relaciones causales."