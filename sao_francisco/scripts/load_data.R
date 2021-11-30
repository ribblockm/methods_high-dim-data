load("~/sao_francisco/data/dados_rio_sf.RData")

set.seed(123)
ids <- sample(nrow(treino_sf), size = .7*nrow(treino_sf), replace = FALSE) #sample ids to select training and validation sets

treino_sf <- treino_sf %>% 
    clean_names()

teste_sf <- teste_sf %>% 
    clean_names()