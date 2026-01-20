# import basic packages
import pandas as pd
from snakemake.utils import validate


# read sample sheet
samples = (
    pd.read_csv(config["sample_sheet"], sep="\t", dtype={"sample": str})
    .set_index("sample", drop=False)
    .sort_index()
)


# validate sample sheet and config file
validate(samples, schema="../../config/schemas/samples.schema.yaml")
validate(config, schema="../../config/schemas/config.schema.yaml")

# define the genome variable to have informative fasta file name
datatype_genome = "dna"
species = config["ref"]["species"]
build = config["ref"]["build"]
release = config["ref"]["release"]
genome_name = f"genome.{datatype_genome}.{species}.{build}.{release}"

# WILDCARD CONSTRAINTS


wildcard_constraints:
    genome_version=genome_name,
    sample="|".join(samples["sample"]),
    workflow_mode="|".join(["tumor_only", "tumor_normal"]),


# FINAL OUTPUT


def get_final_output(wildcards):

    final_output = []

    matched_normal = lookup(within=config, dpath="aliases/matched_normal", default="")
    panel_of_normals = lookup(within=config, dpath="aliases/baseline", default="")

    if matched_normal and panel_of_normals:
        raise KeyError(
            "The configfile specifies both `aliases: matched_normal:` and "
            "`aliases: baseline:`. You must specify exactly one of these, and "
            "comment out the other, to clearly determine the mode the "
            "workflow runs in. For details, see the comments in the configfile."
        )
    elif matched_normal:
        final_output.extend(
            expand(
                "results/tumor_normal.{genome_version}.all_samples.tsv",
                genome_version=genome_name,
            ),
        )
    elif panel_of_normals:
        final_output.extend(
            expand(
                "results/tumor_only.{genome_version}.all_samples.tsv",
                genome_version=genome_name,
            ),
        )
    else:
        raise KeyError(
            "The configfile specifies neither `aliases: matched_normal:`, nor "
            "`aliases: baseline:`. You must specify exactly one of these. For "
            "details, see the comments in the configfile."
        )

    return final_output
