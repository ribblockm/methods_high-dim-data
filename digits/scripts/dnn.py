import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers

train_features = np.asarray(r.train_features)
validacao_features = np.asarray(r.validacao_features)
train_labels = np.asarray(r.train_labels)
validacao_labels = np.asarray(r.validacao_labels)

# Define model
modelo = tf.keras.Sequential([
    tf.keras.layers.Dense(128, activation='relu'),
    tf.keras.layers.Dense(10)
])

# Compile model
modelo.compile(optimizer = 'adam', loss = tf.keras.losses.SparseCategoricalCrossentropy(from_logits=True), metrics = ['accuracy'])

# Fit model
history = modelo.fit(
    train_features,
    train_labels,
    validation_split=0.2,
    epochs=10)

# Results
dentro_loss, dentro_acc = modelo.evaluate(train_features, train_labels, verbose=2)
print('\nAcurácia dentro da amostra:', dentro_acc)

validacao_loss, validacao_acc = modelo.evaluate(validacao_features, validacao_labels, verbose=2)
print('\nAcurácia no conjunto de validação:', validacao_acc)
