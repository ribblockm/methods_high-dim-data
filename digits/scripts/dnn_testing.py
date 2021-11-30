train_features = np.asarray(r.train_features)
train_labels = np.asarray(r.train_labels)

# Fit model
modelo = tf.keras.Sequential([
    tf.keras.layers.Dense(128, activation='relu'),
    tf.keras.layers.Dense(10)
])

# Compile model
modelo.compile(optimizer = 'adam', loss = tf.keras.losses.SparseCategoricalCrossentropy(from_logits=True), metrics = ['accuracy'])

# Training model with all training data
history = modelo.fit(
    train_features,
    train_labels,
    validation_split=0.2,
    epochs=10)

# Convert logits in probabilities
modelo_prob = tf.keras.Sequential([modelo, tf.keras.layers.Softmax()])

# Making predictions
predicoes_teste = modelo_prob.predict(r.pca_teste)
