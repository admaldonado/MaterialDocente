# Instalar shiny ----
# install.packages(shiny)

# Cargar shiny
library(shiny)

# Ejecutar ejemplos de prueba del paquete shiny----
  runExample("01_hello")
  runExample("05_sliders")


# Ejecutar aplicaciones ----
  # Establecer directorio de trabajo 
  # install.packages("rstudioapi")
  setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

  # Ejecutar aplicación mostrando el código
  runApp("Ejemplos/ejemplo01/app.R", display.mode = "showcase")
  # Ejecutar aplicación sin mostrar el código
  runApp("Ejemplos/ejemplo01/app.R")


