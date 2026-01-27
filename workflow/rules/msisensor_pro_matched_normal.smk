# --------------------------------------------------------------------- #
# msisensor-pro analysis rules with one matched normal sample per tumor #
# --------------------------------------------------------------------- #


rule msisensor_pro_msi:
    input:
        ms_list="resources/{genome_version}.msisensor.scan.list",
        normal_bam=lambda wc: get_sample_file_for_group_and_alias_type(
            wc, alias_type="matched_normal", extension="bam"
        ),
        normal_bai=lambda wc: get_sample_file_for_group_and_alias_type(
            wc, alias_type="matched_normal", extension="bai"
        ),
        tumor_bam=lambda wc: get_sample_file_for_group_and_alias_type(
            wc, alias_type="tumor", extension="bam"
        ),
        tumor_bai=lambda wc: get_sample_file_for_group_and_alias_type(
            wc, alias_type="tumor", extension="bai"
        ),
        ref="resources/{genome_version}.fasta",
    output:
        msi="results/tumor_matched_normal/{group}/{group}.{genome_version}.msisensor-pro",
        all_sites="results/tumor_matched_normal/{group}/{group}.{genome_version}.msisensor-pro_all",
        distribution="results/tumor_matched_normal/{group}/{group}.{genome_version}.msisensor-pro_dis",
        unstable_sites="results/tumor_matched_normal/{group}/{group}.{genome_version}.msisensor-pro_unstable",
    log:
        "logs/tumor_matched_normal/{group}/{group}.{genome_version}.msisensor-pro.log",
    conda:
        "../envs/msisensor_pro.yaml"
    shell:
        "( msisensor-pro msi "
        "    -d {input.ms_list} "
        "    -n {input.normal_bam} "
        "    -t {input.tumor_bam} "
        "    -g {input.ref} "
        "    -o {output.msi} "
        ") > {log} 2>&1"
