# Short Read Small Variant Call Module

## Description
This module takes in contigs and compares them to a provided reference.

## USAGE

### Install

See notes from gGATK4 repo..

* for linux
```
bash install.sh linux
```

* for mac
```
bash install.sh mac
```

### Call Variants on nextgen reads

* General Usage
```
bash shortreadvariant_module.sh <ref_genome> <BAMFILE> <THREADS> <OUTFILE> <OUTDIR>
```

* Example Usage                                                                 
```                                                                             
bash shortreadvariant_module.sh sars_genome.fa illumina_sars.bam 3 sarsout working_dir/
``` 

