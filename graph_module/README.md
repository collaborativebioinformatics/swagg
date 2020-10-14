## Graph Module
This module will build a pangenome grpah in GFA format from either reference-based (fasta + VCF) or a set of assemblies (fasta). 


## Usage

### install script
* Download software and create the directory structure
* This script prints out some commands that need to be run to set up the path

Linux (may also work on Mac, I haven't tested, but shouldn't matter on Docker anyway)
```                                                                             
bash install.sh                                 
```

### create a pan-genome from VCF

USAGE
```
bash pg_from_vcf.sh <vcf> <fasta> > pg.gfa
```
where `<fasta>` is the reference in the `<vcf>`

### create a pan-genome from FASTA sequences via alignment

USAGE
```
bash pg_from_fasta.sh <fasta> > pg-msa.gfa
```
where `<fasta>` contains all the sequences to align. ideally one / sample for the path information in the GFA to be meaningful, but not necessary.

Note: a set of sequences is produced in `pg_from_vcf.sh` that can be fed in here as well.  This could potentially pull together similar insertions that are specified separately in the VCF, making the graph more compact. 

### analysis

#### Heatmap of sample similarity

USAGE
```
. venv/bin/activate
bin/pg-pathcomp graph.gfa > path-comp.tsv
bin/plotHeatmap.py path-comp.tsv path-comp.pdf
```

#### Plot SV hotspots with respect to given reference sample

USAGE
```
todo
```
