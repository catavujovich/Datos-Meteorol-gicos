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