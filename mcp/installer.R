### Some important installations to get this to work should be placed in here

LIB_CONST <- "~/R/library"

# make sure the directory exists
dir.create(LIB_CONST, recursive = TRUE, showWarnings = FALSE)

# add it to search paths
.libPaths(LIB_CONST)

install.packages("roxygen2", lib=LIB_CONST)
install.packages("cli", lib=LIB_CONST)   # often needed too
install.packages("pkgbuild", lib=LIB_CONST)
install.packages("devtools", lib=LIB_CONST)
install.packages("ambiorix", lib=LIB_CONST)

install.packages("shiny", lib=LIB_CONST)

# install remotes directly into ~/R/library
install.packages("remotes", lib=LIB_CONST)
install.packages("ellmer", lib=LIB_CONST)
install.packages("dotenv", lib=LIB_CONST)

# load remotes from there
library(remotes, lib.loc=LIB_CONST)

# now install mcpr (the engine behind this whole project)
remotes::install_github("devOpifex/mcpr", lib=LIB_CONST)
remotes::install_github("jrowen/rhandsontable", lib=LIB_CONST)

# finally load mcpr
library(mcpr, lib.loc=LIB_CONST)