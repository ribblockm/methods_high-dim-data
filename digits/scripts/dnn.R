# Setting up your python and environment
use_python("~/miniconda3/envs/labs/bin/python3.9", required = TRUE)
use_condaenv("~/miniconda3/envs/labs", required = TRUE)

train_features <- copy(pca_x_tr)
validacao_features <- copy(pca_x_validacao)

train_labels <- y_treino[ids]
validacao_labels <- y_treino[-ids]

py_run_file("~/digits/scripts/dnn.py")