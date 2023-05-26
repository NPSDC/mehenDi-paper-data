args <- commandArgs(trailingOnly = TRUE)
input <- args[1]
output <- args[2]

# http://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_26/gencode.v26.transcripts.fa.gz
# fasta0 <- file.path(ann_dir, "gencode.v26.transcripts.fa.gz")
# fasta <- file.path(save_dir, "gencode.v26.transcripts.short.names.fa")

if (!file.exists(input)) {
    stop(paste(input, "does not exist"))
}

suppressPackageStartupMessages(library(Biostrings))
txseq <- readDNAStringSet(input)
names(txseq) <- sub("\\|.*","",names(txseq))
writeXStringSet(txseq, file=output)