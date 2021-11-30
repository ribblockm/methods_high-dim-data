packages = c("here", "glmnet", "ranger", "reticulate", "janitor", "tidyverse", "data.table")

for (p in packages) {
    tryCatch(test <- require(p, character.only = T),
             warning = function(w) return())
    if(!test)
    {
        print(paste("Package ", p, "not found. Installing..."))
        install.packages(p)
        require(p)
    }
}