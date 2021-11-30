train_features <- copy(pca_x$x)
train_labels <- y_treino

x_teste <- x_teste / 255
pca_teste <- predict(pca_x, x_teste)

py_run_file("~/digits/scripts/dnn_testing.py")

y_hat <- apply(py$predicoes_teste, 1, which.max) - 1