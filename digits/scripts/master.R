# Load packages and data
source("~/digits/scripts/load_packages.R")
source("~/digits/scripts/load_data.R")

resultados <- data.frame(Modelo = c("Regressão Logística", "Reg. Log. com penalização", "Florestas Aleatórias", "Redes Neurais"),
                        Risco_dentro_amostra = NA,
                        Risco_validacao = NA)
# PCA
source("~/digits/scripts/pca.R")

# Regression and Lasso
source("~/digits/scripts/log-regression_lasso.R")

# Random Forests
source("~/digits/scripts/random_forests.R")

# Deep Neural Networks
source("~/digits/scripts/dnn.R")

# Results
resultados
print("Acurácia no conjunto de validação: ", py$validacao_acc)

# Select the best model and testing
source("~/digits/scripts/testing.R")