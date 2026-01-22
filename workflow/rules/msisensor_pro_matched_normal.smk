# --------------------------------------------------------------------- #
# msisensor-pro analysis rules with one matched normal sample per tumor #
# --------------------------------------------------------------------- #


rule msisensor_pro_msi:
    input:
        ms_list="resources/{genome_version}.msisensor.scan.list",
        normal_bam=expand(
            "results/recal/{sample}.bam",
            sample=lookup(
                within=samples,
                query="group == '{group}' & alias == '{alias}'",
                cols="sample",
                alias=lookup(
                    within=config, dpath="aliases/matched_normal", default=""
                ),
            ),
        ),
        normal_bai=expand(
            "results/recal/{sample}.bai",
            sample=lookup(
                within=samples,
                query="group == '{group}' & alias == '{alias}'",
                cols="sample",
                alias=lookup(
                    within=config, dpath="aliases/matched_normal", default=""
                ),
            ),
        ),
        tumor_bam=expand(
            "results/recal/{sample}.bam",
            sample=lookup(
                within=samples,
                query="group == '{group}' & alias == '{alias}'",
                cols="sample",
                alias=lookup(within=config, dpath="aliases/tumor"),
            ),
        ),
        tumor_bai=expand(
            "results/recal/{sample}.bai",
            sample=lookup(
                within=samples,
                query="group == '{group}' & alias == '{alias}'",
                cols="sample",
                alias=lookup(within=config, dpath="aliases/tumor"),
            ),
        ),
        ref="resources/{genome_version}.fasta",
    output:
        "results/tumor_matched_normal/{group}/{group}.{genome_version}.msisensor-pro",
    log:
        "results/tumor_matched_normal/{group}/{group}.{genome_version}.msisensor-pro.log",
    conda:
        "../envs/msisensor_pro.yaml"
    shell:
        "( msisensor-pro msi "
        "    -d {input.ms_list} "
        "    -n {input.normal_bam} "
        "    -t {input.tumor_bam} "
        "    -g {input.ref} "
        "    -o {output} "
        ") > {log} 2>&1"
