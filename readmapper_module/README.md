
# MINIMAP2 READ/CONTIG MAPPER

## Description
This module takes in reads (or assembled contigs) and maps these to an input
reference genome.


## USAGE

* General Command.
bash minimapper.sh <READ TYPE> <PATH TO REFERENCE> <PATH TO READS/CONTIGS> <OUTPUT PREFIX> <OUTPUT DIR> <THREADS> <OS TYPE>

READ TYPE = nanopore, pacbio, illumina, contigs
OS TYPE = mac, linux

* mapping illumina reads example
```
bash minimapper.sh illumina example_input_data/sarscov2_reference.fa example_input_data/test_output_prefix_illumina.fq outprefix output_directory 2 mac
```

* mapping pacbio reads example
```
sh minimapper.sh pacbio example_input_data/sarscov2_reference.fa example_input_data/test_output_prefix_pacbio.fq outprefix_pacbiooutput_directory 2 mac
```

* mapping nanopore reads example
```
sh minimapper.sh nanopore example_input_data/sarscov2_reference.fa example_input_data/test_output_prefix_nanopore.fq outprefix_nanoporeoutput_directory 2 mac
```

* Mapping contigs example
```
sh minimapper.sh contigs example_input_data/sarscov2_reference.fa example_input_data/test_output_prefix_contigs.fq outprefix_contigs output_directory 2 mac
```

