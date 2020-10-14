## assemble_and_align Module
This module will do the following.


## Usage

### install.sh
* Download wtdbg2 and get ready for running the wtdbg2 assembler
* This script prints out some commands that need to be run to set up the path

```                                                                             
bash install.sh                                 
```

### fq2fa.sh
* Use seqtk to convert fastq to fasta as input for wtdbg2 assembler 
* requires: seqtk

USAGE
```
bash fq2fa.sh <READ_FASTQ> <OUTPUT_FASTA>
```

### fa2contigs.sh
* use reads fasta as input for wtdbg2 to generate assembled contig fasta sequences
* WARNING:  only input reads longer than 1024bp are used
* requires: wtdbg2, samtools & picard-tools

USAGE
```
bash fa2contigs.sh <READ_FASTA> <OUTPUT_CONTIG_FASTA>
```
### seq2bam.sh
* use minimap 2 to align reads/contigs to a reference genome to generate a bam file
* requires: minimap2 and samtools

USAGE
```
bash seq2bam.sh <REF> <READ_FASTA> <OUTPUT_CONTIG_FASTA>
```
