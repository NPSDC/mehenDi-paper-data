# With conda install:
# - r-base=4.2
# - r-devtools

if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager", repos="https://cloud.r-project.org")

BiocManager::install(version = "3.16", ask = FALSE)
BiocManager::install(c(
    "GenomicFeatures", 
    "polyester",
    "alpine",
    "Biostrings",
    "fishpond",
    "SingleCellExperiment",
    "TreeSummarizedExperiment",
    "tximeta"
    ))
devtools::install_github("NPSDC/beaveR")

