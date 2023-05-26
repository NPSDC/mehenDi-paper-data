# Simulated experiment

## Setup

### Install salmon, terminus, and tree-terminus

_TODO_

### Data

_TODO: Download into `data/`
- gtf
- gencode transcript sequences (FASTA)
- txdb

Clean up annotation transcript names with:
    
    Rscript --vanilla scripts/clean_gencode_annotation.R <input annotation> <output annotation>

The output FASTA file has parsed and cleaned transcript names and are used for expression and read simulation

### Usage

To run an experiment with specified parameters:

    `snakemake --cores <cores> --configfile <config>`

### Configuration

Example configurations are provided in `configs`.

Please change paths for salmon, tree-terminus, and terminus binaries to point to your own installations.

Please change path for salmon index to local index for quantified transcriptome.

```
# small_example.yml -- a small example of the workflow
seed: 1
# Replicate names
replicates: [1,2]

# Min and max fold changes
fc_min: 1.4
fc_max: 2.8

# Read simulation parameters
frag_len: 200
lib_size: 100000
gc_bias: true
txp_fasta: data/gencode.v26.annotations.short.names.fa
txdb: data/gencode.v26.annotation.sqlite
cortex_tpms: frontal_cortex.tsv.gz
meandisp: meanDispPairs/meanDispPairs.rda
gc_params: data/fitpar_all.rda

# Paths Salmon binary and build salmon index
sal_path: "/fs/cbcb-lab/rob/students/noor/Uncertainity/treeTerminusScripts/Chimpanzee/no_thresh_boot/.snakemake/conda/b5dc9e9ebd55a53225f40312a659f7a2/bin/salmon"
sal_idx_path: "/fs/cbcb-lab/rob/students/noor/Uncertainity/brain_sim/annotation/sal_ind_nodup"

# Parameters for posterior sample generation
nreplicates: 2 # posterior samples
posterior_type: gibbs #specific type of posterior sampling gibbs or bootstrap
thinning_factor: 16

# Paths to terminus and tree terminus
term_path: "/fs/cbcb-lab/rob/students/noor/Uncertainity/terminus"
treeterm_path: "/fs/cbcb-lab/rob/students/noor/Uncertainity/TreeTerminus"
```
