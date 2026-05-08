# ============================================================================
# PLANTILLA PARA EXAMEN DE ESTADISTICA DESCRIPTIVA EN R
# Base: base_hospitalaria_exam.xlsx
# Autor: _______________________________
# Fecha: _______________________________
#
# OBJETIVO DEL SCRIPT:
# Este archivo sirve como plantilla de estudio para cargar, filtrar, limpiar,
# describir, tabular, graficar e interpretar un subgrupo poblacional.
#
# IMPORTANTE:
# - No modificar la base desde Excel.
# - Todo filtro, limpieza y analisis debe hacerse desde R.
# - Antes del examen, practique y entienda cada bloque.
# - Durante el examen, siga las reglas indicadas por el profesor.
# ============================================================================

# ============================================================================
# 0. LIMPIEZA DEL ENTORNO
# ============================================================================

# Borra todos los objetos existentes en memoria.
rm(list = ls())

# Limpia la consola de RStudio.
cat("\014")

# ============================================================================
# 1. LIBRERIAS NECESARIAS
# ============================================================================

# readxl: permite leer archivos de Excel (.xlsx).
# dplyr: facilita filtros, seleccion, agrupaciones y resumenes.
# ggplot2: permite crear graficos descriptivos profesionales.
# janitor: permite limpiar nombres de columnas y hacer tablas rapidas.

# Si alguna libreria no esta instalada, quite el simbolo # de la linea respectiva
# y ejecutela una sola vez.

# install.packages("readxl")
# install.packages("dplyr")
# install.packages("ggplot2")
# install.packages("janitor")

library(readxl)
library(dplyr)
library(ggplot2)
library(janitor)

# ============================================================================
# 2. CARGA DE LA BASE DE DATOS
# ============================================================================

# Recomendacion: guardar este script y el archivo Excel en la misma carpeta.
# Para ver la carpeta actual de trabajo:
getwd()

# Si necesita cambiar la carpeta de trabajo, use setwd().
# Ejemplo en Windows:
setwd("C:/Users/Tuf/Documents/IUCMC/lll/Estadística Descriptiva/Preparación Parcial")

# Cargar base desde Excel.
library(readxl)
# La hoja del archivo se llama "Datos".
base_original <- read_excel("base_hospitalaria_exam.xlsx")

# Revisar dimensiones. Deberia dar 2500 filas y 157 columnas.
dim(base_original)

# Ver nombres originales de columnas.
names(base_original)

# Limpiar nombres de columnas para trabajar mas facil.
# Ejemplo: Edad_Años pasa a edad_anos; Dias_Estancia pasa a dias_estancia.
base <- base_original %>% clean_names()

# Revisar nombres limpios.
names(base)

# Ver primeras filas.
head(base)

# Ver estructura general: tipo de dato de cada variable.
str(base)

# Resumen general de la base.
summary(base)

# ============================================================================
# 3. REVISION RAPIDA DE VARIABLES DISPONIBLES
# ============================================================================

# Estas son algunas variables importantes ya observadas en la base:
# id_paciente, nombre_completo, sexo, fecha_nacimiento, edad_anos,
# ciudad, departamento, zona, estrato_socioecon, escolaridad, ocupacion,
# estado_civil, ingreso_mensual_cop, eps, regimen_salud,
# area_hospitalizacion, diagnostico_principal, fecha_ingreso, fecha_egreso,
# dias_estancia, resultado_egreso, costo_total_cop, reingreso_30dias,
# satisfaccion_1_10, grupo_etario, clasificacion_imc,
# costo_por_dia_cop, adherencia_tratamiento, derivacion_especialista,
# ca125_u_m_l, cea_ng_m_l, afp_ng_m_l.

# Buscar columnas que contengan una palabra clave.
# Util para encontrar rapido variables durante el examen.
grep("costo", names(base), value = TRUE)
grep("diagnostico", names(base_identada), value = TRUE)
grep("reingreso", names(base), value = TRUE)
grep("satisfaccion", names(base), value = TRUE)
grep("area", names(base_identada), value = TRUE)
grep("satisfaccion", names(base_identada), value = TRUE)
grep("dias", names(base_identada), value = TRUE)

# ============================================================================
# 4. REVISION DE DATOS FALTANTES
# ============================================================================

# Cantidad de datos faltantes por variable.
faltantes_cantidad <- colSums(is.na(base))
faltantes_cantidad

# Porcentaje de datos faltantes por variable.
faltantes_porcentaje <- round(100 * colMeans(is.na(base)), 2)
faltantes_porcentaje

# Tabla organizada de faltantes.
tabla_faltantes <- data.frame(
  variable = names(base),
  cantidad_na = faltantes_cantidad,
  porcentaje_na = faltantes_porcentaje
)

tabla_faltantes <- tabla_faltantes[order(-tabla_faltantes$porcentaje_na), ]
tabla_faltantes

# ============================================================================
# 5. COMO VER LAS CATEGORIAS DE UNA VARIABLE CUALITATIVA
# ============================================================================

# table() cuenta cuantas veces aparece cada categoria.
table(base$sexo)
table(base$area_hospitalizacion)
table(base$resultado_egreso)
table(base$reingreso_30dias)

# unique() muestra categorias unicas.
unique(base$area_hospitalizacion)
unique(base$diagnostico_principal)

# sort(table()) ordena de menor a mayor o mayor a menor.
sort(table(base$diagnostico_principal), decreasing = TRUE)

# ============================================================================
# 6. FILTRO DEL SUBGRUPO POBLACIONAL
# ============================================================================

# En el examen el profesor asignara un subgrupo.
# Usted debe modificar SOLO esta seccion de acuerdo con el caso asignado.

# ---------------------------------------------------------------------------
# EJEMPLO 1: pacientes de Oncologia O pacientes con reingreso a 30 dias.
# El simbolo | significa "O".
# ---------------------------------------------------------------------------

subgrupo <- base %>%
  filter(area_hospitalizacion == "Oncología" | reingreso_30dias == "Sí")

# Revisar cuantos registros quedaron despues del filtro.
dim(subgrupo)

# ---------------------------------------------------------------------------
# EJEMPLO 2: pacientes mujeres.
# ---------------------------------------------------------------------------
# subgrupo <- base %>% filter(sexo == "Femenino")

# ---------------------------------------------------------------------------
# EJEMPLO 3: pacientes de UCI y mayores de 60 años.
# El simbolo & significa "Y".
# ---------------------------------------------------------------------------
# subgrupo <- base %>%
#   filter(area_hospitalizacion == "UCI" & edad_anos >= 60)

# ---------------------------------------------------------------------------
# EJEMPLO 4: pacientes con diabetes o hipertension.
# ---------------------------------------------------------------------------
# subgrupo <- base %>%
#   filter(antec_diabetes == "Sí" | antec_hipertension == "Sí")

# ---------------------------------------------------------------------------
# EJEMPLO 5: pacientes con costo total mayor a cierto valor.
# ---------------------------------------------------------------------------
# subgrupo <- base %>% filter(costo_total_cop > 5000000)

# ============================================================================
# 7. NATURALEZA DE LAS VARIABLES
# ============================================================================

# Cualitativa nominal:
# Categorias sin orden natural.
# Ejemplos: sexo, ciudad, departamento, diagnostico_principal, resultado_egreso.

# Cualitativa ordinal:
# Categorias con orden natural.
# Ejemplos: estrato_socioecon, grupo_etario, clasificacion_imc,
# adherencia_tratamiento si tiene niveles ordenados.

# Cuantitativa discreta:
# Numeros contables enteros.
# Ejemplos: numero_hijos, numero_consultas_previas, numero_medicamentos,
# numero_procedimientos, dias_estancia si se cuenta en dias enteros.

# Cuantitativa continua:
# Mediciones numericas con decimales o escalas continuas.
# Ejemplos: edad_anos, peso_kg, talla_m, imc, temperatura_c,
# costo_total_cop, costo_por_dia_cop, marcadores clinicos.

# ============================================================================
# 8. FUNCIONES UTILES PARA EL EXAMEN
# ============================================================================

# ---------------------------------------------------------------------------
# 8.1 Funcion para calcular la moda
# ---------------------------------------------------------------------------
# La moda es el valor que mas se repite.

moda <- function(x) {
  x <- x[!is.na(x)]
  tabla <- table(x)
  names(tabla)[tabla == max(tabla)]
}

# Ejemplo:
# moda(subgrupo$sexo)
# moda(subgrupo$diagnostico_principal)

# ---------------------------------------------------------------------------
# 8.2 Funcion para describir una variable cualitativa
# ---------------------------------------------------------------------------
# Sirve para variables como sexo, diagnostico, resultado_egreso,
# adherencia_tratamiento, derivacion_especialista, etc.

analisis_cualitativa <- function(datos, variable, titulo = "Variable cualitativa") {
  
  # Extraer variable.
  x <- datos[[variable]]
  
  # Tabla de frecuencias absolutas.
  frecuencia <- table(x, useNA = "ifany")
  
  # Tabla de porcentajes.
  porcentaje <- round(100 * prop.table(frecuencia), 2)
  
  # Tabla final.
  tabla_final <- data.frame(
    categoria = names(frecuencia),
    frecuencia = as.numeric(frecuencia),
    porcentaje = as.numeric(porcentaje)
  )
  
  # Ordenar de mayor a menor frecuencia.
  tabla_final <- tabla_final[order(-tabla_final$frecuencia), ]
  
  print(tabla_final)
  
  # Grafico de barras con R base.
  barplot(frecuencia,
          main = titulo,
          xlab = "Categoria",
          ylab = "Frecuencia",
          las = 2)
  
  # Grafico de barras con ggplot2.
  grafico <- ggplot(datos, aes(x = .data[[variable]])) +
    geom_bar() +
    labs(title = titulo,
         x = variable,
         y = "Frecuencia") +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
  
  print(grafico)
  
  return(tabla_final)
}

# Ejemplo de uso:
# tabla_sexo <- analisis_cualitativa(subgrupo, "sexo", "Distribucion por sexo")
# tabla_diag <- analisis_cualitativa(subgrupo, "diagnostico_principal", "Diagnosticos principales")

# ---------------------------------------------------------------------------
# 8.3 Funcion para describir una variable cuantitativa
# ---------------------------------------------------------------------------
# Sirve para variables como edad, dias_estancia, costo_total, marcadores,
# presion arterial, temperatura, satisfaccion, etc.

analisis_cuantitativa <- function(datos, variable, titulo = "Variable cuantitativa") {
  
  # Extraer variable.
  x <- datos[[variable]]
  
  # Eliminar NA para calculos numericos.
  x_sin_na <- x[!is.na(x)]
  
  # Medidas descriptivas.
  n <- length(x_sin_na)
  media <- mean(x_sin_na)
  mediana <- median(x_sin_na)
  desviacion <- sd(x_sin_na)
  varianza <- var(x_sin_na)
  minimo <- min(x_sin_na)
  maximo <- max(x_sin_na)
  rango <- maximo - minimo
  q1 <- quantile(x_sin_na, 0.25)
  q3 <- quantile(x_sin_na, 0.75)
  iqr <- IQR(x_sin_na)
  cv <- (desviacion / media) * 100
  
  # Limites para detectar posibles valores atipicos.
  limite_inferior <- q1 - 1.5 * iqr
  limite_superior <- q3 + 1.5 * iqr
  atipicos <- x_sin_na[x_sin_na < limite_inferior | x_sin_na > limite_superior]
  
  tabla_resumen <- data.frame(
    variable = variable,
    n = n,
    media = round(media, 2),
    mediana = round(mediana, 2),
    desviacion_estandar = round(desviacion, 2),
    varianza = round(varianza, 2),
    minimo = round(minimo, 2),
    maximo = round(maximo, 2),
    rango = round(rango, 2),
    q1 = round(as.numeric(q1), 2),
    q3 = round(as.numeric(q3), 2),
    rango_intercuartilico = round(iqr, 2),
    coeficiente_variacion_pct = round(cv, 2),
    numero_atipicos = length(atipicos)
  )
  
  print(tabla_resumen)
  
  # Resumen base de R.
  print(summary(x_sin_na))
  
  # Histograma con R base.
  hist(x_sin_na,
       main = paste("Histograma de", titulo),
       xlab = variable,
       ylab = "Frecuencia")
  
  # Boxplot con R base.
  boxplot(x_sin_na,
          main = paste("Boxplot de", titulo),
          ylab = variable)
  
  # Histograma con ggplot2.
  grafico_hist <- ggplot(datos, aes(x = .data[[variable]])) +
    geom_histogram(bins = 30) +
    labs(title = paste("Histograma de", titulo),
         x = variable,
         y = "Frecuencia") +
    theme_minimal()
  
  print(grafico_hist)
  
  # Boxplot con ggplot2.
  grafico_box <- ggplot(datos, aes(y = .data[[variable]])) +
    geom_boxplot() +
    labs(title = paste("Boxplot de", titulo),
         y = variable) +
    theme_minimal()
  
  print(grafico_box)
  
  return(tabla_resumen)
}

# Ejemplo de uso:
# resumen_edad <- analisis_cuantitativa(subgrupo, "edad_anos", "Edad de los pacientes")
# resumen_dias <- analisis_cuantitativa(subgrupo, "dias_estancia", "Dias de estancia")

# ---------------------------------------------------------------------------
# 8.4 Funcion para tabla cruzada entre dos variables cualitativas
# ---------------------------------------------------------------------------
# Sirve para analizar la relacion descriptiva entre dos categorias.
# Ejemplo: sexo vs resultado_egreso, area_hospitalizacion vs reingreso_30dias.

tabla_cruzada <- function(datos, var_fila, var_columna) {
  
  tabla <- table(datos[[var_fila]], datos[[var_columna]])
  print(tabla)
  
  cat("\nPorcentajes sobre el total:\n")
  print(round(100 * prop.table(tabla), 2))
  
  cat("\nPorcentajes por fila:\n")
  print(round(100 * prop.table(tabla, margin = 1), 2))
  
  cat("\nPorcentajes por columna:\n")
  print(round(100 * prop.table(tabla, margin = 2), 2))
  
  # Grafico de barras agrupadas.
  barplot(tabla,
          beside = TRUE,
          legend = TRUE,
          main = paste(var_fila, "vs", var_columna),
          xlab = var_columna,
          ylab = "Frecuencia")
  
  return(tabla)
}

# Ejemplo de uso:
# tabla_sexo_resultado <- tabla_cruzada(subgrupo, "sexo", "resultado_egreso")
# tabla_area_reingreso <- tabla_cruzada(subgrupo, "area_hospitalizacion", "reingreso_30dias")

# ---------------------------------------------------------------------------
# 8.5 Funcion para comparar una variable numerica por grupos
# ---------------------------------------------------------------------------
# Sirve para analizar, por ejemplo:
# dias_estancia por sexo,
# costo_total_cop por resultado_egreso,
# satisfaccion_1_10 por area_hospitalizacion.

comparar_numerica_por_grupo <- function(datos, numerica, grupo) {
  
  cat("\nMedia por grupo:\n")
  print(tapply(datos[[numerica]], datos[[grupo]], mean, na.rm = TRUE))
  
  cat("\nMediana por grupo:\n")
  print(tapply(datos[[numerica]], datos[[grupo]], median, na.rm = TRUE))
  
  cat("\nDesviacion estandar por grupo:\n")
  print(tapply(datos[[numerica]], datos[[grupo]], sd, na.rm = TRUE))
  
  cat("\nResumen completo por grupo:\n")
  print(by(datos[[numerica]], datos[[grupo]], summary))
  
  # Boxplot por grupo con R base.
  boxplot(datos[[numerica]] ~ datos[[grupo]],
          main = paste(numerica, "por", grupo),
          xlab = grupo,
          ylab = numerica,
          las = 2)
  
  # Boxplot por grupo con ggplot2.
  grafico <- ggplot(datos, aes(x = .data[[grupo]], y = .data[[numerica]])) +
    geom_boxplot() +
    labs(title = paste(numerica, "por", grupo),
         x = grupo,
         y = numerica) +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
  
  print(grafico)
}

# Ejemplo de uso:
# comparar_numerica_por_grupo(subgrupo, "dias_estancia", "sexo")
# comparar_numerica_por_grupo(subgrupo, "costo_total_cop", "resultado_egreso")

# ---------------------------------------------------------------------------
# 8.6 Funcion para correlacion entre dos variables cuantitativas
# ---------------------------------------------------------------------------
# Sirve para analizar si dos variables numericas se relacionan linealmente.
# Ejemplo: dias_estancia y costo_total_cop.

analisis_correlacion <- function(datos, var_x, var_y) {
  
  correlacion <- cor(datos[[var_x]], datos[[var_y]], use = "complete.obs")
  cat("Correlacion entre", var_x, "y", var_y, ":", round(correlacion, 3), "\n")
  
  # Diagrama de dispersion con R base.
  plot(datos[[var_x]], datos[[var_y]],
       main = paste("Relacion entre", var_x, "y", var_y),
       xlab = var_x,
       ylab = var_y)
  abline(lm(datos[[var_y]] ~ datos[[var_x]]), lwd = 2)
  
  # Diagrama de dispersion con ggplot2.
  grafico <- ggplot(datos, aes(x = .data[[var_x]], y = .data[[var_y]])) +
    geom_point() +
    geom_smooth(method = "lm", se = FALSE) +
    labs(title = paste("Relacion entre", var_x, "y", var_y),
         x = var_x,
         y = var_y) +
    theme_minimal()
  
  print(grafico)
  
  return(correlacion)
}

# Ejemplo de uso:
# corr_dias_costo <- analisis_correlacion(subgrupo, "dias_estancia", "costo_total_cop")

# ============================================================================
# 9. ANALISIS DE VARIABLES SUGERIDAS DEL EJEMPLO DEL PDF
# ============================================================================

# NOTA:
# Esta seccion esta basada en el ejemplo de pacientes de Oncologia o reingreso.
# Si el profesor asigna otro subgrupo o variables, cambie los nombres.

# ---------------------------------------------------------------------------
# 9.1 Diagnostico principal: cualitativa nominal
# ---------------------------------------------------------------------------
# Que permite analizar: diagnosticos predominantes en el subgrupo.

tabla_diagnostico <- analisis_cualitativa(
  datos = subgrupo,
  variable = "diagnostico_principal",
  titulo = "Diagnosticos principales del subgrupo"
)

# ---------------------------------------------------------------------------
# 9.2 Marcadores tumorales: cuantitativas continuas
# ---------------------------------------------------------------------------
# Que permite analizar: distribucion, dispersion y posibles asimetrias.

resumen_cea <- analisis_cuantitativa(
  datos = subgrupo,
  variable = "cea_ng_m_l",
  titulo = "CEA ng/mL"
)

resumen_afp <- analisis_cuantitativa(
  datos = subgrupo,
  variable = "afp_ng_m_l",
  titulo = "AFP ng/mL"
)

resumen_ca125 <- analisis_cuantitativa(
  datos = subgrupo,
  variable = "ca125_u_m_l",
  titulo = "CA125 U/mL"
)

# ---------------------------------------------------------------------------
# 9.3 Adherencia al tratamiento: cualitativa ordinal o nominal segun categorias
# ---------------------------------------------------------------------------
# Que permite analizar: distribucion de la adherencia terapeutica.

tabla_adherencia <- analisis_cualitativa(
  datos = subgrupo,
  variable = "adherencia_tratamiento",
  titulo = "Adherencia al tratamiento"
)

# ---------------------------------------------------------------------------
# 9.4 Derivacion a especialista: cualitativa nominal dicotomica
# ---------------------------------------------------------------------------
# Que permite analizar: proporcion derivada o no a especialista.

tabla_derivacion <- analisis_cualitativa(
  datos = subgrupo,
  variable = "derivacion_especialista",
  titulo = "Derivacion a especialista"
)

# ---------------------------------------------------------------------------
# 9.5 Dias de estancia: cuantitativa discreta
# ---------------------------------------------------------------------------
# Que permite analizar: duracion de la hospitalizacion.

resumen_dias_estancia <- analisis_cuantitativa(
  datos = subgrupo,
  variable = "dias_estancia",
  titulo = "Dias de estancia hospitalaria"
)

# ---------------------------------------------------------------------------
# 9.6 Costo total y costo por dia: cuantitativas continuas
# ---------------------------------------------------------------------------
# Que permite analizar: carga economica del subgrupo.

resumen_costo_total <- analisis_cuantitativa(
  datos = subgrupo,
  variable = "costo_total_cop",
  titulo = "Costo total COP"
)

resumen_costo_dia <- analisis_cuantitativa(
  datos = subgrupo,
  variable = "costo_por_dia_cop",
  titulo = "Costo por dia COP"
)

# ---------------------------------------------------------------------------
# 9.7 Satisfaccion: cuantitativa discreta u ordinal numerica
# ---------------------------------------------------------------------------
# Que permite analizar: percepcion del servicio en escala 1 a 10.

resumen_satisfaccion <- analisis_cuantitativa(
  datos = subgrupo,
  variable = "satisfaccion_1_10",
  titulo = "Satisfaccion del paciente 1 a 10"
)

# ---------------------------------------------------------------------------
# 9.8 Resultado de egreso: cualitativa nominal
# ---------------------------------------------------------------------------
# Que permite analizar: desenlaces clinicos.

tabla_resultado <- analisis_cualitativa(
  datos = subgrupo,
  variable = "resultado_egreso",
  titulo = "Resultado de egreso"
)

# ============================================================================
# 10. TABLAS CRUZADAS RECOMENDADAS
# ============================================================================

# Resultado de egreso por sexo.
tabla_cruzada(subgrupo, "sexo", "resultado_egreso")

# Reingreso a 30 dias por resultado de egreso.
tabla_cruzada(subgrupo, "reingreso_30dias", "resultado_egreso")

# Adherencia al tratamiento por derivacion a especialista.
tabla_cruzada(subgrupo, "adherencia_tratamiento", "derivacion_especialista")

# ============================================================================
# 11. COMPARACIONES POR GRUPOS
# ============================================================================

# Dias de estancia segun resultado de egreso.
comparar_numerica_por_grupo(subgrupo, "dias_estancia", "resultado_egreso")

# Costo total segun resultado de egreso.
comparar_numerica_por_grupo(subgrupo, "costo_total_cop", "resultado_egreso")

# Satisfaccion segun resultado de egreso.
comparar_numerica_por_grupo(subgrupo, "satisfaccion_1_10", "resultado_egreso")

# ============================================================================
# 12. CORRELACIONES RECOMENDADAS
# ============================================================================

# Relacion entre dias de estancia y costo total.
analisis_correlacion(subgrupo, "dias_estancia", "costo_total_cop")

# Relacion entre costo total y costo por dia.
analisis_correlacion(subgrupo, "costo_total_cop", "costo_por_dia_cop")

# ============================================================================
# 13. GUARDAR TABLAS DE RESULTADOS SI SE NECESITA
# ============================================================================

# Exportar tablas a CSV para consultarlas luego.
# Estos archivos se guardan en la carpeta de trabajo.

write.csv(tabla_diagnostico, "tabla_diagnostico.csv", row.names = FALSE)
write.csv(tabla_adherencia, "tabla_adherencia.csv", row.names = FALSE)
write.csv(tabla_derivacion, "tabla_derivacion.csv", row.names = FALSE)
write.csv(tabla_resultado, "tabla_resultado_egreso.csv", row.names = FALSE)

write.csv(resumen_dias_estancia, "resumen_dias_estancia.csv", row.names = FALSE)
write.csv(resumen_costo_total, "resumen_costo_total.csv", row.names = FALSE)
write.csv(resumen_costo_dia, "resumen_costo_por_dia.csv", row.names = FALSE)
write.csv(resumen_satisfaccion, "resumen_satisfaccion.csv", row.names = FALSE)

# ============================================================================
# 14. GUARDAR GRAFICOS MANUALMENTE
# ============================================================================

# Si necesita guardar un grafico puntual con ggplot2:
# 1. Cree el grafico y guardelo en un objeto.
# 2. Use ggsave().

# Ejemplo:
grafico_resultado <- ggplot(subgrupo, aes(x = resultado_egreso)) +
  geom_bar() +
  labs(title = "Resultado de egreso",
       x = "Resultado",
       y = "Frecuencia") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

print(grafico_resultado)

ggsave("grafico_resultado_egreso.png",
       plot = grafico_resultado,
       width = 8,
       height = 5)

# ============================================================================
# 15. FRASES GUIA PARA INTERPRETAR EN EL INFORME
# ============================================================================

# Use estas frases como guia. Debe reemplazar los valores X, Y y Z por sus
# resultados reales.

# VARIABLE CUALITATIVA NOMINAL:
# "La variable [nombre] es cualitativa nominal, porque clasifica a los pacientes
# en categorias sin un orden natural. La categoria con mayor frecuencia fue [X],
# con [n] casos, equivalente al [Y]%. Esto indica que dentro del subgrupo
# analizado predominan los pacientes con dicha caracteristica."

# VARIABLE CUALITATIVA ORDINAL:
# "La variable [nombre] es cualitativa ordinal, porque sus categorias presentan
# un orden jerarquico. Se observa que la mayor proporcion de pacientes se ubica
# en el nivel [X], lo que sugiere una concentracion del subgrupo en dicho nivel."

# VARIABLE CUANTITATIVA:
# "La variable [nombre] es cuantitativa, porque representa una medicion numerica.
# La media fue [X] y la mediana fue [Y]. La desviacion estandar fue [Z], lo que
# indica el nivel de dispersion de los datos alrededor de la media."

# ASIMETRIA:
# "Al comparar la media y la mediana, se observa que la media es mayor que la
# mediana, lo que puede sugerir una asimetria hacia la derecha, posiblemente
# influenciada por valores altos."

# BOXPLOT:
# "El diagrama de caja permite observar la dispersion de la variable y la posible
# presencia de valores atipicos. Estos valores deben interpretarse como casos
# extremos dentro del subgrupo analizado, no necesariamente como errores."

# HISTOGRAMA:
# "El histograma permite observar la forma de la distribucion. En este caso,
# la variable presenta una concentracion mayor en el intervalo [X], con una
# distribucion [simetrica/asimetrica]."

# TABLA CRUZADA:
# "La tabla cruzada permite comparar la distribucion conjunta de dos variables
# cualitativas. Se observa que la mayor frecuencia se presenta en la combinacion
# [categoria 1] y [categoria 2], lo cual representa [Y]% dentro del subgrupo."

# CORRELACION:
# "El coeficiente de correlacion entre [variable X] y [variable Y] fue [r].
# Si el valor es cercano a 1, la relacion es positiva fuerte; si es cercano a -1,
# la relacion es negativa fuerte; si es cercano a 0, la relacion lineal es debil."

# ============================================================================
# 16. ESTRUCTURA SUGERIDA DEL INFORME PDF
# ============================================================================

# TITULO:
# Caracterizacion descriptiva del subgrupo poblacional asignado

# 1. Introduccion:
# Se presenta una caracterizacion descriptiva del subgrupo poblacional asignado,
# utilizando variables clinicas, sociodemograficas, economicas y de resultado.

# 2. Subgrupo analizado:
# Indicar el filtro aplicado y el numero de registros obtenidos.
# Ejemplo: El subgrupo quedo conformado por n = ___ pacientes.

# 3. Variables analizadas:
# Hacer una tabla con:
# - Nombre de variable
# - Naturaleza de la variable
# - Descripcion breve

# 4. Resultados:
# Separar en variables cualitativas y cuantitativas.
# Incluir tablas, medidas, graficos e interpretacion.

# 5. Hallazgos principales:
# Resumir los 3 a 5 resultados mas importantes.

# 6. Conclusion:
# Cerrar con una conclusion general sobre el subgrupo.

# ============================================================================
# 17. CHECKLIST FINAL ANTES DE ENTREGAR
# ============================================================================

# [ ] El script carga la base original desde Excel.
# [ ] El script no modifica el archivo Excel.
# [ ] El script filtra correctamente el subgrupo asignado.
# [ ] El script esta comentado.
# [ ] Las variables cualitativas tienen tablas y graficos de barras.
# [ ] Las variables cuantitativas tienen medidas, histogramas y boxplots.
# [ ] Se indican la naturaleza de las variables en el informe.
# [ ] Se incluyen hallazgos relevantes.
# [ ] Se entrega informe en PDF.
# [ ] Se entrega script .R.

# ============================================================================
# FIN DEL SCRIPT
# ============================================================================
