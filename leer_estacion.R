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



