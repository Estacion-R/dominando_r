### Cargo librerías
library(tidyverse)
library(messy)

set.seed(123)  # Para reproducibilidad

# Crear una base de personas sin duplicados
base_original <- tibble(
  "Nombre Persona" = sample(c("Ana", "Luis", "Carlos", "María", "Juan", "Sofía", "Pedro"), 50, replace = TRUE),
  "Edad Persona" = sample(25:60, 50, replace = TRUE),
  "Ciudad Residencia" = sample(c("CDMX", "Monterrey", "Guadalajara", "Puebla", "Querétaro"), 50, replace = TRUE),
  "Ingreso Anual $" = sample(35000:90000, 50, replace = TRUE),
  "Nivel Educativo" = sample(
    c("Primario incompleto", "Primario completo",
      "Secundario completo", "Universitario incompleto",
      "Universitario completo", "NS/NC", "Sin dato"),
    50, replace = TRUE
  )
)

# Duplicar aleatoriamente algunas filas (simula entrada de datos repetidos)
duplicados <- base_original %>% slice_sample(n = 50, replace = TRUE)

# Unir original + duplicados y agregar algunos NAs
datos_sucios <- bind_rows(base_original, duplicados) %>%
  mutate(
    "Nombre Persona" = replace(`Nombre Persona`, sample(1:100, 5), NA),
    "Ingreso Anual $" = replace(`Ingreso Anual $`, sample(1:100, 8), NA)
  )

# Cambiar aleatoriamente algunos valores a mayúsculas o minúsculas (para mostrar inconsistencias)
datos_sucios <- change_case(datos_sucios, "Ciudad Residencia")

# Ver resultado
datos_sucios

# Guardar como .csv
write_csv(datos_sucios, "data/base_personas_ingreso_anual_2024.csv")
