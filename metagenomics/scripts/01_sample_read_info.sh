#!/bin/bash

# change directory
# the location of the fastq files
cd ../raw_fastq/
# create file with list of R1 samples
ls -1 | grep _R1 > R1Samples.txt


# loops through list and print first line
touch sampleReadInfo.txt
for sample in `cat R1Samples.txt`; do
    #printf "${sample}\t"
    zcat ${sample} | head -1 >> sampleReadInfo.txt
done;

# the two files above were created in the projects folder. Now we will move them to our scripts folder
mv R1Samples.txt  /research/labs/neurology/fryer/m239830/microbiome/metagenomics/scripts/R1Samples.txt
mv sampleReadInfo.txt /research/labs/neurology/fryer/m239830/microbiome/metagenomics/scripts/sampleReadInfo.txt

# change directory to the scripts folder
cd /research/labs/neurology/fryer/m239830/microbiome/metagenomics/scripts/
paste -d "\t" R1Samples.txt sampleReadInfo.txt > sampleReadGroupInfo.txt

# clean up by removing these files. All information is saved in sampleReadGroupInfo
rm R1Samples.txt
rm sampleReadInfo.txt
