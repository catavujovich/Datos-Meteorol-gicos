test_that("leer_estacion descarga y lee correctamente los datos", {
  # Creamos un archivo temporal donde se guardarán los datos descargados
  archivo_temp <- tempfile(fileext = ".csv")

  # Llamamos a la función
  datos <- leer_estacion("NH0472", archivo_temp)

  # Expectativas:
  expect_s3_class(datos, "data.frame")   # Debe devolver un data.frame
  expect_true(ncol(datos) > 1)           # Debe tener más de una columna
})

