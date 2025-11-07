test_that("tabla_resumen_temperatura calcula correctamente las estadísticas", {
  # Creamos un dataset de prueba con 'id' y 'temperatura_abrigo_150cm'
  datos <- data.frame(
    id = rep("NH0472", 5),
    temperatura_abrigo_150cm = c(20, 22, 24, 23, 21)
  )

  # Ejecutamos la función
  resumen_temp_abrigo_150cm <- tabla_resumen_temperatura(NH0472, NH0910, NH0046, NH0098, NH0437)

  # Expectativas
  expect_s3_class(resumen, "data.frame")           # Debe devolver un data.frame
  expect_true(all(resumen$media >= 0))             # Las medias no deben ser negativas
})


