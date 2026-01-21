import sys
from os import path

sys.stderr = open(snakemake.log[0], "w", buffering=1)

with open(snakemake.output.panel_of_normals_list, "w") as f:
    for i in snakemake.input.panel_of_normals:
        sample_name = path.basename(i).split(f".{snakemake.wildcards.genome_version}.")[0]
        f.write(f"{sample_name} \t{i}_all\n")

