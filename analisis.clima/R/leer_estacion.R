#' Leer y descargar datos de una estación meteorológica
#'
#' Esta función descarga (si es necesario) y lee los datos de una estación meteorológica
#' a partir de su identificador. Si el archivo ya existe en la ruta indicada, se omite
#' la descarga y se leen los datos directamente desde el disco.
#'
#' @param id_estacion carácter, identificador de la estación.
#' @param ruta_archivo carácter, ruta donde se guardará o leerá el archivo CSV.
#'
#' @returns Un data frame con los datos de la estación meteorológica.
#'
#'
#' @export
#'
#'
#'
#' @examples
#' datos <- leer_estacion("NH0437", "datos/NH0437.csv")
#' head(datos)
#'


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



