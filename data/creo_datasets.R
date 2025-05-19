library(tidyverse)

set.seed(123)  # Para reproducibilidad

# Crear una base de personas sin duplicados
base_original <- tibble(
  "Nombre Persona" = sample(c("Ana", "Luis", "Carlos", "María", "Juan", "Sofía", "Pedro"), 50, replace = TRUE),
  "Edad Persona" = sample(25:60, 50, replace = TRUE),
  "Ciudad Residencia" = sample(c("CDMX", "Monterrey", "Guadalajara", "Puebla", "Querétaro"), 50, replace = TRUE),
  "Ingreso Anual $" = sample(35000:90000, 50, replace = TRUE)
)

# Duplicar aleatoriamente algunas filas (simula entrada de datos repetidos)
duplicados <- base_original %>% slice_sample(n = 50, replace = TRUE)

# Unir original + duplicados y agregar algunos NAs
datos_sucios <- bind_rows(base_original, duplicados) %>%
  mutate(
    "Nombre Persona" = replace(`Nombre Persona`, sample(1:100, 5), NA),
    "Ingreso Anual $" = replace(`Ingreso Anual $`, sample(1:100, 8), NA)
  )

datos_sucios
