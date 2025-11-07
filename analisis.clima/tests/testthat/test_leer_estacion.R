test_that("leer_estacion descarga y lee correctamente los datos", {
  # Creamos un archivo temporal donde se guardarán los datos descargados
  archivo_temp <- tempfile(fileext = ".csv")

  # Llamamos a la función
  NH0472 <- leer_estacion("NH0472", "datos/NH0472.csv")

  # Expectativas:
  expect_s3_class(datos, "data.frame")   # Debe devolver un data.frame
  expect_true(ncol(datos) > 1)           # Debe tener más de una columna
})

