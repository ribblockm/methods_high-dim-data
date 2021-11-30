# Fit Random Forest
set.seed(321)
floresta = ranger(y ~ ., data = treino_sf[ids, ])

# Making predictions
pred_florestas_validacao =  predict(floresta, treino_sf[-ids, ])
pred_florestas_dentro = predict(floresta, treino_sf[ids, ])

resultados[resultados$modelo=="Florestas aleatórias", 3] = (pred_florestas_validacao$predictions - treino_sf[-ids, ]$y) %>% abs() %>% mean()
resultados[resultados$modelo=="Florestas aleatórias", 2] = (pred_florestas_dentro$predictions - treino_sf[ids, ]$y) %>% abs() %>% mean()