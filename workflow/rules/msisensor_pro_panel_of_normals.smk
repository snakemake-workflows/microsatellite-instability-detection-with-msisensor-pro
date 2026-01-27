# ----------------------------------------------------- #
# msisensor-pro analysis rules with tumor sample only   #
# ----------------------------------------------------- #


rule msisensor_pro_pro_preprocessing_baseline:
    input:
        bam="results/recal/{panel_of_normals_sample}.bam",
        bai="results/recal/{panel_of_normals_sample}.bai",
        ms_list="resources/{genome_version}.msisensor.scan.list",
        ref="resources/{genome_version}.fasta",
    output:
        panel_of_normals="results/panel_of_normals/details/{panel_of_normals_sample}.{genome_version}.panel_of_normals.out",
    log:
        "logs/panel_of_normals/details/{panel_of_normals_sample}.{genome_version}.panel_of_normals.log",
    conda:
        "../envs/msisensor_pro.yaml"
    threads: 2
    shell:
        "( msisensor-pro pro "
        "    -d {input.ms_list} "
        "    -t {input.bam} "
        "    -g {input.ref} "
        "    -o {output.panel_of_normals} "
        ") > {log} 2>&1"


rule create_panel_of_normals_samples_list:
    input:
        panel_of_normals=expand(
            "results/panel_of_normals/details/{panel_of_normals_sample}.{{genome_version}}.panel_of_normals.out",
            panel_of_normals_sample=lookup(
                within=samples,
                query="alias == '{panel_of_normals_alias}'",
                cols="sample",
                panel_of_normals_alias=lookup(
                    within=config, dpath="aliases/panel_of_normals", default=""
                ),
            ),
        ),
    output:
        panel_of_normals_list="results/panel_of_normals/{genome_version}.panel_of_normals.samples.list",
    log:
        "logs/panel_of_normals/{genome_version}.panel_of_normals.samples.list.log",
    conda:
        "../envs/python.yaml"
    script:
        "../scripts/create_panel_of_normals_samples_list.py"


rule msisensor_pro_baseline:
    input:
        panel_of_normals_list="results/panel_of_normals/{genome_version}.panel_of_normals.samples.list",
        ms_list="resources/{genome_version}.msisensor.scan.list",
    output:
        panel_of_normals="results/panel_of_normals/{genome_version}.panel_of_normals.tsv",
    log:
        "logs/panel_of_normals/{genome_version}.panel_of_normals.log",
    conda:
        "../envs/msisensor_pro.yaml"
    shell:
        "( msisensor-pro baseline "
        "    -d {input.ms_list} "
        "    -i {input.panel_of_normals_list} "
        "    -o {output.panel_of_normals} "
        "    -s 1 "
        ") > {log} 2>&1"


rule msisensor_pro_pro_run:
    input:
        panel_of_normals="results/panel_of_normals/{genome_version}.panel_of_normals.tsv",
        tumor_bam=lambda wc: get_sample_file_for_group_and_alias_type(
            wc, alias_type="tumor", extension="bam"
        ),
        tumor_bai=lambda wc: get_sample_file_for_group_and_alias_type(
            wc, alias_type="tumor", extension="bai"
        ),
        ref="resources/{genome_version}.fasta",
    output:
        "results/tumor_panel_of_normals/{group}/{group}.{genome_version}.msisensor-pro",
    log:
        "logs/tumor_panel_of_normals/{group}/{group}.{genome_version}.msisensor-pro.log",
    conda:
        "../envs/msisensor_pro.yaml"
    shell:
        "( msisensor-pro pro "
        "    -d {input.panel_of_normals} "
        "    -t {input.tumor_bam} "
        "    -g {input.ref} "
        "    -o {output} "
        ") > {log} 2>&1"
