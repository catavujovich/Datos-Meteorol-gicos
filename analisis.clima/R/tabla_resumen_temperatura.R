library(dplyr)
library(tidyr)
#' Tabla resumen de temperatura por estación
#'
#' Esta función combina los datos de una o más estaciones meteorológicas y genera
#' una tabla resumen con estadísticas básicas de la variable
#' `temperatura_abrigo_150cm` para cada estación.
#'
#' @param ... Uno o más data frames que contengan las columnas `id` y
#'   `temperatura_abrigo_150cm`.
#'
#' @returns Un data frame con las columnas:
#'   \itemize{
#'     \item \code{id}: identificador de la estación.
#'     \item \code{variable}: nombre de la variable analizada.
#'     \item \code{media}: temperatura promedio.
#'     \item \code{mediana}: temperatura mediana.
#'     \item \code{minimo}: temperatura mínima.
#'     \item \code{maximo}: temperatura máxima.
#'   }
#' @export
#'
#' @examples
#' tabla_resumen_temperatura(estacion1, estacion2)
#'
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
