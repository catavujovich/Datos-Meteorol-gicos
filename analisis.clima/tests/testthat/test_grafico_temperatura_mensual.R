test_that("grafico_temperatura_mensual genera un gráfico ggplot", {
  # Dataset de prueba con columna 'fecha' y 'id'
  datos <- data.frame(
    id = rep("NH0472", 12),
    fecha = seq(as.Date("2024-01-01"), by = "month", length.out = 12),
    temperatura_abrigo_150cm = runif(12, min = 10, max = 25)
  )

  # Ejecutamos la función
  grafico <- grafico_temperatura_mensual(datos)

  # Expectativas
  expect_s3_class(grafico, "ggplot")               # Debe devolver un objeto ggplot
  expect_true(!is.null(grafico$labels$title))      # Debe tener un título definido
})
