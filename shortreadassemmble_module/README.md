# Short Read Assembly Module

## Description
This module takes in rads from an illumina sequencers and assembles the reads
into contigs. 

## USAGE

### Install

* for linux
```
bash install.sh linux
```

* for mac
```
bash install.sh mac
```

### Assemble Reads

* paired end reads
```
bash  shortreadassemble.sh paired COVHA-20200316-P12-F07-P.filtered.sars_cov_2.R1.fastq.gz COVHA-20200316-P12-F07-P.filtered.sars_cov_2.R2.fastq.gz 2 outfile outdir/
```

* single end
```
bash  shortreadassemble.sh single COVHA-20200316-P12-F07-P.filtered.sars_cov_2.R2.fastq.gz 2 outfile outdir/
```


