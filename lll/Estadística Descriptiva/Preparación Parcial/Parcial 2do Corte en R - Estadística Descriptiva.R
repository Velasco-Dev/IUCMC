##############################
# Autor: Rubén Darío Velasco Burbano.
# Presentado a: PhD. Cristhian Leonardo Urbano.
# Ingeniería Informática.
# Grupo Nocturno.
# Código: 90125035. 
# SOLUCIÓN PARCIAL CORTE II
##############################

# Eliminamos objetos guardados en la memoria del sistema
rm(list = ls())

# Limpiamos la consola
cat("\014")

# Mostramos el directorio de trabajo actual
getwd()

# Definimos el directorio de trabajo donde está la base de datos
setwd("C:/Users/Tuf/Documents/IUCMC/lll/Estadística Descriptiva/Preparación Parcial")

# Instalamos las librerías necesarias para analizar y graficar la data.
install.packages("readxl")
install.packages("ggplot2")

# Verificamos que la librería de leer excel y graficar esten instalada para crear el df y las gráficas.
library(readxl)
library(ggplot2)

# Paleta de colores para las gráficas
scale_fill_brewer(palette = "Set2")

# Guardamos el df de la base de datos en memoria para poder trabajar sobre ella
base <- read_excel("base_hospitalaria_exam.xlsx")

# Creamos el df pediatria filtrando la variable Area_Hospitalizacion (Pacientes de pedratría del hospital)
# Y asignamos a las variables sólo nombres en en minúscula con clean_names(), esto para facilidad del análisi
pediatria <- base %>% filter(Area_Hospitalizacion == "Pediatría") %>% clean_names()

# Verificamos los tipos de variables consignadas en el df
str(pediatria)

# Conteo de valores faltantes por variable
colSums(is.na(pediatria))

# Porcentaje de faltantes
round(100 * colMeans(is.na(pediatria)), 2)

# Convertimos a factor las variables cualitativas con la intención de tener la información mejor organizada
pediatria$sexo <- factor(pediatria$sexo)
pediatria$resultado_egreso <- factor(pediatria$resultado_egreso)
pediatria$diagnostico_principal <- factor(pediatria$diagnostico_principal)
pediatria$eps <- factor(pediatria$eps)
pediatria$turno_ingreso <- factor(pediatria$turno_ingreso)
pediatria$temperatura_c <- factor(pediatria$temperatura_c)
pediatria$sat_o2_pct <- factor(pediatria$sat_o2_pct)
pediatria$peso_kg <- factor(pediatria$peso_kg)
pediatria$talla_m <- factor(pediatria$talla_m)
pediatria$vacuna_covid <- factor(pediatria$vacuna_covid)
pediatria$vacuna_influenza <- factor(pediatria$vacuna_influenza)


# 1) Sexo (Distribución por sexo)

      sexo_plot <- ggplot(data = pediatria, aes(x = sexo, fill = sexo)) +
        geom_bar() +
        labs(title = "Distribución de pacientes por sexo",
             x = "Sexo",
             y = "Cantidad de pacientes") +
        scale_fill_brewer(palette = "Set2") +
        theme_minimal() +
        theme(legend.position = "none",
              plot.title = element_text(hjust = 0.5, face = "bold"),
              axis.title = element_text(face = "bold"))
      
      # Visualización del gráfico.
      print(sexo_plot)

# 2) Edad_Años (Tendencia central, dispersión, histograma)
      
      # Inicializamos el df de edad
      edad <- pediatria$edad_anos
      
      # a) Tendencia Central
      # - Media:
      mean(edad, na.rm = TRUE)
      
      # - Mediana:
      median(edad, na.rm = TRUE)
      
      # - Moda:
      # R por defecto no trae la función de moda pero se puede crear de la siguiente manera
      moda <- function(x) {
        ux <- unique(x)
        ux[which.max(tabulate(match(x, ux)))]
      }
      
      moda(edad)
      
      # b) Dispersión
      
      # Mostramos la Varianza para edad
      var(edad, na.rm = TRUE)
      
      # Mostramos la Desviación estándar para edad
      sd(edad, na.rm = TRUE)
      
      # Mostramos el Coeficiente de variación para edad en porcentaje(%)
      sd(edad, na.rm = TRUE) / mean(edad, na.rm = TRUE) * 100
      
      # c) Histograma
      
      edad_hist_plot <- ggplot(data = pediatria, aes(x = edad)) +
        geom_histogram(fill = "#66C2A5", color = "white", bins = 15) +
        labs(title = "Distribución en edad para los pacientes",
             x = "Edad (Años)",
             y = "Frecuencia") +
        theme_minimal() +
        theme(plot.title = element_text(hjust = 0.5, face = "bold"),
              axis.title = element_text(face = "bold"))
      
      # Visualización del gráfico.
      print(edad_hist_plot)
      
# 3) Diagnóstico Principal (Diagnósticos más frecuentes)
      
      # Gráfico de barras
      diag_prin_plot <- ggplot(data = pediatria, aes(x = diagnostico_principal, fill = diagnostico_principal)) +
        geom_bar() +
        labs(title = "Distribución de pacientes por diagnóstico principal",
             x = "Diagnostico Principal",
             y = "Cantidad de pacientes") +
        scale_fill_brewer(palette = "Set2") +
        theme_minimal() +
        theme(legend.position = "none",
              plot.title = element_text(hjust = 0.5, face = "bold"),
              axis.title = element_text(face = "bold"))
      
      # Visualización del gráfico.
      print(diag_prin_plot)
      
# 4) Dias_Estancia (media, mediana, rango, boxplot)
      
      # Inicializamos el df de dias_estancia
      estancia <- pediatria$dias_estancia
      
      # a). Media:
      mean(estancia, na.rm = TRUE)
      
      # b) Mediana:
      median(estancia, na.rm = TRUE)
      
      # c) Rango:
      estancia_range <- max(estancia, na.rm = TRUE) - min(estancia, na.rm = TRUE)
      
      # d) Boxplot:
      estancia_plot <- ggplot(data = pediatria, aes(y = estancia, x = sexo, fill = sexo)) +
        geom_boxplot() +
        labs(title = "Distribución de los días de estancia según sexo",
             x = "Sexo",
             y = "Días de estancia") +
        scale_fill_brewer(palette = "Set2") +
        theme_minimal() +
        theme(legend.position = "none",
              plot.title = element_text(hjust = 0.5, face = "bold"),
              axis.title = element_text(face = "bold"))
      
      # Visualización del gráfico.
      print(estancia_plot)
      
# - Temperatura_C - SatO2_Pct (Signos vitales al ingreso)
      
      
# - Peso_kg - Talla_m - IMC (Antropometría pediátrica)
      
# - Vacuna_Covid - Vacuna_Influenza (Cobertura vacunal)
      
# 8) Resultado_Egreso (Frecuencia de cada tipo de egreso)
      
      #Gráfica Frecuencia de cada tipo de egreso
      egreso_plot <- ggplot(data = pediatria, aes(x = resultado_egreso, fill = resultado_egreso)) +
        geom_bar() +
        labs(title = "Distribución de pacientes por resultado egreso",
             x = "Resultado de Egreso",
             y = "Cantidad de pacientes") +
        scale_fill_brewer(palette = "Set2") +
        theme_minimal() +
        theme(legend.position = "none",
              plot.title = element_text(hjust = 0.5, face = "bold"),
              axis.title = element_text(face = "bold"))
      
      # Visualización del gráfico.
      print(egreso_plot)

