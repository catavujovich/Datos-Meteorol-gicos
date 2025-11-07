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
