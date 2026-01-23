## Workflow overview

This workflow is a best-practice workflow for microsatellite instability (MSI) detection with [msisensor-pro](https://github.com/xjtu-omics/msisensor-pro), following best practices for standardized workflows.
The workflow is built using [snakemake](https://snakemake.readthedocs.io/en/stable/) and consists of the following steps:

1. Download genome reference from Ensembl
2. Run `msisensor-pro scan` of the reference genome.
3. (optional) Create a panel of normals with `msisensor-pro baseline` as background for tumor MSI calling without matched normal samples.
4. Run `msisensor-pro pro` for MSI calling.
5. Collect MSI calling statistics in a single file across all samples.

## Workflow setup

Setting up this workflow requires three steps:
1. Create [a sample sheet as described below](#sample-sheet).
2. Ensure that input SAM/BAM/CRAM files exist with the given file name pattern.
3. Go through the `config/config.yaml` file adjusting all configurations as outlined in the extensive comments. This includes choosing, whether all the normal samples will be pooled into a baseline panel of normals, or whether each normal sample matches a tumor sample (with the same `group` specified).

### Sample sheet

The sample sheet has the following layout and is agnostic of the analysis mode specified in the `config.yaml` (panel of normals vs. matched normals):

| sample  | alias     | group     |
| ------- | --------- | --------- |
| sample1 | tumor     | patient_A |
| sample2 | normal    | patient_A |
| sample3 | tumor     | patient_B |
| sample4 | normal    | patient_B |

This follows the same naming scheme that a number of other standardized snakemake workflows for DNA sequencing data also follow, for example the [`dna-seq-varlociraptor` workflow](https://snakemake.github.io/snakemake-workflow-catalog/docs/workflows/snakemake-workflows/dna-seq-varlociraptor.html#sample-sheet).

### Input data

This workflow assumes that you have already mapped / aligned your read data to the reference genome that you specify in the `config/config.yaml` file, and performed quality score recalibration on them.
So it starts from SAM/BAM/CRAM files, and assumes that these follow this file path and naming scheme (where `{sample}` are entries from the `sample` column in your sample sheet):

```{bash}
results/recal/{sample}.bam
```

If your input files do not follow this scheme, we suggest that you add a `rule` that creates symbolic links with the correct `{sample}.bam` naming scheme in the subfolder `results/recal/`.
This could for example look like this:

```
rule link_input_data:
    input:
        original="../../path/to/other/workflow/results/mapped_and_recalibrated/{sample}",
    output:
        compliant="results/recal/{sample}.bam",
    log:
        "logs/link_input_data/{sample}.log",
    shell:
        "( ln --symbolic {input.original} {output.compliant} "
        ") >{log} 2>&1 "
```
