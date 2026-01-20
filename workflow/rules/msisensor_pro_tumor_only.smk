# ----------------------------------------------------- #
# msisensor-pro analysis rules with tumor sample only   #
# ----------------------------------------------------- #


rule msisensor_pro_pro_preprocessing_baseline:
    input:
        bam="results/recal/{baseline_sample}.bam",
        bai="results/recal/{baseline_sample}.bai",
        ms_list="resources/{genome_version}.msisensor.scan.list",
        ref="resources/{genome_version}.fasta",
    output:
        baseline="results/baselines/details/{baseline_sample}.{genome_version}.baseline.out",
    log:
        "logs/baselines/details/{baseline_sample}.{genome_version}.baseline.log",
    conda:
        "../envs/msisensor_pro.yaml"
    threads: 2
    shell:
        "( msisensor-pro pro "
        "    -d {input.ms_list} "
        "    -t {input.bam} "
        "    -g {input.ref} "
        "    -o {output.baseline} "
        ") > {log} 2>&1"


rule create_baseline_samples_list:
    input:
        baseline=expand(
            "results/baselines/details/{baseline_sample}.{{genome_version}}.baseline.out",
            baseline_sample=lookup(
                within=samples,
                query="alias == '{baseline_alias}'",
                cols="sample",
                baseline_alias=lookup(within=config, dpath="aliases/baseline"),
            ),
        ),
    output:
        baseline_list="results/baselines/{genome_version}.baseline.samples.list",
    log:
        "logs/baselines/{genome_version}.baseline.samples.list.log",
    script:
        "../scripts/create_baseline_samples_list.py"


rule msisensor_pro_baseline:
    input:
        baseline_list="results/baselines/{genome_version}.baseline.samples.list",
        ms_list="resources/{genome_version}.msisensor.scan.list",
    output:
        baseline="results/baselines/{genome_version}.baseline.tsv",
    log:
        "logs/baselines/{genome_version}.baseline.log",
    conda:
        "../envs/msisensor_pro.yaml"
    shell:
        "( msisensor-pro baseline "
        "    -d {input.ms_list} "
        "    -i {input.baseline_list} "
        "    -o {output.baseline} "
        "    -s 1 "
        ") > {log} 2>&1"


rule msisensor_pro_pro_run:
    input:
        baseline="results/baselines/{genome_version}.baseline.tsv",
        tumor_bam=expand(
            "results/recal/{sample}.bam",
            sample=lookup(within=samples, query="group == '{group}'", cols="sample"),
        ),
        tumor_bai=expand(
            "results/recal/{sample}.bai",
            sample=lookup(within=samples, query="group == '{group}'", cols="sample"),
        ),
        ref="resources/{genome_version}.fasta",
    output:
        "results/tumor_only/{group}/{group}.{genome_version}.msisensor-pro",
    log:
        "results/tumor_only/{group}/{group}.{genome_version}.msisensor-pro.log",
    conda:
        "../envs/msisensor_pro.yaml"
    shell:
        "( msisensor-pro pro "
        "    -d {input.baseline} "
        "    -t {input.tumor_bam} "
        "    -g {input.ref} "
        "    -o {output} "
        ") > {log} 2>&1"
