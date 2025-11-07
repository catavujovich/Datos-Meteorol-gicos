test_that("grafico_temperatura_mensual genera un gráfico ggplot", {
  # Dataset de prueba
  datos <- data.frame(
    mes = 1:12,
    promedio = runif(12, min = 10, max = 25)
  )

  # Ejecutamos la función
  grafico <- grafico_temperatura_mensual(datos)

  # Expectativas
  expect_s3_class(grafico, "ggplot")            # Debe devolver un objeto ggplot
  expect_true(!is.null(grafico$labels$title))   # Debe tener título definido
})
