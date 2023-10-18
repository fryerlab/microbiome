# Metagenomics pipepline


# 1. collect fastq sample ids
sh scripts/01_sample_read_info.sh 

## 2. create config
python scripts/02_create_config.py 
