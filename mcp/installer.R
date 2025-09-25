### Some important installations to get this to work should be placed in here

LIB_CONST <- "~/R/library"

# make sure the directory exists
dir.create("~/R/library", recursive = TRUE, showWarnings = FALSE)

# add it to search paths
.libPaths("~/R/library")

install.packages("roxygen2", lib="~/R/library")
install.packages("cli", lib="~/R/library")   # often needed too
install.packages("pkgbuild", lib="~/R/library")
install.packages("devtools", lib="~/R/library")
install.packages("ambiorix", lib=LIB_CONST)


# install remotes directly into ~/R/library
install.packages("remotes", lib="~/R/library")
install.packages("ellmer", lib=LIB_CONST)
install.packages("dotenv", lib=LIB_CONST)

# load remotes from there
library(remotes, lib.loc="~/R/library")

# now install mcpr (the engine behind this whole project)
remotes::install_github("devOpifex/mcpr", lib="~/R/library")

# finally load mcpr
library(mcpr, lib.loc="~/R/library")