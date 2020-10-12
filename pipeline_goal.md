


# Description 
This document shows how we can all work in parrallel

# different pipeline modules

## Making Data  ==> Dreycey
INPUT: Fasta genome files
OUTPUT: Simulated NanoPore, Illumina, and PacBio fasta files

## Assembly (short reads) ==> Alej and Fawaz 
TOOL(s): Spades
URL: https://github.com/ablab/spades
INPUT: Fasta short read files - we can find links for covid
OUTPUT: Fasta contigs

## Assembly (long reads) ==> Qian
TOOL(s): wtdbg2 - michael posted long read files              
URL: https://github.com/ruanjue/wtdbg2
INPUT: Fasta long read files                                                         
OUTPUT: Fasta contigs 

## Mapping (short and long reads) ==> Alej and Fawaz (short), Qian (long read)                       
TOOL(s): MiniMap2
URL: https://github.com/lh3/minimap2                                
INPUT: Reference file and assembled contigs                                                 
OUTPUT: BAM                                                         

## Variant Calling (short reads) ==> Alej and Fawaz             
TOOL(s): GATK                          
URL: https://github.com/broadinstitute/gatk      
INPUT: Reference file and BAM file (short read BAM, from contigs from Spades)                          
OUTPUT: VCF

## Variant Calling (long reads) ==> Ahmed                                                     
TOOL(s): DeepVariant
URL: https://github.com/google/deepvariant                                                              
INPUT: Reference file and BAM file (long read BAM, from contigs from wtdgb2) 
OUTPUT: VCF
                                                                                
## Graph Genome Construction ==> Sagayamary, Glen
TOOL(s): vg                                
URL: https://github.com/vgteam/vg                                
INPUT: Fasta consensus genome file and a corresponding VCF                                                         
OUTPUT: graph genome



