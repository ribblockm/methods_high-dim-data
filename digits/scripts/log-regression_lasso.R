# Fit Lasso and Logistic Reg.
set.seed(4321)
log_lasso <- cv.glmnet(pca_x_tr, y_treino[ids], alpha = 1, family = "multinomial")

# Logistic Regression
# Predictions inside sample and in validation set
p_hat_log_dentro <- predict(log_lasso, newx = pca_x_tr, s = 0, type = "response")
y_hat_log_dentro <- apply(p_hat_log_dentro, 1, which.max) - 1
tabela_log_dentro <- table(y_hat_log_dentro, y_treino[ids])
acuracia_log_dentro <- sum(diag(tabela_log_dentro)) / sum(tabela_log_dentro)

p_hat_log <- predict(log_lasso, newx = pca_x_validacao, s = 0, type = "response")
y_hat_log <- apply(p_hat_log, 1, which.max) - 1
tabela_log <- table(y_hat_log, y_treino[-ids])
acuracia_log <- sum(diag(tabela_log)) / sum(tabela_log)

resultados[which(resultados$Modelo=="Regressão Logística"), 2:3] <- c(acuracia_log_dentro, acuracia_log)

# Lasso
# Predictions inside sample and in validation set
p_hat_lasso_dentro <- predict(log_lasso, newx = pca_x_tr, type = "response")
y_hat_lasso_dentro <- apply(p_hat_lasso_dentro, 1, which.max) - 1
tabela_lasso_dentro <- table(y_hat_lasso_dentro, y_treino[ids])
acuracia_lasso_dentro <- sum(diag(tabela_lasso_dentro)) / sum(tabela_lasso_dentro)

p_hat_lasso <- predict(log_lasso, newx = pca_x_validacao, type = "response")
y_hat_lasso <- apply(p_hat_lasso, 1, which.max) - 1
tabela_lasso <- table(y_hat_lasso, y_treino[-ids])
acuracia_lasso <- sum(diag(tabela_lasso)) / sum(tabela_lasso)

resultados[which(resultados$Modelo=="Reg. Log. com penalização"), 2:3] <- c(acuracia_lasso_dentro, acuracia_lasso)