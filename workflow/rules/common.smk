# import basic packages
import pandas as pd
from snakemake.utils import validate


# read sample sheet
samples = (
    pd.read_csv(config["sample_sheet"], sep="\t", dtype={"sample": str})
    .set_index("sample", drop=False)
    .sort_index()
)


# validate sample sheet
validate(samples, schema="../schemas/samples.schema.yaml")

# uniqueness validation for (group, alias) pairs
duplicates = samples.groupby(["group", "alias"]).size()
duplicate_pairs = duplicates[duplicates > 1]
if not duplicate_pairs.empty:
    raise ValueError(
        "The sample sheet contains multiple samples with the same (group, "
        "alias) pair(s). Each (group, alias) combination must map to exactly "
        "one sample, or, put differently each alias should only appear once per "
        "group. "
        f"The duplicates found were:\n{duplicate_pairs}\n"
    )

# uniqueness validation for (sample, alias) pairs with panel_of_normals
panel_of_normals = config["aliases"].get("panel_of_normals", "")
if panel_of_normals:
    pon_duplicates = (
        samples[samples["alias"] == panel_of_normals]
        .groupby(["sample", "alias"])
        .size()
    )
    pon_duplicate_pairs = pon_duplicates[pon_duplicates > 1]
    if not pon_duplicate_pairs.empty:
        raise ValueError(
            "The sample sheet contains multiple panel_of_normal samples (alias "
            f"'{panel_of_normals}') with the same sample name. Each sample name "
            f"with the alias '{panel_of_normals}' has to be unique. "
            f"The duplicates found were:\n{pon_duplicate_pairs}\n"
        )

# validate config file
validate(config, schema="../schemas/config.schema.yaml")


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
    group="|".join(samples["group"]),
    workflow_mode="|".join(["tumor_panel_of_normals", "tumor_matched_normal"]),


# FINAL OUTPUT


def get_final_output(wildcards):

    final_output = []

    matched_normal = lookup(within=config, dpath="aliases/matched_normal", default="")
    panel_of_normals = lookup(
        within=config, dpath="aliases/panel_of_normals", default=""
    )

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
                "results/tumor_matched_normal.{genome_version}.all_samples.tsv",
                genome_version=genome_name,
            ),
        )
    elif panel_of_normals:
        final_output.extend(
            expand(
                "results/tumor_panel_of_normals.{genome_version}.all_samples.tsv",
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


# helper functions


def get_sample_file_for_group_and_alias_type(wildcards, alias_type, extension):
    alias = config["aliases"].get(alias_type, "")
    if not alias:
        raise ValueError(
            f"No alias for sample type '{alias_type}' specified under config['aliases']."
        )
    sample = lookup(
        within=samples,
        cols="sample",
        query=f"group == '{wildcards.group}' & alias == '{alias}'",
    )
    return expand(
        "results/recal/{sample}.{extension}",
        sample=sample,
        extension=extension,
    )
