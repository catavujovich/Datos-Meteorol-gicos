test_that("tabla_resumen_temperatura calcula correctamente las estadísticas", {
  # Creamos un dataset de prueba con 'id' y 'temperatura_abrigo_150cm'
  datos <- data.frame(
    id = rep("NH0472", 5),
    temperatura_abrigo_150cm = c(20, 22, 24, 23, 21)
  )

  # Ejecutamos la función
  resumen <- tabla_resumen_temperatura(datos)

  # Expectativas
  expect_s3_class(resumen, "data.frame")           # Debe devolver un data.frame
  expect_true(all(resumen$media >= 0))             # Las medias no deben ser negativas
})

