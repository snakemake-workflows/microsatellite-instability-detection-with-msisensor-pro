# ----------------------------------------------------- #
# aggregation and presentation of results               #
# ----------------------------------------------------- #


rule merge_msi_results:
    input:
        msi_results=expand(
            "results/{{workflow_mode}}/{group}/{group}.{{genome_version}}.msisensor-pro",
            group=lookup(
                within=samples,
                query="alias == '{tumor_alias}'",
                cols="group",
                tumor_alias=lookup(within=config, dpath="aliases/tumor"),
            ),
        ),
    output:
        tsv="results/{workflow_mode}.{genome_version}.all_samples.tsv",
    log:
        "logs/{workflow_mode}.{genome_version}.merge_all_samples.log",
    conda:
        "../envs/tidyverse.yaml"
    script:
        "../scripts/merge_msi_results.R"
