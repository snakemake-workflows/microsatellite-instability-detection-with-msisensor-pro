rule download_genome:
    output:
        "resources/{genome_version}.fasta",
    localrule: True  # run on local machine
    log:
        "logs/get-genome.{genome_version}.log",
    params:
        species=lookup(within=config, dpath="ref/species"),
        datatype="dna",
        build=lookup(within=config, dpath="ref/build"),
        release=lookup(within=config, dpath="ref/release"),
    cache: "omit-software"
    wrapper:
        "v7.2.0/bio/reference/ensembl-sequence"


rule msisensor_pro_scan:
    input:
        fa="resources/{genome_version}.fasta",
    output:
        list="resources/{genome_version}.msisensor.scan.list",
    log:
        "logs/{genome_version}.msisensor.scan.log",
    conda:
        "../envs/msisensor_pro.yaml"
    shell:
        "( msisensor-pro scan "
        "    -d {input.fa} "
        "    -o {output.list} "
        ") > {log} 2>&1"
