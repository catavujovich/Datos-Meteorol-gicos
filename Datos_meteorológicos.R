leer_estacion <- function(id_estacion, ruta_archivo) {
  
  # Enlace 
  link_archivo <- paste0(
    "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/",
    id_estacion, ".csv"
  )
  
  # Si el archivo ya está descargado
  if (file.exists(ruta_archivo)) {
    cli::cli_inform("El archivo ya está descargado, se procede a leerlo...")
    datos_estacion <- read.csv(ruta_archivo)
  } 
  
  # Si el archivo no está descargado
  else {
    cli::cli_inform("El archivo no está descargado, se procede a descargarlo...")
    download.file(link_archivo, destfile = ruta_archivo)
    datos_estacion <- read.csv(ruta_archivo)
  }
  
  # Devolver el dataset
  return(datos_estacion)
}


library(dplyr)
library(tidyr)

tabla_resumen_temperatura <- function(...) {
  
  # Combinar una o más estaciones
  datos <- bind_rows(...)
  
  # Crear tabla de resumen por id (columna que identifica la estación)
    resumen <- datos %>%
    group_by(id) %>%
    summarise(
      variable = "temperatura_abrigo_150cm",
      media = mean(temperatura_abrigo_150cm, na.rm = TRUE),
      mediana = median(temperatura_abrigo_150cm, na.rm = TRUE),
      minimo = min(temperatura_abrigo_150cm, na.rm = TRUE),
      maximo = max(temperatura_abrigo_150cm, na.rm = TRUE),
    )
  
  return(resumen)
}

library(ggplot2)
library(lubridate)

grafico_temperatura_mensual <- function(datos, colores = "darkgreen", titulo = "Temperatura") {
  
  #  Convierte la columna 'fecha' a tipo Date (por si viene como texto)
  datos <- datos %>%
    mutate(fecha = as.Date(fecha))
  
  #  Agrupa los datos por mes y por estación ('id')
  # Se usa floor_date() para redondear la fecha al primer día de cada mes
  temp_mensual <- datos %>%
    mutate(mes = floor_date(fecha, "month")) %>%
    group_by(id, mes) %>%
    
    # Calcula el promedio mensual de 'temperatura_abrigo_150cm'
    summarise(
      promedio = mean(temperatura_abrigo_150cm, na.rm = TRUE),
      .groups = "drop"
    )
  
  #  Genera un gráfico de líneas y puntos
  #     Cada estación ('id') tiene un color distinto
  grafico <- ggplot(temp_mensual, aes(x = mes, y = promedio, color = id, group = id)) +
    geom_line(size = 1) +     # Línea que une los promedios mensuales
    geom_point(size = 2) +    # Puntos en cada mes
    scale_color_manual(values = colores) +  # Colores personalizados
    
    #⃣ Define el título y los nombres de los ejes
    labs(
      title = titulo,
      x = "Mes",
      y = "Temperatura promedio (°C)",
      color = "Estación"
    ) +
    theme_minimal()  # Estilo visual limpio
  
  # ⃣ Devuelve el gráfico
  return(grafico)
}
