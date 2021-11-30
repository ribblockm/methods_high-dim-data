load("~/digits/data/dados_mnist.rdata") # training data
load("~/digits/data/dados_mnist_teste.rdata") # testing data

set.seed(123)
ids <- sample(nrow(x_treino), size = .7*nrow(x_treino), replace = FALSE)

# Standardize values to the interval [0, 1] (originally they are between 0 and 255)
x_treino <- x_treino / 255