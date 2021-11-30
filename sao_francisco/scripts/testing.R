treino_sf <- treino_sf %>% 
    clean_names()

teste_sf <- teste_sf %>% 
    clean_names()

set.seed(321)
florestas <- ranger(y ~ ., data = treino_sf)

florestas_pred <- predict(florestas, teste_sf)