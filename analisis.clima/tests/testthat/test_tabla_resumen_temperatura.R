test_that("tabla_resumen_temperatura calcula correctamente las estadísticas", {
  # Creamos un dataset de prueba
  datos <- data.frame(
    fecha = seq(as.Date("2024-01-01"), by = "month", length.out = 4),
    temperatura = c(20, 22, 25, 27)
  )

  # Ejecutamos la función
  resumen <- tabla_resumen_temperatura(datos)

  # Expectativas
  expect_s3_class(resumen, "data.frame")         # Debe devolver un data.frame
  expect_true(all(resumen$promedio >= 0))        # Los valores promedios no pueden ser negativos
})

