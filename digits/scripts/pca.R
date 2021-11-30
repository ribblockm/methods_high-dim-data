set.seed(55)
pca_x <- irlba::prcomp_irlba(x_treino, n = 64)

# %var explained
summary(pca_x) # or pca_x$sdev^2 / sum(pca_x$sdev^2)

# We take the first 26 PC's as our features
pca_x_tr = pca_x$x[ids, 1:26]
pca_x_validacao = pca_x$x[-ids, 1:26]