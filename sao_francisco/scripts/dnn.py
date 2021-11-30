import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers

# Normalization Layer
normalizer = tf.keras.layers.Normalization(axis=-1)
normalizer.adapt(np.array(r.train_features))

# Linear Model Multiple Inputs
linear_model = tf.keras.Sequential([
    normalizer,
    layers.Dense(units=1)
])

linear_model.predict(r.train_features[:10])

linear_model.compile(
    optimizer=tf.optimizers.Adam(learning_rate=0.1),
    loss='mean_absolute_error')
    
train_features = np.asarray(r.train_features)
validacao_features = np.asarray(r.validacao_features)
train_labels = np.asarray(r.train_labels)
validacao_labels = np.asarray(r.validacao_labels)

history = linear_model.fit(
    train_features,
    train_labels,
    epochs=100,
    verbose=0,
    validation_split=0.2)
    
resultado_validacao = {}
resultado_validacao['linear_model_dentro'] = linear_model.evaluate(
    train_features, train_labels, verbose=0
)
resultado_validacao['linear_model_validacao'] = linear_model.evaluate(
    validacao_features, validacao_labels, verbose=0
)

# DNN Model

dnn_model = tf.keras.Sequential([
    normalizer,
    layers.Dense(64, activation='relu'),
    layers.Dense(64, activation='relu'),
    layers.Dense(1)
])

dnn_model.compile(loss='mean_absolute_error', optimizer=tf.keras.optimizers.Adam(0.001))

history_dnn = dnn_model.fit(
    train_features,
    train_labels,
    validation_split=0.2,
    verbose=0, epochs=100
)

resultado_validacao['dnn_model_dentro'] = dnn_model.evaluate(train_features, train_labels, verbose=0)
resultado_validacao['dnn_model_validacao'] = dnn_model.evaluate(validacao_features, validacao_labels, verbose=0)
