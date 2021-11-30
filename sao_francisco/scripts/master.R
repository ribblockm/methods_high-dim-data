# Load packages and data
source("~/sao_francisco/scripts/load_packages.R")
source("~/sao_francisco/scripts/load_data.R")

resultados <- data.frame(modelo = c("Regressão", "Regressão com Penalização", "Florestas aleatórias", "Redes neurais: Reg", "DNN"),
                        risco_dentro_amostra = NA,
                        risco_validacao = NA)

# Regression and Lasso
source("~/sao_francisco/scripts/regression_lasso.R")

# Random Forests
source("~/sao_francisco/scripts/random_forests.R")

# Deep Neural Networks
source("~/sao_francisco/scripts/dnn.R")

# Results
resultados
results_dnn <- py$pd.DataFrame(resultado_validacao, index=['Erro absoluto médio']).T

# Select the best model and testing
source("~/sao_francisco/scripts/testing.R")