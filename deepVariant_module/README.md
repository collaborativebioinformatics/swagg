
# DeepVariant module to call variants (SNP and INDELS from PacBio/ONT long-reads)

## Download:

This will create a docker version of deepvariant -v1.0.0

    bash install.sh


## Call variants:

    bash deepvariant <your.bam> <ref.fa>
    
This will create a zipped vcf file contains the variants (SNPs and Indels) from covid genome of interest. 

