# Simulated experiment

## Setup

### Install salmon, terminus, and tree-terminus

Required software:
- Salmon version 1.5.2
- Terminus 0.1.0
- TreeTerminus 0.1.0

### Data

_TODO: Download into `data/`_
- gtf
- gencode transcript sequences (FASTA)
- txdb

Clean up annotation transcript names with:
    
    Rscript --vanilla scripts/clean_gencode_annotation.R <input annotation> <output annotation>

The output FASTA file has parsed and cleaned transcript names and are used for expression and read simulation

### Usage

To run an experiment with specified parameters:

    snakemake --cores <cores> --configfile <config>

### Configuration

Example configurations (YAML files provided to snakemake) are provided in `configs/`.
- `small_example.yml` A example configuration for a small example with few replicates and small library size.
- `low_fc.yml` _TODO: description_
- `high_fc.yml` _TODO: description_

Please change paths for salmon, tree-terminus, and terminus binaries to point to your own installations.
Please change path for salmon index to local index for quantified transcriptome.

The config parameter `output_prefix` can be specified to change the path where outputs are placed, outputs will be written to `output` otherwise. Note that `low_fc.yml` and `high_fc.yml`configure experiments that produce >50GB of simulated reads.

An annotated YAML configuration:
```YAML
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
