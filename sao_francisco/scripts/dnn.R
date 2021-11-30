# Setting up your python and environment
use_python("~/miniconda3/envs/labs/bin/python3.9", required = TRUE)
use_condaenv("~/miniconda3/envs/labs", required = TRUE)

train_features = copy(treino_sf[ids, ])
validacao_features = copy(treino_sf[-ids, ])

train_labels = train_features$y
validacao_labels = validacao_features$y

py_run_file("~/sao_francisco/scripts/dnn.py")