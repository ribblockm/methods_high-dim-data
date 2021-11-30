set.seed(9)
floresta <- ranger(x = pca_x_tr, y = y_treino[ids], classification = TRUE)

# Predictions inside sample and out-of-sample (validation set)
floresta_pred_dentro <- predict(floresta, pca_x_tr)
tabela_rf_dentro <- table(floresta_pred_dentro$predictions, y_treino[ids])
acuracia_rf_dentro <- sum(diag(tabela_rf_dentro)) / sum(tabela_rf_dentro)

floresta_pred <- predict(floresta, pca_x_validacao)
tabela_rf <- table(floresta_pred$predictions, y_treino[-ids])
acuracia_rf <- sum(diag(tabela_rf)) / sum(tabela_rf)

resultados[which(resultados$Modelo=="Florestas Aleatórias"), 2:3] <- c(acuracia_rf_dentro, acuracia_rf)