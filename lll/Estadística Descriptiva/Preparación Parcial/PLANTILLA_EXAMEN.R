############################################################
# PLANTILLA EXAMEN - ESTADÍSTICA DESCRIPTIVA EN R
# Curso: Estadística Descriptiva
# Base: base_hospitalaria_exam.xlsx (2500 registros, 157 variables)
#
# USO: Reemplaza los nombres de variables y condiciones de filtro
#      según lo que el profesor indique en tu subgrupo.
#
# ESTRUCTURA:
#  01. Limpieza y directorio
#  02. Carga de librerías y base
#  03. Exploración inicial
#  04. Conversión de variables
#  05. Filtrar subgrupo
#  06. Guardar / cargar RData
#  07. Medidas descriptivas (cuantitativas)
#  08. Medidas descriptivas por grupos
#  09. Tablas de frecuencia (simples y cruzadas)
#  10. Tabla agrupada por Sturges (variable continua)
#  11. Detección de valores atípicos (IQR)
#  12. Correlación entre dos variables y matriz de correlación
#  13. Gráficos R base
#  14. Gráficos ggplot2
#  15. Guardar gráficos en PDF / PNG
############################################################


##############################
# 01. LIMPIEZA Y DIRECTORIO
##############################
#
# ¿CUÁNDO USAR?
#  → SIEMPRE al abrir el script, antes de cualquier otra cosa.
#  CASO: Si en el examen anterior tenías cargado un 'subgrupo' de
#  urgencias y ahora trabajas con oncología, rm(list=ls()) borra
#  esos objetos viejos y evita que uses datos equivocados sin darte
#  cuenta. Es el equivalente a empezar con hoja en blanco.

# Limpia todos los objetos de la memoria
rm(list = ls())

# Limpia la consola
cat("\014")

# Ver carpeta de trabajo actual
getwd()

# *** CAMBIAR si el archivo no está en la carpeta actual ***
# setwd("C:/Users/TuUsuario/Documents/ED")

getwd()


##############################
# 02. CARGA DE LIBRERÍAS Y BASE
##############################
#
# ¿CUÁNDO USAR CADA LIBRERÍA?
#  library(readxl)  → cuando el archivo del examen es .xlsx (Excel).
#    CASO: El profesor entrega 'base_hospitalaria_exam.xlsx' → usas readxl.
#  library(ggplot2) → cuando el enunciado pide gráficos de calidad o
#    el parcial exige geom_bar, geom_boxplot, geom_histogram, etc.
#    Si solo piden R base (barplot, hist, boxplot), no hace falta.
#
# read.csv() en lugar de read_excel() →
#    CASO: Si trabajas con la base de las prácticas de clase
#    (base_estadistica_descriptiva_100_registros.csv).

# ------ Librerías necesarias ------
library(readxl)   # para leer archivos .xlsx
library(ggplot2)  # para gráficos avanzados

# Si no están instaladas, ejecutar UNA sola vez:
install.packages("readxl")
install.packages("ggplot2")


# ------ Carga desde Excel ------
base <- read_excel("base_hospitalaria_exam.xlsx")

# Alternativa desde CSV (si el archivo fuera .csv):
# base <- read.csv("archivo.csv", header = TRUE,
#                  stringsAsFactors = FALSE, fileEncoding = "UTF-8")


##############################
# 03. EXPLORACIÓN INICIAL
##############################
#
# ¿CUÁNDO USAR CADA FUNCIÓN?
#  head() / tail()  → cuando quieres ver si la base cargó bien y cómo
#    lucen los primeros/últimos registros. CASO: verificar que
#    'Diagnostico_Principal' y 'CEA_ng_mL' tienen datos reales.
#
#  str()            → cuando necesitas saber QUÉ TIPO son las variables
#    ANTES de convertirlas. CASO: confirmar que CEA_ng_mL ya es <num>
#    y que Adherencia_Tratamiento es <chr> (hay que convertirla a factor).
#
#  names() / dim()  → cuando el enunciado pregunta cuántas variables o
#    cuántos pacientes tiene la base total (antes del filtro).
#
#  colSums(is.na()) → cuando el enunciado pide detectar datos faltantes
#    o antes de calcular medias/medianas (para saber si usar na.rm=TRUE).
#    CASO: los marcadores tumorales CEA, AFP, CA125 suelen tener NAs
#    porque no se miden en todos los pacientes.

# Primeros 6 registros
head(base)

# Últimos 6 registros
tail(base)

# Estructura: tipo de cada variable + primeros valores
str(base)

# Nombres de columnas
names(base)

# Filas y columnas
dim(base)
nrow(base)
ncol(base)

# Resumen general de todas las variables
summary(base)

# Conteo de valores faltantes por variable
colSums(is.na(base))

# Porcentaje de faltantes
round(100 * colMeans(is.na(base)), 2)


##############################
# 04. CONVERSIÓN DE VARIABLES
##############################
#
# ¿CUÁNDO CONVERTIR A factor()?
#  → Cuando la variable es CATEGÓRICA (texto o número que representa
#  una categoría) y vas a usar table(), barplot(), boxplot(y~grupo),
#  prop.table() o cualquier análisis por grupos.
#
#  CASO nominal (sin orden):
#    Resultado_Egreso: "Alta", "Fallecido", "Traslado" → no tiene sentido
#    decir que uno es 'mayor' que otro → factor() sin ordered.
#    Adherencia_Tratamiento: "Si" / "No" → igual, solo dos categorías.
#    Derivacion_Especialista: "Si" / "No".
#
#  CASO ordinal (CON orden, usa levels):
#    Actividad_Fisica: Sedentario < Leve < Moderada < Intensa → el orden
#    sí importa para interpretar resultados. Usa factor(..., ordered=TRUE).
#    Escolaridad: Primaria < Secundaria < Universidad → también ordinal.
#
#  ¿Qué variables del caso oncológico NO hay que convertir?
#    CEA_ng_mL, AFP_ng_mL, CA125_U_mL, Dias_Estancia, Costo_Total_COP,
#    Satisfaccion_1_10 → ya son numéricas (<num>), NO se convierten.

# *** Ajusta según las variables que te asignen ***

# Variables nominales → factor
base$Sexo                    <- factor(base$Sexo)
base$Area_Hospitalizacion    <- factor(base$Area_Hospitalizacion)
base$Resultado_Egreso        <- factor(base$Resultado_Egreso)
base$Reingreso_30dias        <- factor(base$Reingreso_30dias)
base$Adherencia_Tratamiento  <- factor(base$Adherencia_Tratamiento)
base$Derivacion_Especialista <- factor(base$Derivacion_Especialista)
base$Regimen_Salud           <- factor(base$Regimen_Salud)
base$Zona                    <- factor(base$Zona)
base$Grupo_Etario            <- factor(base$Grupo_Etario)
base$Clasificacion_IMC       <- factor(base$Clasificacion_IMC)
base$Escolaridad             <- factor(base$Escolaridad)
base$Estado_Civil            <- factor(base$Estado_Civil)
base$Dieta                   <- factor(base$Dieta)

# Variable ordinal → factor ordenado (define los niveles de menor a mayor)
# Ejemplo: satisfacción del 1 al 10 → ya es numérica, no necesita orden
# Ejemplo ordinal textual:
base$Actividad_Fisica <- factor(base$Actividad_Fisica,
                                levels = c("Sedentario", "Leve",
                                           "Moderada", "Intensa"),
                                ordered = TRUE)

# Confirmar la nueva estructura
str(base)


##############################
# 05. FILTRAR SUBGRUPO POBLACIONAL
##############################
#
# ¿CUÁNDO USAR CADA OPERADOR DE FILTRO?
#
#  == (igual exacto)
#    CASO: el enunciado dice "pacientes del área de Oncología".
#    subgrupo <- subset(base, Area_Hospitalizacion == "Oncologia")
#
#  | (OR: uno O el otro)
#    CASO: el enunciado dice "pacientes oncológicos O pacientes que
#    reingresaron al hospital dentro de los 30 días" → exactamente
#    el caso de este parcial. Incluye a los que cumplen UNO o AMBOS.
#    subgrupo <- subset(base, Area_Hospitalizacion == "Oncologia" |
#                             Reingreso_30dias == "Si")
#
#  & (AND: ambos a la vez)
#    CASO: el enunciado dice "mujeres oncológicas" (Sexo Y Área).
#    Siempre REDUCE el subgrupo (más restrictivo que |).
#    subgrupo <- subset(base, Sexo == "Femenino" &
#                             Area_Hospitalizacion == "Oncologia")
#
#  != (diferente, negación de uno)
#    CASO: "todos los pacientes EXCEPTO los de Urgencias".
#
#  >= / <= (rango numérico)
#    CASO: "pacientes adultos mayores" (Edad_Años >= 60),
#    o "estancias prolongadas" (Dias_Estancia > 15).
#
#  %in% (pertenece a un conjunto de valores)
#    CASO: "pacientes con diagnóstico de Cáncer de mamá O Leucemia O
#    Linfoma" → subset(base, Diagnostico_Principal %in%
#                c("Cancer mama", "Leucemia", "Linfoma"))
#
# ¿CÓMO USAR subset()? — GUÍA DE SINTAXIS
# ─────────────────────────────────────────────────────────────
#  subgrupo <- subset( BASE ,  CONDICIÓN )
#                       │           │
#                       │     variable$columna  OPERADOR  "valor"
#                       │     ej: Area_Hospitalizacion == "Oncologia"
#                       │
#               siempre 'base' (la base completa, no el subgrupo)
#
#  REGLA de los valores de texto:  siempre entre comillas "..."
#  REGLA de los valores numéricos: sin comillas  (Edad_Años >= 60)
#
#  Para el caso de este parcial (OR de dos condiciones):
#
#    subgrupo <- subset(base,
#                       Area_Hospitalizacion == "Oncologia"  |  <- condición 1
#                       Reingreso_30dias     == "Si")           <- condición 2
#                                            ↑
#                                   | = O    & = Y
#
#  Cómo verificar que el filtro quedó bien:
#    nrow(subgrupo)          # cuántos pacientes quedaron
#    table(subgrupo$Area_Hospitalizacion)   # ¿solo aparece Oncologia?
#    table(subgrupo$Reingreso_30dias)       # ¿cuántos con "Si"?

# *** ESTE BLOQUE ES EL MÁS IMPORTANTE DEL EXAMEN ***
# *** Reemplaza la condición según lo que el profesor indique ***

# --- Ejemplo 1: Un solo criterio ---
# Pacientes del área de Oncología
subgrupo <- subset(base, Area_Hospitalizacion == "Oncologia")

# --- Ejemplo 2: Operador OR  (|)  uno O el otro ---
# Oncología O reingreso en 30 días
subgrupo <- subset(base,
                   Area_Hospitalizacion == "Oncologia" |
                   Reingreso_30dias == "Si")

# --- Ejemplo 3: Operador AND (&)  ambos a la vez ---
# Mujeres con reingreso
subgrupo <- subset(base, Sexo == "Femenino" & Reingreso_30dias == "Si")

# --- Ejemplo 4: Negación (!)  todo lo que NO cumple ---
# Pacientes que NO son de Urgencias
subgrupo <- subset(base, Area_Hospitalizacion != "Urgencias")

# --- Ejemplo 5: Rango numérico ---
# Pacientes adultos mayores (≥ 60 años)
subgrupo <- subset(base, Edad_Años >= 60)

# Ver tamaño del subgrupo
dim(subgrupo)
nrow(subgrupo)

# Vista rápida
head(subgrupo)
summary(subgrupo)


##############################
# 06. GUARDAR / CARGAR RData
##############################
#
# ¿CUÁNDO USAR save() y load()?
#  → Cuando el filtro y la limpieza toman tiempo y no quieres
#  repetirlos en cada sesión. Guardas el objeto procesado y en la
#  siguiente sesión solo cargas el .RData.
#
#  CASO: Filtraste el subgrupo de pacientes oncológicos + reingresos
#  (puede ser un proceso con varios pasos). Guardas:
#    save(subgrupo, file = "subgrupo_examen.RData")
#  Al día siguiente o en otro equipo, solo ejecutas:
#    load("subgrupo_examen.RData")
#  y tienes el objeto listo, sin volver a correr los pasos anteriores.
#
#  DIFERENCIA save() vs saveRDS():
#    save()    guarda uno o varios objetos CON su nombre → al cargar
#              con load() el objeto vuelve con el mismo nombre.
#    (No se incluye saveRDS en esta plantilla, pero existe para
#     guardar un único objeto que se importa con un nombre distinto.)

# Guardar UN objeto
save(subgrupo, file = "subgrupo_examen.RData")

# Guardar VARIOS objetos
save(base, subgrupo, file = "objetos_examen.RData")

# Verificar que el archivo quedó guardado
list.files()

# Eliminar objetos de memoria (para probar la carga)
rm(subgrupo)

# Cargar el archivo guardado
load("subgrupo_examen.RData")

# Confirmar que volvió
ls()
head(subgrupo)


##############################
# 07. MEDIDAS DESCRIPTIVAS (CUANTITATIVAS)
##############################
#
# ¿CUÁNDO USAR CADA MEDIDA?
#
#  mean()     → distribución SIMÉTRICA o aproximadamente normal.
#    CASO: Dias_Estancia, Satisfaccion_1_10, TA_Sistolica.
#    NO usar como resumen único en marcadores tumorales (sesgados).
#
#  median()   → distribución ASIMÉTRICA o con valores atípicos.
#    CASO: CEA_ng_mL, AFP_ng_mL, CA125_U_mL → los marcadores tumorales
#    tienen distribuciones con cola larga a la derecha (pocos pacientes
#    con valores muy altos). La mediana es más representativa.
#    También para Costo_Total_COP (hay costos extremadamente altos).
#
#  moda()     → el valor que más se repite.
#    CASO: Dias_Estancia → si la mayoría de los oncológicos estuvo
#    exactamente 7 días, la moda lo revela. útil para comunicar
#    'el caso más frecuente'.
#
#  sd() / var() → dispersión alrededor de la media.
#    CASO: comparar variabilidad de Dias_Estancia entre dos áreas.
#    Alta sd → los días varían mucho entre pacientes.
#
#  CV (%)     → comparar variabilidad relativa entre variables
#    con DIFERENTES unidades o escalas.
#    CASO: comparar cuál es más variable, CEA (ng/mL) vs CA125 (U/mL).
#    Si CV > 30% la variable es muy heterogénea.
#
#  quantile() / percentiles → cuando necesitas rangos o umbrales.
#    CASO: el 25% de los pacientes oncológicos tuvo un costo inferior
#    a $X (Q1), el 75% inferior a $Y (Q3). El médico quiere saber
#    el percentil 90 de CEA como punto de corte clínico.

# *** Cambia 'Dias_Estancia' por la variable numérica que uses ***

x <- subgrupo$Dias_Estancia   # ← REEMPLAZAR con tu variable

# --- Función moda (R no la trae por defecto) ---
moda <- function(v) {
  uv <- unique(v[!is.na(v)])
  uv[which.max(tabulate(match(v, uv)))]
}

# Tamaño de la muestra
length(x)

# Mínimo y máximo
min(x, na.rm = TRUE)
max(x, na.rm = TRUE)

# Rango
max(x, na.rm = TRUE) - min(x, na.rm = TRUE)

# Media aritmética
mean(x, na.rm = TRUE)

# Mediana
median(x, na.rm = TRUE)

# Moda
moda(x)

# Varianza
var(x, na.rm = TRUE)

# Desviación estándar
sd(x, na.rm = TRUE)

# Coeficiente de variación (%)
sd(x, na.rm = TRUE) / mean(x, na.rm = TRUE) * 100

# Cuartiles (Q1, Q2, Q3)
quantile(x, probs = c(0.25, 0.50, 0.75), na.rm = TRUE)

# Deciles
quantile(x, probs = seq(0.1, 0.9, by = 0.1), na.rm = TRUE)

# Percentiles específicos
quantile(x, probs = c(0.05, 0.10, 0.90, 0.95), na.rm = TRUE)

# Resumen completo de una sola vez
summary(x)

# --- Resumen de TODAS las variables numéricas del subgrupo ---
numericas <- sapply(subgrupo, is.numeric)
base_num  <- subgrupo[, numericas]

summary(base_num)
sapply(base_num, mean,   na.rm = TRUE)
sapply(base_num, median, na.rm = TRUE)
sapply(base_num, sd,     na.rm = TRUE)
sapply(base_num, var,    na.rm = TRUE)


##############################
# 08. MEDIDAS DESCRIPTIVAS POR GRUPOS
##############################
#
# ¿CUÁNDO USAR tapply() vs by()?
#
#  tapply(num, grupo, fun)  → cuando necesitas UNA medida específica
#    (media, mediana, sd) de una variable numérica separada por grupo.
#    CASO 1: ¿Los hombres y las mujeres oncológicas tienen la misma
#    estancia promedio?
#      tapply(subgrupo$Dias_Estancia, subgrupo$Sexo, mean, na.rm=TRUE)
#    CASO 2: ¿El costo promedio difiere según el resultado del egreso
#    (Alta, Fallecido, Traslado)? → puede revelar si los fallecidos
#    generaron más gasto.
#      tapply(subgrupo$Costo_Total_COP, subgrupo$Resultado_Egreso,
#             mean, na.rm=TRUE)
#    CASO 3: Mediana de CEA_ng_mL según Adherencia_Tratamiento →
#    ¿los que no adhéren tienen marcadores tumorales más altos?
#      tapply(subgrupo$CEA_ng_mL, subgrupo$Adherencia_Tratamiento,
#             median, na.rm=TRUE)
#
#  by(num, grupo, summary) → cuando necesitas el RESUMEN COMPLETO
#    (mín, Q1, mediana, media, Q3, máx) de cada grupo.
#    CASO: descripción completa de Dias_Estancia por sexo para el
#    análisis comparativo en el informe del examen.

# tapply: aplica una función a una variable numérica, separada por grupos
# tapply(variable_num, variable_grupo, función)

tapply(subgrupo$Dias_Estancia, subgrupo$Sexo,    mean, na.rm = TRUE)
tapply(subgrupo$Costo_Total_COP, subgrupo$Resultado_Egreso, mean, na.rm = TRUE)

# by: resumen completo por grupo
by(subgrupo$Dias_Estancia, subgrupo$Sexo, summary)


##############################
# 09. TABLAS DE FRECUENCIA
##############################
#
# ¿CUÁNDO USAR CADA TIPO DE TABLA?
#
#  table() simple → una sola variable categórica.
#    CASO: ¿Cuáles son los diagnósticos predominantes en el subgrupo?
#      table(subgrupo$Diagnostico_Principal)
#    CASO: ¿Cuántos pacientes cumplieron con el tratamiento?
#      table(subgrupo$Adherencia_Tratamiento)
#
#  prop.table() → frecuencias relativas (proporciones o %).
#    CASO: el enunciado pide "proporciones absolutas y relativas" de
#    Resultado_Egreso → combinas table() + prop.table().
#    CASO: ¿Qué porcentaje fue derivado a especialista?
#      round(100 * prop.table(table(subgrupo$Derivacion_Especialista)), 2)
#
#  tabla completa (fi, hi, Fi, Hi) → cuando el examen pide una tabla
#    de frecuencias COMPLETA con acumulados.
#    CASO: distribución de Resultado_Egreso con frecuencias absolutas,
#    relativas, acumuladas absolutas y acumuladas relativas.
#
#  tabla cruzada (2 variables) → relación entre dos categóricas.
#    CASO: ¿La adherencia al tratamiento varía según el resultado
#    del egreso? → table(subgrupo$Adherencia_Tratamiento,
#                        subgrupo$Resultado_Egreso)
#
#  prop.table(margin=1) → porcentajes por FILA.
#    CASO: de los pacientes que SÍ adhéren, ¿qué % tuvo alta?;
#    de los que NO adhéren, ¿qué % falleció? (leer fila por fila)
#
#  prop.table(margin=2) → porcentajes por COLUMNA.
#    CASO: de los fallecidos, ¿qué % venía con mala adherencia?
#    (leer columna por columna)

# *** Cambia la variable según lo que uses ***

# --- Tabla simple: frecuencias absolutas ---
tabla_resultado <- table(subgrupo$Resultado_Egreso)
tabla_resultado

# Frecuencias relativas (proporciones)
prop.table(tabla_resultado)

# Frecuencias porcentuales
round(100 * prop.table(tabla_resultado), 2)

# --- Tabla completa como data.frame ---
fi  <- table(subgrupo$Resultado_Egreso)
hi  <- prop.table(fi)
Fi  <- cumsum(fi)
Hi  <- cumsum(hi)

tabla_completa <- data.frame(
  Categoria  = names(fi),
  fi         = as.vector(fi),
  hi         = round(as.vector(hi), 4),
  Porcentaje = round(100 * as.vector(hi), 2),
  Fi         = as.vector(Fi),
  Hi         = round(as.vector(Hi), 4)
)
tabla_completa

# --- Tabla cruzada: dos variables categóricas ---
tabla_cruzada <- table(subgrupo$Sexo, subgrupo$Resultado_Egreso)
tabla_cruzada

# Proporciones por fila (dentro de cada sexo, ¿qué % de cada resultado?)
round(prop.table(tabla_cruzada, margin = 1), 3)

# Proporciones por columna (dentro de cada resultado, ¿qué % de cada sexo?)
round(prop.table(tabla_cruzada, margin = 2), 3)

# Proporciones globales
round(100 * prop.table(tabla_cruzada), 2)


##############################
# 10. TABLA AGRUPADA POR STURGES (variable continua)
##############################
#
# ¿CUÁNDO USAR la tabla de Sturges?
#  → Cuando tienes una variable NUMÉRICA CONTINUA y el enunciado pide
#  "tabla de distribución de frecuencias agrupada por intervalos".
#  No es adecuada para variables discretas con pocos valores.
#
#  CASO 1: "Describa la distribución de Dias_Estancia en pacientes
#    oncológicos usando una tabla de frecuencias agrupada."
#    → variable continua, puede tomar muchos valores distintos.
#
#  CASO 2: Costo_Total_COP, Costo_Por_Dia_COP → variables monetarias
#    con rango amplio → ideales para Sturges.
#
#  CASO 3: CEA_ng_mL, AFP_ng_mL → marcadores tumorales con rango
#    variable y distribución asimétrica. La tabla agrupa los rangos
#    de valores (ej. 0-5 ng/mL, 5-10 ng/mL, etc.).
#
#  NOTA: Sturges calcula automáticamente el número de clases k
#  según n (tamaño de muestra): k = 1 + 3.322 * log10(n)
#  Con n=200 pacientes oncológicos, k ≈ 8-9 intervalos.

# *** Usa una variable continua como Dias_Estancia, Costo_Total_COP, etc. ***

x <- subgrupo$Dias_Estancia   # ← REEMPLAZAR

n <- length(x[!is.na(x)])

# Número de clases (Sturges)
k <- ceiling(1 + 3.322 * log10(n))
k

# Rango y amplitud
R <- max(x, na.rm = TRUE) - min(x, na.rm = TRUE)
A <- R / k

# Puntos de corte
breaks <- seq(from = min(x, na.rm = TRUE),
              to   = max(x, na.rm = TRUE),
              length.out = k + 1)

# Clasificar en intervalos
intervalos <- cut(x, breaks = breaks, include.lowest = TRUE, right = FALSE)

# Frecuencias
fi_s <- table(intervalos)
hi_s <- prop.table(fi_s)
Fi_s <- cumsum(fi_s)
Hi_s <- cumsum(hi_s)

tabla_sturges <- data.frame(
  Intervalo  = names(fi_s),
  fi         = as.vector(fi_s),
  hi         = round(as.vector(hi_s), 4),
  Porcentaje = round(100 * as.vector(hi_s), 2),
  Fi         = as.vector(Fi_s),
  Hi         = round(as.vector(Hi_s), 4)
)
tabla_sturges


##############################
# 11. DETECCIÓN DE VALORES ATÍPICOS (IQR)
##############################
#
# ¿CUÁNDO BUSCAR ATÍPICOS?
#  → Siempre que el enunciado mencione "valores extremos", "outliers",
#  o pida interpretar un boxplot con puntos fuera de los bigotes.
#
#  CASO 1: Dias_Estancia → un paciente oncológico con 120 días de
#    estancia es probablemente un atípico (complicación grave o error
#    de registro). Identifícalo con el método IQR.
#
#  CASO 2: CEA_ng_mL o CA125_U_mL → los marcadores tumorales tienen
#    frecuentemente valores extremadamente altos en casos avanzados.
#    El método IQR detecta estos outliers clínicamente relevantes.
#
#  CASO 3: Costo_Total_COP → una cirugía muy compleja puede generar
#    un costo 10x mayor al promedio. Ese registro es atípico.
#
#  INTERPRETACIÓN:
#    lim_inf = Q1 - 1.5*RIQ  → valores por debajo: atípicos bajos
#    lim_sup = Q3 + 1.5*RIQ  → valores por encima: atípicos altos
#    En marcadores tumorales casi siempre los atípicos son valores
#    muy ALTOS (la enfermedad eleva los niveles).

# *** Reemplaza la variable según lo que uses ***

x <- subgrupo$Dias_Estancia

Q1  <- quantile(x, 0.25, na.rm = TRUE)
Q3  <- quantile(x, 0.75, na.rm = TRUE)
RIQ <- Q3 - Q1

lim_inf <- Q1 - 1.5 * RIQ
lim_sup <- Q3 + 1.5 * RIQ

cat("Límite inferior:", lim_inf, "\n")
cat("Límite superior:", lim_sup, "\n")

# Valores que están fuera de los límites
atipicos <- x[x < lim_inf | x > lim_sup]
atipicos
length(atipicos)


##############################
# 12. CORRELACIÓN Y MATRIZ DE CORRELACIÓN
##############################
#
# ¿CUÁNDO USAR cor()?
#  → Cuando el enunciado pide "relación entre dos variables numéricas"
#  o "análisis de correlación". El resultado va de -1 a 1.
#
#  CASO 1: ¿Más días de estancia implica mayor costo?
#    cor(subgrupo$Dias_Estancia, subgrupo$Costo_Total_COP)
#    → Se espera correlación POSITIVA alta (~0.7-0.9): más días = más costo.
#
#  CASO 2: ¿Los pacientes mayores permanecen más tiempo hospitalizados?
#    cor(subgrupo$Edad_Años, subgrupo$Dias_Estancia)
#    → Correlación positiva moderada si hay relación, débil si no.
#
#  CASO 3: ¿Los marcadores tumorales CEA y AFP se elevan juntos?
#    cor(subgrupo$CEA_ng_mL, subgrupo$AFP_ng_mL, use="complete.obs")
#    → Si ambos marcan tumor activo, se espera correlación positiva.
#    use="complete.obs" es OBLIGATORIO con NAs (muy común en marcadores).
#
#  CASO 4: ¿Mayor satisfacción se asocia con menor estancia?
#    cor(subgrupo$Satisfaccion_1_10, subgrupo$Dias_Estancia)
#    → Podría ser negativa si hospitalizaciones más cortas generan
#    mejor satisfacción.
#
#  MATRIZ de correlación → cuando quieres explorar TODAS las relaciones
#  numéricas de una vez. Útil para el análisis exploratorio global.

# Correlación entre dos variables numéricas (-1 a 1)
# cerca de 1  → relación positiva fuerte
# cerca de -1 → relación negativa fuerte
# cerca de 0  → relación lineal débil

cor(subgrupo$Dias_Estancia, subgrupo$Costo_Total_COP, use = "complete.obs")
cor(subgrupo$Edad_Años,     subgrupo$Dias_Estancia,   use = "complete.obs")

# Seleccionar solo variables numéricas para la matriz
numericas   <- sapply(subgrupo, is.numeric)
base_num    <- subgrupo[, numericas]

# Eliminar columnas con demasiados NA para no perder filas
base_num_limpia <- base_num[, colSums(is.na(base_num)) < nrow(base_num) * 0.5]

# Matriz de correlación
matriz_cor <- cor(base_num_limpia, use = "complete.obs")
round(matriz_cor, 2)


############################################################
# 13. GRÁFICOS R BASE
############################################################
#
# ¿CUÁNDO USAR R BASE vs ggplot2 (secc. 14)?
#  R base  → cuando el enunciado NO especifica ggplot2, cuando
#             necesitas algo rápido, o cuando el profesor no pide
#             estética especial. Más simple de escribir.
#  ggplot2 → cuando el enunciado pide un gráfico con mayor calidad
#             visual, facetas, colores por grupo, o el profesor
#             exige explícitamente ggplot2.

# ============================================================
# 13.1 BARPLOT — variable categórica (frecuencias absolutas)
# ============================================================
#
# ¿CUÁNDO? Variable CATEGÓRICA → quieres ver cuántos pacientes
# hay en cada categoría.
#
# CASO 1: ¿Cuál es el diagnóstico predominante en el subgrupo?
#   barplot(table(subgrupo$Diagnostico_Principal))
#   → el bar más alto revela el diagnóstico más frecuente.
#
# CASO 2 (porcentajes): el enunciado pide representar proporciones
# de Resultado_Egreso → usa 100*prop.table().
#
# ¿CÓMO USAR barplot()? — GUÍA DE SINTAXIS
# ─────────────────────────────────────────────────────────────
#  Paso 1 — crear la tabla de frecuencias de tu variable categórica:
#    tabla_XXX <- table( subgrupo$VARIABLE_CATEGORICA )
#                                    │
#                         la variable que el enunciado pide graficar
#                         (ej. Diagnostico_Principal, Resultado_Egreso,
#                              Adherencia_Tratamiento)
#
#  Paso 2 — graficar:
#    barplot( tabla_XXX ,
#             main = "Título descriptivo",
#             xlab = "Nombre del eje X",   <- suele ser el nombre de la variable
#             ylab = "Frecuencia",          <- o "Porcentaje" si usas prop.table
#             col  = "steelblue")           <- cualquier color de R
#
#  Para porcentajes en vez de conteos, envuelve con prop.table:
#    barplot( 100 * prop.table(tabla_XXX) , ...)
#             └─────────────────────────┘
#               convierte conteos → porcentajes 0-100
tabla_res <- table(subgrupo$Resultado_Egreso)

barplot(tabla_res,
        main = "Resultado del egreso",        # título
        xlab = "Resultado",                    # eje x
        ylab = "Frecuencia",                   # eje y
        col  = "steelblue")                    # color

# Con proporciones porcentuales
barplot(100 * prop.table(tabla_res),
        main = "Resultado del egreso (%)",
        xlab = "Resultado",
        ylab = "Porcentaje",
        col  = "tomato")


# ============================================================
# 13.2 PIE — diagrama de sectores (variable categórica)
# ============================================================
#
# ¿CUÁNDO? Variable CATEGÓRICA con POCAS categorías (2-5).
# Ideal para proporciones donde el todo = 100%.
#
# CASO 1: Adherencia_Tratamiento ("Si" / "No") → dos sectores
#   muestran de un vistazo qué porcentaje adhió al tratamiento.
#
# CASO 2: Derivacion_Especialista ("Si" / "No") → igual.
#
# EVITAR con muchas categorías (ej. Diagnostico_Principal con 15
# diagnósticos) → los sectores quedan ilegibles; mejor barplot.
tabla_sexo <- table(subgrupo$Sexo)

pie(tabla_sexo,
    main = "Distribución por sexo",
    col  = c("lightblue", "pink"))


# ============================================================
# 13.3 HISTOGRAMA — variable cuantitativa continua
# ============================================================
#
# ¿CUÁNDO? Variable NUMÉRICA CONTINUA → quieres ver la FORMA
# de la distribución (simétrica, sesgada, bimodal).
#
# CASO 1: CEA_ng_mL, AFP_ng_mL, CA125_U_mL → marcadores tumorales.
#   El enunciado pide "descripción de marcadores tumorales (hist —
#   distribución asimétrica)". El histograma mostrará la cola
#   larga a la derecha (sesgo positivo): la mayoría tiene valores
#   bajos, unos pocos tienen valores muy elevados.
#
# CASO 2: Costo_Total_COP → también tiene distribución asimétrica.
#   Usa breaks = 15-20 para ver bien los intervalos.
hist(subgrupo$Dias_Estancia,
     main   = "Histograma de días de estancia",
     xlab   = "Días de estancia",
     ylab   = "Frecuencia",
     col    = "steelblue",
     border = "white")

# Con breaks personalizados (número de barras)
hist(subgrupo$Costo_Total_COP,
     breaks = 15,
     main   = "Distribución del costo total",
     xlab   = "Costo total (COP)",
     ylab   = "Frecuencia",
     col    = "goldenrod1")


# ============================================================
# 13.4 BOXPLOT — distribución de una variable numérica
# ============================================================
#
# ¿CUÁNDO? Variable NUMÉRICA → ver mediana, RIQ, rango y atípicos
# en una sola figura.
#
# CASO: el enunciado pide "carga económica (summary, hist)" o
# "estancia en este grupo de alta complejidad (boxplot)".
# → boxplot(subgrupo$Dias_Estancia) muestra:
#   • línea central = mediana de días
#   • caja = 50% central de los pacientes
#   • bigotes = rango sin outliers
#   • puntos aislados = estancias anormalmente largas
boxplot(subgrupo$Dias_Estancia,
        main = "Boxplot de días de estancia",
        ylab = "Días",
        col  = "lightgreen")

# Línea de la mediana = línea dentro de la caja
# La caja cubre el 50% central de los datos
# Puntos fuera de los bigotes = posibles atípicos


# ============================================================
# 13.5 BOXPLOT POR GRUPOS — categórica vs numérica
# ============================================================
#
# ¿CUÁNDO? Quieres COMPARAR la distribución de una variable
# numérica entre diferentes grupos.
#
# CASO 1: ¿Los hombres y las mujeres tienen diferente estancia?
#   boxplot(Dias_Estancia ~ Sexo, data = subgrupo)
#
# CASO 2: ¿El costo difiere según Resultado_Egreso?
#   boxplot(Costo_Total_COP ~ Resultado_Egreso, data = subgrupo)
#   → Si la caja de "Fallecido" está más alta, confirmó mayor costo.
#
# CASO 3: ¿La satisfacción varía según si fue derivado a especialista?
#   boxplot(Satisfaccion_1_10 ~ Derivacion_Especialista, data=subgrupo)
#
# ¿CÓMO USAR boxplot() por grupos? — GUÍA DE SINTAXIS
# ─────────────────────────────────────────────────────────────
#  boxplot( NUMERICA ~ CATEGORICA ,  data = subgrupo , ...)
#               │           │
#               │      variable que define los grupos (eje X)
#               │      → la que tiene categorías: Sexo, Resultado_Egreso,
#               │        Adherencia_Tratamiento, Derivacion_Especialista
#               │
#          variable cuya distribución quieres comparar (eje Y)
#          → la numérica: Dias_Estancia, Costo_Total_COP,
#            Satisfaccion_1_10, CEA_ng_mL
#
#  El símbolo ~ se lee "según" o "en función de".
#  Ejemplos directos del parcial:
#    boxplot(Dias_Estancia    ~ Sexo,                  data = subgrupo)
#    boxplot(Costo_Total_COP  ~ Resultado_Egreso,      data = subgrupo)
#    boxplot(Satisfaccion_1_10 ~ Adherencia_Tratamiento, data = subgrupo)
#
#  col = c("color1", "color2") → un color por cada categoría;
#  si hay 3 categorías → 3 colores en el vector.
boxplot(Dias_Estancia ~ Sexo, data = subgrupo,
        main = "Días de estancia según sexo",
        xlab = "Sexo",
        ylab = "Días de estancia",
        col  = c("lightblue", "pink"))

boxplot(Costo_Total_COP ~ Resultado_Egreso, data = subgrupo,
        main = "Costo total según resultado del egreso",
        xlab = "Resultado",
        ylab = "Costo (COP)",
        col  = "peachpuff")


# ============================================================
# 13.6 BOXPLOT MÚLTIPLE — varias variables juntas
# ============================================================
#
# ¿CUÁNDO? Quieres comparar VARIAS variables numéricas en la
# misma figura. Solo funciona bien si tienen escalas similares.
#
# CASO: comparar los tres marcadores tumorales del paciente
# oncológico en la misma figura para ver cuál tiene mayor
# dispersión. Si CEA, AFP y CA125 tienen unidades diferentes,
# mejor hacer boxplots separados.
boxplot(subgrupo$TA_Sistolica_mmHg,
        subgrupo$TA_Diastolica_mmHg,
        subgrupo$Frecuencia_Cardiaca,
        names = c("TA Sistólica", "TA Diastólica", "Frec. Cardiaca"),
        main  = "Comparación de signos vitales",
        col   = c("salmon", "skyblue", "lightgreen"))


# ============================================================
# 13.7 DIAGRAMA DE DISPERSIÓN — dos variables numéricas
# ============================================================
#
# ¿CUÁNDO? Cuando quieres VISUALIZAR la correlación entre dos
# variables numéricas (complementá con cor()).
#
# CASO 1: Edad vs Dias_Estancia → ¿los puntos suben hacia la
#   derecha? (correlación positiva)
#
# CASO 2: CEA vs CA125 → ¿ambos marcadores se elevan juntos?
#   Nube de puntos con tendencia hacia arriba → sí.
#
# CASO 3: Satisfaccion vs Costo_Por_Dia_COP → ¿más caro = más
#   satisfecho? La nube dispersa/plana indicaría que no hay relación.
plot(subgrupo$Edad_Años, subgrupo$Dias_Estancia,
     main = "Relación entre edad y días de estancia",
     xlab = "Edad (años)",
     ylab = "Días de estancia",
     pch  = 19,         # tipo de punto (19 = círculo sólido)
     col  = "navy",
     cex  = 0.7)        # tamaño del punto

# Línea de tendencia lineal
abline(lm(Dias_Estancia ~ Edad_Años, data = subgrupo),
       col = "red", lwd = 2)


# ============================================================
# 13.8 POLÍGONO DE FRECUENCIAS
# ============================================================
#
# ¿CUÁNDO? Alternativa al histograma cuando el enunciado pide
# explcítamente "polígono de frecuencias".
# → Mismo caso que el histograma pero en línea.
# CASO: Dias_Estancia → ver la forma de la distribución con
# una curva en lugar de barras.
h <- hist(subgrupo$Dias_Estancia, plot = FALSE)

plot(h$mids, h$counts, type = "b",
     main = "Polígono de frecuencias: días de estancia",
     xlab = "Días de estancia",
     ylab = "Frecuencia",
     col  = "purple", pch = 19)


# ============================================================
# 13.9 OJIVA (frecuencia acumulada)
# ============================================================
#
# ¿CUÁNDO? Cuando el enunciado pide FRECUENCIA ACUMULADA
# graficada, o quieres responder "el X% de los pacientes tuvo
# menos de Y días de estancia".
# CASO: Costo_Total_COP → la ojiva permite leer directamente
# qué porcentaje de pacientes tuvo un costo por debajo de un
# umbral específico (ej. 5.000.000 COP).
plot(h$mids, cumsum(h$counts), type = "o",
     main = "Ojiva: días de estancia",
     xlab = "Días de estancia",
     ylab = "Frecuencia acumulada",
     col  = "darkgreen", pch = 16)


############################################################
# 14. GRÁFICOS ggplot2
############################################################
#
# ¿CUÁNDO PREFERIR ggplot2 SOBRE R BASE?
#  → Cuando el enunciado dice explícitamente "usa ggplot2", cuando
#  necesitas colorear por una tercera variable (fill = Grupo),
#  o cuando quieres gráficos de publicación con theme_minimal().
#  La lógica es siempre: ggplot(data, aes(...)) + geom_TIPO() + labs()

# RECORDATORIO de la lógica:
# ggplot(data = base, aes(x = ..., y = ..., fill = ...)) +
#   geom__TIPO_() +
#   labs(title = "...", x = "...", y = "...") +
#   theme_minimal()

# ============================================================
# 14.1 BARRAS — variable categórica (geom_bar)
# ============================================================
#
# ¿CUÁNDO? Mismo caso que barplot() de R base, pero en ggplot2.
# CASO: Diagnostico_Principal o Resultado_Egreso → ver la
# frecuencia de cada categoría con un gráfico más estético.
#
# ¿CÓMO USAR geom_bar()? — GUÍA DE SINTAXIS
# ─────────────────────────────────────────────────────────────
#  ggplot(data = subgrupo,  aes(x = VARIABLE_CATEGORICA)) +
#                                        │
#                           la variable que va en el eje X
#                           (la que tiene categorías a contar)
#                           ej: Resultado_Egreso, Diagnostico_Principal
#
#    geom_bar(fill = "color")  ← geom_bar cuenta solo, no necesitas table()
#
#    labs(title = "...",
#         x     = "Nombre eje X",   ← etiqueta legible de la variable
#         y     = "Frecuencia") +   ← siempre "Frecuencia" en geom_bar
#
#  Para barras AGRUPADAS (dos categóricas):
#    aes(x = CATEGORICA_EJE_X,  fill = CATEGORICA_COLOR)
#                │                          │
#              eje X                  divide cada barra en colores
#    geom_bar(position = "dodge")   ← barras separadas
#    geom_bar(position = "fill")    ← proporciones apiladas al 100%
g1 <- ggplot(data = subgrupo, aes(x = Resultado_Egreso)) +
  geom_bar(fill = "steelblue") +
  labs(title = "Resultado del egreso",
       x     = "Resultado",
       y     = "Frecuencia") +
  theme_minimal()

print(g1)


# ============================================================
# 14.2 BARRAS AGRUPADAS — dos variables categóricas
# ============================================================
#
# ¿CUÁNDO?
#  position="dodge" → barras una al lado de la otra.
#    CASO: comparar Resultado_Egreso entre Hombres y Mujeres
#    (ver si el patrón de alta/fallecido es diferente por sexo).
#
#  position="fill" → barras apiladas al 100% (proporciones).
#    CASO: el enunciado pide "proporción de adherencia por
#    resultado del egreso" → cada barra llega al 100% y
#    se ve el peso relativo de cada grupo.
g2 <- ggplot(data = subgrupo, aes(x = Resultado_Egreso, fill = Sexo)) +
  geom_bar(position = "dodge") +        # "dodge" = una al lado de la otra
  labs(title = "Resultado del egreso según sexo",
       x     = "Resultado",
       y     = "Frecuencia",
       fill  = "Sexo") +
  theme_minimal()

print(g2)

# Con position = "fill" → proporciones (100% apiladas)
g2b <- ggplot(data = subgrupo, aes(x = Resultado_Egreso, fill = Sexo)) +
  geom_bar(position = "fill") +
  labs(title = "Proporción de sexo por resultado de egreso",
       x     = "Resultado",
       y     = "Proporción",
       fill  = "Sexo") +
  theme_minimal()

print(g2b)


# ============================================================
# 14.3 HISTOGRAMA — variable numérica (geom_histogram)
# ============================================================
#
# ¿CUÁNDO? Igual que hist() pero en ggplot2.
# CASO: CEA_ng_mL → el enunciado pide "distribución asimétrica
# de marcadores tumorales".
# binwidth = 5 → cada barra cubre 5 ng/mL.
# Ajusta binwidth según la escala de tu variable.
g3 <- ggplot(data = subgrupo, aes(x = Dias_Estancia)) +
  geom_histogram(binwidth = 2, fill = "tomato", color = "white") +
  labs(title = "Histograma de días de estancia",
       x     = "Días de estancia",
       y     = "Frecuencia") +
  theme_minimal()

print(g3)


# ============================================================
# 14.4 CURVA DE DENSIDAD — forma de la distribución (geom_density)
# ============================================================
#
# ¿CUÁNDO? Alternativa suavizada al histograma.
# CASO: Costo_Total_COP o CEA_ng_mL → la curva de densidad
# muestra claramente el sesgo a la derecha (cola larga). Ideal
# para el enunciado que pide "describir distribución asimétrica".
# alpha=0.6 hace la curva semitransparente para ver el eje.
g4 <- ggplot(data = subgrupo, aes(x = Costo_Total_COP)) +
  geom_density(fill = "skyblue", alpha = 0.6) +
  labs(title = "Densidad del costo total",
       x     = "Costo total (COP)",
       y     = "Densidad") +
  theme_minimal()

print(g4)


# ============================================================
# 14.5 BOXPLOT SIMPLE — una variable (geom_boxplot)
# ============================================================
#
# ¿CUÁNDO? Mismo caso que boxplot() de R base.
# CASO: el enunciado pide "estancia en este grupo de alta
# complejidad (boxplot)" → muestra la distribución de
# Dias_Estancia en el subgrupo oncológico.
g5 <- ggplot(data = subgrupo, aes(y = Dias_Estancia)) +
  geom_boxplot(fill = "goldenrod1") +
  labs(title = "Boxplot de días de estancia",
       y     = "Días de estancia") +
  theme_minimal()

print(g5)


# ============================================================
# 14.6 BOXPLOT POR GRUPOS — categórica vs numérica
# ============================================================
#
# ¿CUÁNDO? Comparar distribución de una numérica entre grupos.
# CASO 1: Satisfaccion_1_10 ~ Resultado_Egreso → ¿los pacientes
#   dados de alta tienen mayor satisfacción que los trasladados?
# CASO 2: Costo_Total_COP ~ Adherencia_Tratamiento → ¿los que
#   no adhieren generan mayor costo (complicaciones)?
# theme(axis.text.x=element_text(angle=20)) → úsalo cuando los
# nombres de las categorías en el eje x son largos y se solapan.
#
# ¿CÓMO USAR geom_boxplot() por grupos? — GUÍA DE SINTAXIS
# ─────────────────────────────────────────────────────────────
#  ggplot(data = subgrupo,
#         aes(x = VARIABLE_CATEGORICA,   ← eje X  (los grupos)
#             y = VARIABLE_NUMERICA)) +  ← eje Y  (lo que se mide)
#    geom_boxplot(fill = "color")
#
#  La CATEGÓRICA siempre va en x= (forma las cajas separadas).
#  La NUMÉRICA  siempre va en y= (es lo que se distribuye).
#
#  Ejemplos directos del parcial:
#    aes(x = Sexo,                    y = Dias_Estancia)
#    aes(x = Resultado_Egreso,        y = Costo_Total_COP)
#    aes(x = Adherencia_Tratamiento,  y = Satisfaccion_1_10)
#    aes(x = Derivacion_Especialista, y = Dias_Estancia)
#
#  Si los textos del eje X se solapan, agrega al final:
#    + theme(axis.text.x = element_text(angle = 45, hjust = 1))
g6 <- ggplot(data = subgrupo, aes(x = Sexo, y = Dias_Estancia)) +
  geom_boxplot(fill = "mediumpurple1") +
  labs(title = "Días de estancia según sexo",
       x     = "Sexo",
       y     = "Días de estancia") +
  theme_minimal()

print(g6)

g6b <- ggplot(data = subgrupo,
              aes(x = Resultado_Egreso, y = Costo_Total_COP)) +
  geom_boxplot(fill = "darkseagreen2") +
  labs(title = "Costo total según resultado del egreso",
       x     = "Resultado del egreso",
       y     = "Costo total (COP)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 20, hjust = 1))

print(g6b)


# ============================================================
# 14.7 DIAGRAMA DE DISPERSIÓN — dos numéricas (geom_point)
# ============================================================
#
# ¿CUÁNDO? Visualizar la relación entre dos variables numéricas.
# alpha=0.5 → hace los puntos semitransparentes cuando hay
# muchos datos superpuestos (muy común con 2500 registros).
# CASO: Edad_Años vs Dias_Estancia → nube ascendente = más
# edad, más días. Nube plana = no hay relación.
g7 <- ggplot(data = subgrupo,
             aes(x = Edad_Años, y = Dias_Estancia)) +
  geom_point(alpha = 0.5, color = "navy") +
  labs(title = "Relación entre edad y días de estancia",
       x     = "Edad (años)",
       y     = "Días de estancia") +
  theme_minimal()

print(g7)


# ============================================================
# 14.8 DISPERSIÓN + LÍNEA DE TENDENCIA (geom_smooth)
# ============================================================
#
# ¿CUÁNDO? Cuando además del scatter quieres mostrar la
# tendencia lineal. Es la representación gráfica de la
# correlación calculada con cor().
# CASO: el enunciado pide describir la relación entre
# Costo_Total_COP y Dias_Estancia con gráfico.
# method="lm" traza la recta de regresión lineal.
# se=FALSE elimina la banda de confianza (más limpio).
g8 <- ggplot(data = subgrupo,
             aes(x = Edad_Años, y = Costo_Total_COP)) +
  geom_point(alpha = 0.4, color = "darkorange3") +
  geom_smooth(method = "lm", se = FALSE, color = "black", linewidth = 1) +
  labs(title = "Edad y costo total con línea de tendencia",
       x     = "Edad (años)",
       y     = "Costo total (COP)") +
  theme_minimal()

print(g8)


# ============================================================
# 14.9 HEATMAP DE CORRELACIONES (geom_tile)
# ============================================================
#
# ¿CUÁNDO? Cuando quieres mostrar la MATRIZ DE CORRELACIÓN
# de varias variables numéricas de forma visual.
# Rojo intenso → correlación positiva fuerte.
# Azul intenso → correlación negativa fuerte.
# Blanco       → sin correlación lineal.
# CASO: incluir Dias_Estancia, Costo_Total_COP, Satisfaccion_1_10,
# CEA_ng_mL, CA125_U_mL → el heatmap muestra de un vistazo
# qué pares de variables se mueven juntas en los pacientes
# oncológicos.

# Seleccionar numéricas (pocas variables para que sea legible)
vars_cor <- c("Edad_Años", "Dias_Estancia", "Costo_Total_COP",
              "Satisfaccion_1_10", "IMC", "Hemoglobina_g_dL")

# Mantener solo filas completas en esas columnas
subgrupo_cor <- subgrupo[complete.cases(subgrupo[, vars_cor]), vars_cor]

# Calcular matriz
mat <- cor(subgrupo_cor)
round(mat, 2)

# Pasar a formato largo para ggplot
cor_largo         <- as.data.frame(as.table(mat))
names(cor_largo)  <- c("Variable1", "Variable2", "Correlacion")

g9 <- ggplot(data = cor_largo,
             aes(x = Variable1, y = Variable2, fill = Correlacion)) +
  geom_tile(color = "white") +
  geom_text(aes(label = round(Correlacion, 2)), size = 3) +
  scale_fill_gradient2(low     = "steelblue",
                       mid     = "white",
                       high    = "firebrick",
                       midpoint = 0,
                       limits  = c(-1, 1)) +
  labs(title = "Heatmap de correlaciones",
       x     = "",
       y     = "",
       fill  = "Correlación") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

print(g9)


############################################################
# 15. GUARDAR GRÁFICOS
############################################################
#
# ¿CUÁNDO USAR png() vs pdf()?
#
#  png()  → UN solo gráfico en formato imagen.
#    CASO: el enunciado pide entregar el boxplot de Dias_Estancia
#    como imagen adjunta en el informe Word/PowerPoint.
#
#  pdf()  → VARIOS gráficos en un solo archivo PDF (varias páginas).
#    CASO: el examen pide entregar un PDF con todos los gráficos
#    del análisis (barplot, hist, boxplot, scatter).
#    IMPORTANTE: todo lo que va entre pdf(...) y dev.off() queda
#    guardado. print() es obligatorio para los objetos de ggplot2.

# --- Guardar en PNG ---
png("grafico_boxplot.png", width = 800, height = 600)
  boxplot(Dias_Estancia ~ Sexo, data = subgrupo,
          main = "Días de estancia según sexo",
          col  = c("lightblue", "pink"))
dev.off()

# --- Guardar en PDF (un archivo, varios gráficos) ---
pdf("graficos_examen.pdf", width = 10, height = 7)

  # Gráfico 1
  barplot(table(subgrupo$Resultado_Egreso),
          main = "Resultado del egreso",
          col  = "steelblue")

  # Gráfico 2
  hist(subgrupo$Dias_Estancia,
       main = "Días de estancia",
       col  = "tomato")

  # Gráfico 3
  boxplot(Dias_Estancia ~ Sexo, data = subgrupo,
          main = "Días de estancia según sexo",
          col  = c("lightblue", "pink"))

  # Gráfico ggplot dentro del PDF
  print(g8)

dev.off()

# El archivo PDF quedará en la carpeta de trabajo
list.files()


############################################################
# CONECTIVOS LÓGICOS — REFERENCIA RÁPIDA
############################################################
#
#  &   →  Y (AND):  ambas condiciones deben ser TRUE
#  |   →  O (OR):   al menos una condición es TRUE
#  !   →  NO (NOT): invierte el valor lógico
#
# Ejemplos de filtro con índices:
#   subgrupo[subgrupo$Edad_Años > 60 & subgrupo$Sexo == "Femenino", ]
#   subgrupo[subgrupo$Resultado_Egreso == "Fallecido" |
#            subgrupo$Reingreso_30dias == "Si", ]
#   subgrupo[!is.na(subgrupo$Costo_Total_COP), ]   # sin NA
#
# Equivalente con subset():
#   subset(base, Edad_Años > 60 & Sexo == "Femenino")
#   subset(base, !(Area_Hospitalizacion %in% c("Urgencias","UCI")))
#
# %in%  → pertenece a un conjunto
#   subset(base, Resultado_Egreso %in% c("Alta voluntaria", "Fallecido"))

############################################################
# REFERENCIA RÁPIDA DE SINTAXIS — GRÁFICOS Y CORRELACIÓN
############################################################
#
# Esta sección es una guía de consulta rápida.
# Cada bloque tiene la PLANTILLA genérica y un EJEMPLO concreto
# del caso oncológico/reingresos de este parcial.
#
# REGLA UNIVERSAL para saber qué variable va en qué parte:
#
#   CATEGÓRICA  →  va en el EJE X (los grupos, las barras, las cajas)
#                  ejemplos: Sexo, Resultado_Egreso, Adherencia_Tratamiento,
#                            Derivacion_Especialista, Diagnostico_Principal
#
#   NUMÉRICA    →  va en el EJE Y (lo que se mide y se distribuye)
#                  ejemplos: Dias_Estancia, Costo_Total_COP,
#                            Satisfaccion_1_10, CEA_ng_mL, AFP_ng_mL
#
#   DOS NUMÉRICAS  →  una en X y otra en Y (dispersión, correlación)
#                  eje X = variable independiente o "causa" (Edad_Años)
#                  eje Y = variable dependiente o "efecto" (Costo_Total_COP)


# ============================================================
# [A] GRÁFICO DE BARRAS — R base
# ============================================================
#
#  PLANTILLA:
#    tabla_XXX <- table(subgrupo$VARIABLE_CATEGORICA)
#    barplot(tabla_XXX,
#            main = "Título",
#            xlab = "Nombre de la variable categórica",
#            ylab = "Frecuencia",        # o "Porcentaje"
#            col  = "color")
#
#  ¿Dónde va cada variable?
#    table(subgrupo$  →→→  CATEGÓRICA  ←←←  )
#    ej: Diagnostico_Principal, Resultado_Egreso, Adherencia_Tratamiento
#
#  Para PORCENTAJES en vez de conteos:
#    barplot(100 * prop.table(tabla_XXX), ...)   ← solo cambia esto
#    ylab = "Porcentaje"                          ← y cambia la etiqueta
#
#  EJEMPLO del parcial:
#    tabla_dx <- table(subgrupo$Diagnostico_Principal)
#    barplot(tabla_dx,
#            main = "Diagnósticos predominantes en pacientes oncológicos",
#            xlab = "Diagnóstico",
#            ylab = "Frecuencia",
#            col  = "steelblue")


# ============================================================
# [B] GRÁFICO DE BARRAS — ggplot2
# ============================================================
#
#  PLANTILLA:
#    ggplot(data = subgrupo, aes(x = VARIABLE_CATEGORICA)) +
#      geom_bar(fill = "color") +
#      labs(title = "Título",
#           x     = "Nombre del eje X",
#           y     = "Frecuencia") +
#      theme_minimal()
#
#  ¿Dónde va cada variable?
#    aes(x =  →→→  CATEGÓRICA  ←←←  )
#    NO necesitas table() — geom_bar cuenta automáticamente
#
#  Para BARRAS AGRUPADAS (dos categóricas):
#    aes(x = CATEG_EJE_X,  fill = CATEG_QUE_DA_COLOR)
#    + geom_bar(position = "dodge")   ← barras separadas
#    + geom_bar(position = "fill")    ← apiladas al 100%
#    + labs(..., fill = "Nombre de la leyenda")
#
#  EJEMPLO del parcial:
#    ggplot(data = subgrupo, aes(x = Resultado_Egreso, fill = Sexo)) +
#      geom_bar(position = "dodge") +
#      labs(title = "Resultado del egreso según sexo",
#           x = "Resultado", y = "Frecuencia", fill = "Sexo") +
#      theme_minimal()


# ============================================================
# [C] HISTOGRAMA — R base
# ============================================================
#
#  PLANTILLA:
#    hist(subgrupo$VARIABLE_NUMERICA,
#         main   = "Título",
#         xlab   = "Nombre de la variable",
#         ylab   = "Frecuencia",
#         col    = "color",
#         breaks = 15,       # opcional: número de barras
#         border = "white")  # opcional: borde de las barras
#
#  ¿Dónde va cada variable?
#    hist(subgrupo$  →→→  NUMÉRICA  ←←←  , ...)
#    ej: CEA_ng_mL, AFP_ng_mL, CA125_U_mL, Dias_Estancia, Costo_Total_COP
#
#  EJEMPLO del parcial:
#    hist(subgrupo$CEA_ng_mL,
#         main   = "Distribución del marcador tumoral CEA",
#         xlab   = "CEA (ng/mL)",
#         ylab   = "Frecuencia",
#         col    = "tomato",
#         breaks = 20)
#    # Cola larga a la derecha → distribución asimétrica positiva


# ============================================================
# [D] HISTOGRAMA — ggplot2
# ============================================================
#
#  PLANTILLA:
#    ggplot(data = subgrupo, aes(x = VARIABLE_NUMERICA)) +
#      geom_histogram(binwidth = ANCHO_DE_BARRA,
#                     fill     = "color",
#                     color    = "white") +
#      labs(title = "Título", x = "Nombre", y = "Frecuencia") +
#      theme_minimal()
#
#  ¿Dónde va cada variable?
#    aes(x =  →→→  NUMÉRICA  ←←←  )   ← solo una variable
#    binwidth = cuántas unidades cubre cada barra
#      ej: si CEA va de 0 a 200, binwidth = 10 da ~20 barras
#
#  EJEMPLO del parcial:
#    ggplot(data = subgrupo, aes(x = Costo_Total_COP)) +
#      geom_histogram(binwidth = 500000, fill = "goldenrod1", color = "white") +
#      labs(title = "Distribución del costo total",
#           x = "Costo total (COP)", y = "Frecuencia") +
#      theme_minimal()


# ============================================================
# [E] BOXPLOT COMPARATIVO (2 o más cajas en un gráfico)
# ============================================================
#
#  Este es el tipo del gráfico adjunto: "Horas de sueño según si trabaja"
#  → dos cajas (No / Sí) comparando la distribución de una numérica.
#
#  PLANTILLA R base:
#    boxplot(NUMERICA ~ CATEGORICA, data = subgrupo,
#            main = "NUMÉRICA según CATEGÓRICA",
#            xlab = "Nombre de la categórica",
#            ylab = "Nombre de la numérica",
#            col  = c("color1", "color2"))   # un color por categoría
#
#  El símbolo ~ se lee "SEGÚN".
#  Izquierda del ~ = variable numérica (eje Y, la que se mide).
#  Derecha del ~  = variable categórica (eje X, define los grupos).
#
#  PLANTILLA ggplot2:
#    ggplot(data = subgrupo,
#           aes(x = CATEGORICA, y = NUMERICA)) +
#      geom_boxplot(fill = "color") +
#      labs(title = "NUMÉRICA según CATEGÓRICA",
#           x     = "Nombre de la categórica",
#           y     = "Nombre de la numérica") +
#      theme_minimal()
#
#  Reproducir el gráfico adjunto (horas de sueño / trabaja):
#    ggplot(data = subgrupo, aes(x = Trabaja, y = Horas_Sueno)) +
#      geom_boxplot(fill = "#8fbc8f") +    # verde claro
#      labs(title = "Horas de sueño según si trabaja",
#           x = "Trabaja", y = "Horas de sueño") +
#      theme_minimal()
#
#  EJEMPLOS directos del parcial:
#    # R base
#    boxplot(Dias_Estancia     ~ Sexo,                  data = subgrupo,
#            col = c("lightblue","pink"))
#    boxplot(Costo_Total_COP   ~ Resultado_Egreso,      data = subgrupo,
#            col = "peachpuff")
#    boxplot(Satisfaccion_1_10 ~ Adherencia_Tratamiento, data = subgrupo,
#            col = c("tomato","steelblue"))
#    boxplot(Dias_Estancia     ~ Derivacion_Especialista, data = subgrupo,
#            col = c("gold","skyblue"))
#
#    # ggplot2
#    ggplot(subgrupo, aes(x = Resultado_Egreso, y = Costo_Total_COP)) +
#      geom_boxplot(fill = "darkseagreen2") +
#      labs(title = "Costo según resultado del egreso",
#           x = "Resultado del egreso", y = "Costo total (COP)") +
#      theme_minimal() +
#      theme(axis.text.x = element_text(angle = 20, hjust = 1))
#                                        ↑
#                            agrega esto si los textos
#                            del eje X se solapan
#
#  CÓMO LEER el gráfico resultante:
#    Línea central = mediana del grupo
#    Caja          = 50% central (RIQ = Q3 - Q1)
#    Bigotes       = hasta 1.5 × RIQ desde la caja
#    Puntos fuera  = valores atípicos
#    Caja más ALTA → ese grupo tiene valores más altos en la numérica
#    Caja más ANCHA → ese grupo tiene mayor dispersión (variabilidad)


# ============================================================
# [F] DIAGRAMA DE DISPERSIÓN (scatter plot)
# ============================================================
#
#  Úsalo cuando tienes DOS variables NUMÉRICAS y quieres ver
#  si tienen relación lineal.
#
#  PLANTILLA R base:
#    plot(subgrupo$VAR_X, subgrupo$VAR_Y,
#         main = "Relación entre VAR_X y VAR_Y",
#         xlab = "Nombre de VAR_X",
#         ylab = "Nombre de VAR_Y",
#         pch  = 19,      # forma del punto (19 = círculo sólido)
#         col  = "navy",
#         cex  = 0.7)     # tamaño del punto
#    # Línea de tendencia (opcional):
#    abline(lm(VAR_Y ~ VAR_X, data = subgrupo), col = "red", lwd = 2)
#
#  PLANTILLA ggplot2:
#    ggplot(data = subgrupo, aes(x = VAR_X, y = VAR_Y)) +
#      geom_point(alpha = 0.5, color = "navy") +
#      geom_smooth(method = "lm", se = FALSE, color = "red") +
#      labs(title = "...", x = "...", y = "...") +
#      theme_minimal()
#
#  ¿Dónde va cada variable?
#    x = variable "causa" o independiente → ej: Edad_Años, Dias_Estancia
#    y = variable "efecto" o dependiente  → ej: Costo_Total_COP, CEA_ng_mL
#    alpha = transparencia (0=invisible, 1=sólido); usa 0.4-0.5 con muchos datos
#
#  EJEMPLOS del parcial:
#    plot(subgrupo$Dias_Estancia, subgrupo$Costo_Total_COP, pch=19, col="navy")
#    abline(lm(Costo_Total_COP ~ Dias_Estancia, data=subgrupo), col="red", lwd=2)
#
#    ggplot(subgrupo, aes(x = CEA_ng_mL, y = CA125_U_mL)) +
#      geom_point(alpha = 0.4, color = "darkred") +
#      geom_smooth(method = "lm", se = FALSE, color = "black") +
#      labs(title = "Relación entre CEA y CA125",
#           x = "CEA (ng/mL)", y = "CA125 (U/mL)") +
#      theme_minimal()


# ============================================================
# [G] CORRELACIÓN — cor() y cómo interpretarla
# ============================================================
#
#  SINTAXIS:
#    cor(subgrupo$VAR_X, subgrupo$VAR_Y, use = "complete.obs")
#         │                │                       │
#         │                │              SIEMPRE usar esto
#         │                │              cuando puede haber NAs
#      numérica 1       numérica 2      (marcadores tumorales, costos)
#
#  RESULTADO: un número entre -1 y 1.
#
#  ESCALA DE INTERPRETACIÓN:
#    r ≥  0.70  → relación positiva FUERTE
#    r  0.40–0.69 → relación positiva MODERADA
#    r  0.10–0.39 → relación positiva DÉBIL
#    r ≈  0.00  → SIN relación lineal
#    r -0.10–-0.39 → relación negativa DÉBIL
#    r -0.40–-0.69 → relación negativa MODERADA
#    r ≤ -0.70  → relación negativa FUERTE
#
#  POSITIVA (+): cuando una variable sube, la otra también sube.
#    CASO: Dias_Estancia vs Costo_Total_COP → más días = más costo.
#    En el scatter: los puntos forman una nube que sube de izq. a der.
#
#  NEGATIVA (−): cuando una variable sube, la otra baja.
#    CASO: Satisfaccion_1_10 vs Dias_Estancia → más días internado
#    podría asociarse con menor satisfacción.
#    En el scatter: los puntos forman una nube que baja de izq. a der.
#
#  SIN correlación (≈ 0): los puntos forman una nube redonda o sin patrón.
#
#  EJEMPLOS del parcial:
#    cor(subgrupo$Dias_Estancia,   subgrupo$Costo_Total_COP, use="complete.obs")
#    cor(subgrupo$CEA_ng_mL,       subgrupo$CA125_U_mL,      use="complete.obs")
#    cor(subgrupo$Edad_Años,       subgrupo$Dias_Estancia,   use="complete.obs")
#    cor(subgrupo$Satisfaccion_1_10, subgrupo$Costo_Por_Dia_COP, use="complete.obs")


# ============================================================
# [H] CORRELACIÓN ENTRE PROMEDIOS DE GRUPOS (tapply + comparación)
# ============================================================
#
#  El enunciado puede pedir "¿hay relación entre la adherencia y
#  el costo promedio?" No es una correlación de Pearson — es comparar
#  el PROMEDIO de una numérica entre categorías de otra variable.
#
#  PASO 1 — calcular el promedio por grupo con tapply():
#    promedios <- tapply(subgrupo$NUMERICA, subgrupo$CATEGORICA,
#                        mean, na.rm = TRUE)
#    promedios
#
#  PASO 2 — leer los valores:
#    Si el promedio sube o baja de forma consistente entre categorías
#    → hay una "tendencia" (no es correlación de Pearson, pero sí
#      una relación descriptiva).
#
#  EJEMPLO del parcial:
#    tapply(subgrupo$Costo_Total_COP, subgrupo$Adherencia_Tratamiento,
#           mean, na.rm = TRUE)
#    # Si "No" da $8.000.000 y "Si" da $5.000.000 → los que NO adhieren
#    # tienen mayor costo promedio → relación descriptiva negativa
#    # (más adherencia → menor costo).
#
#    tapply(subgrupo$CEA_ng_mL, subgrupo$Resultado_Egreso,
#           mean, na.rm = TRUE)
#    # Si "Fallecido" da CEA más alto que "Alta" → el marcador tumoral
#    # se relaciona con peor desenlace.
#
#  PASO 3 — reforzar con boxplot comparativo (sección [E]):
#    boxplot(Costo_Total_COP ~ Adherencia_Tratamiento, data = subgrupo,
#            main = "Costo según adherencia al tratamiento",
#            col  = c("tomato", "steelblue"))
#    # La caja más alta confirma visualmente la diferencia de promedios.


# ============================================================
# [I] MATRIZ DE CORRELACIÓN
# ============================================================
#
#  SINTAXIS:
#    # 1. Seleccionar solo columnas numéricas
#    numericas   <- sapply(subgrupo, is.numeric)
#    base_num    <- subgrupo[, numericas]
#
#    # 2. Eliminar variables con muchos NA (opcional pero recomendado)
#    base_num_limpia <- base_num[,
#                        colSums(is.na(base_num)) < nrow(base_num) * 0.5]
#
#    # 3. Calcular la matriz
#    matriz_cor <- cor(base_num_limpia, use = "complete.obs")
#    round(matriz_cor, 2)   # mostrar con 2 decimales
#
#  Para un subconjunto específico de variables (más legible):
#    vars <- c("Dias_Estancia", "Costo_Total_COP",
#              "CEA_ng_mL", "CA125_U_mL", "Satisfaccion_1_10")
#    subgrupo_vars <- subgrupo[complete.cases(subgrupo[, vars]), vars]
#    round(cor(subgrupo_vars), 2)
#
#  CÓMO LEER la matriz resultante:
#    La diagonal siempre es 1.00 (una variable consigo misma).
#    La matriz es simétrica: fila i / columna j = fila j / columna i.
#    Busca los valores MÁS ALEJADOS de 0 (positivos o negativos)
#    → esas son las relaciones más fuertes.
#
#  EJEMPLO de lectura:
#                   Dias_Est  Costo_Tot  Satisfac
#    Dias_Estancia     1.00      0.87     -0.32
#    Costo_Total_COP   0.87      1.00     -0.21
#    Satisfaccion      -0.32    -0.21      1.00
#
#    → Dias_Estancia y Costo: r=0.87 → positiva FUERTE
#    → Satisfacción y Días:   r=-0.32 → negativa DÉBIL


# ============================================================
# [J] HEATMAP DE CORRELACIONES — ggplot2
# ============================================================
#
#  Es la representación visual de la matriz de correlación.
#  Colores: rojo=positiva fuerte, azul=negativa fuerte, blanco=sin relación.
#
#  PLANTILLA completa:
#
#    # Paso 1: definir las variables a incluir
#    vars_cor <- c("VAR1", "VAR2", "VAR3", "VAR4", "VAR5")
#    #              ↑ pon entre 4 y 8 variables numéricas del subgrupo
#
#    # Paso 2: subconjunto sin NA
#    sub_cor <- subgrupo[complete.cases(subgrupo[, vars_cor]), vars_cor]
#
#    # Paso 3: calcular la matriz
#    mat <- cor(sub_cor)
#
#    # Paso 4: convertir a formato largo (necesario para ggplot2)
#    cor_largo        <- as.data.frame(as.table(mat))
#    names(cor_largo) <- c("Variable1", "Variable2", "Correlacion")
#
#    # Paso 5: graficar
#    ggplot(cor_largo, aes(x = Variable1, y = Variable2,
#                          fill = Correlacion)) +
#      geom_tile(color = "white") +
#      geom_text(aes(label = round(Correlacion, 2)), size = 3) +
#      scale_fill_gradient2(low = "steelblue", mid = "white",
#                           high = "firebrick", midpoint = 0,
#                           limits = c(-1, 1)) +
#      labs(title = "Heatmap de correlaciones",
#           x = "", y = "", fill = "Correlación") +
#      theme_minimal() +
#      theme(axis.text.x = element_text(angle = 45, hjust = 1))
#
#  ¿Qué NO cambiar nunca?
#    as.data.frame(as.table(mat))     ← siempre igual
#    names(cor_largo) <- c(...)       ← siempre igual
#    aes(x=Variable1, y=Variable2, fill=Correlacion) ← siempre igual
#    scale_fill_gradient2(...)        ← siempre igual
#
#  ¿Qué SÍ cambiar?
#    vars_cor  ← pon las variables del parcial que te interesen
#    title     ← el título descriptivo
#    size=3    ← sube a 4 si hay pocas variables, baja a 2 si hay muchas
#
#  EJEMPLO del parcial:
#    vars_cor <- c("Dias_Estancia", "Costo_Total_COP",
#                  "CEA_ng_mL", "CA125_U_mL",
#                  "Satisfaccion_1_10", "AFP_ng_mL")


############################################################
# FIN DEL SCRIPT PLANTILLA
############################################################
