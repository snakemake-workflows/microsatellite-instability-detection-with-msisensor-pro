# Snakemake workflow: `microsatellite-instability-detection-with-msisensor-pro`

[![Snakemake](https://img.shields.io/badge/snakemake-≥9.0.0-brightgreen.svg)](https://snakemake.github.io)
[![GitHub actions status](https://github.com/snakemake-workflows/microsatellite-instability-detection-with-msisensor-pro/workflows/Tests/badge.svg?branch=main)](https://github.com/snakemake-workflows/microsatellite-instability-detection-with-msisensor-pro/actions?query=branch%3Amain+workflow%3ATests)
[![run with conda](http://img.shields.io/badge/run%20with-conda-3EB049?labelColor=000000&logo=anaconda)](https://docs.conda.io/en/latest/)
[![workflow catalog](https://img.shields.io/badge/Snakemake%20workflow%20catalog-darkgreen)](https://snakemake.github.io/snakemake-workflow-catalog/docs/workflows/snakemake-workflows/microsatellite-instability-detection-with-msisensor-pro)

A Snakemake workflow for microsatellite instability (MSI) detection with [msisensor-pro](https://github.com/xjtu-omics/msisensor-pro), following best practices for standardized workflows.

- [Snakemake workflow: `microsatellite-instability-detection-with-msisensor-pro`](#snakemake-workflow-name)
  - [Usage](#usage)
  - [Deployment options](#deployment-options)
  - [Authors](#authors)
  - [References](#references)

## Usage

The usage of this workflow is described in the [Snakemake Workflow Catalog](https://snakemake.github.io/snakemake-workflow-catalog/docs/workflows/snakemake-workflows/microsatellite-instability-detection-with-msisensor-pro).

Detailed information about input data and workflow configuration can also be found in the [`config/README.md`](config/README.md).

If you use this workflow in a paper, don't forget to give credits to the authors of this workflow and the tools it uses by citing:
1. The URL of this repository or its DOI.
2. The papers listed under [References](#references).
Please also note that the main tool used here, `msisensor-pro`, is only `free for non-commercial use by academic, government, and non-profit/not-for-profit institutionsfree to use by`.
For details and contact information for commercial licensing, see the [`msisensor-pro` license](https://github.com/xjtu-omics/msisensor-pro?tab=License-1-ov-file#readme).

## Deployment options

To run the workflow from command line, change the working directory.

```bash
cd path/to/snakemake-workflow-name
```

Adjust options in the default config file `config/config.yaml`.
Before running the complete workflow, you can perform a dry run using:

```bash
snakemake --dry-run
```

To run the workflow with test files using **conda**:

```bash
snakemake --cores 2 --sdm conda --directory .test
```

## Authors

- David Lähnemann
  - German Cancer Consortium (DKTK), partner site Essen-Düsseldorf, A partnership between DKFZ and University Hospital Essen
  - https://orcid.org/0000-0002-9138-4112

## References

> Peng Jia, Xiaofei Yang, Li Guo, Bowen Liu, Jiadong Lin, Hao Liang, Jianyong Sun, Chengsheng Zhang, Kai Ye, MSIsensor-Pro: Fast, Accurate, and Matched-Normal-Sample-Free Detection of Microsatellite Instability, Genomics, Proteomics & Bioinformatics, Volume 18, Issue 1, February 2020, Pages 65–71, https://doi.org/10.1016/j.gpb.2020.02.001

> Köster, J., Mölder, F., Jablonski, K. P., Letcher, B., Hall, M. B., Tomkins-Tinch, C. H., Sochat, V., Forster, J., Lee, S., Twardziok, S. O., Kanitz, A., Wilm, A., Holtgrewe, M., Rahmann, S., & Nahnsen, S. _Sustainable data analysis with Snakemake_. F1000Research, 10:33, 10, 33, **2021**. https://doi.org/10.12688/f1000research.29032.2.

## TODO

- Do not forget to also adjust the configuration-specific `config/README.md` file.
