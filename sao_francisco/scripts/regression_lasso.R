X_treino = model.matrix(y ~ ., treino_sf)[, -1]
y = treino_sf$y

# Fit Lasso
set.seed(1)
mq_lasso = cv.glmnet(X_treino[ids, ], y[ids], alpha = 1)

# Making predictions for regression without lasso (s = 0)
pred_mq_validacao = predict(mq_lasso, s = 0, newx = X_treino[-ids, ]) 
pred_mq_dentro = predict(mq_lasso, s=0, newx = X_treino[ids, ])

resultados[resultados$modelo=="Regressão", 3] = (pred_mq_validacao - y[-ids]) %>% abs() %>% mean()
resultados[resultados$modelo=="Regressão", 2] = (pred_mq_dentro - y[ids]) %>% abs() %>% mean()

# Making predictions for regression using lasso (lambda = lambda.1se by default)
pred_lasso_validacao = predict(mq_lasso, newx = X_treino[-ids, ]) #omitimos a escolha de s (lambda); a padrão é lambda que min risco com 1se
pred_lasso_dentro = predict(mq_lasso, newx = X_treino[ids, ])

resultados[resultados$modelo=="Regressão com Penalização", 2] = (pred_lasso_dentro - y[ids]) %>% abs() %>% mean()
resultados[resultados$modelo=="Regressão com Penalização", 3] = (pred_lasso_validacao - y[-ids]) %>% abs() %>% mean()