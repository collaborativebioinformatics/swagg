## Graph Module
This module will build a pangenome grpah in GFA format from either reference-based (fasta + VCF) or a set of assemblies (fasta). 


## Usage

### install script
* Download software and create the directory structure
* IMPORTANT: The install script prints out some commands that need to be run to set up the `PATH`.

Linux (may also work on Mac, I haven't tested, but shouldn't matter on Docker anyway)
```                                                                             
bash install.sh                                 
```

### create a pan-genome from VCF

USAGE
```
pg_from_vcf.sh <vcf> <fasta> > pg.gfa
```
where `<fasta>` is the reference in the `<vcf>`

### create a pan-genome from FASTA sequences via alignment

USAGE
```
pg_from_fasta.sh <fasta> > pg-msa.gfa
```
where `<fasta>` contains all the sequences to align. ideally one / sample for the path information in the GFA to be meaningful, but not necessary.

Note: a set of sequences is produced in `pg_from_vcf.sh` that can be fed in here as well.  This could potentially pull together similar insertions that are specified separately in the VCF, making the graph more compact. 

EXAMPLE
```
wget https://raw.githubusercontent.com/hpobio-lab/viral-analysis/master/data/SARS-CoV-2.genbank.20200329.complete.fasta
pg_from_fasta.sh SARS-CoV-2.genbank.20200329.complete.fasta > sars.gfa
```
### analysis

#### Heatmap of sample similarity

The goal is to do a pairwise comparison of all paths in the graph.  It will print out a matrix in TSV format with row and column headers (path names -- should correspond to samples) in the 1st position.  This could also be accomplished by performing every pairwise alignment, but it will scale much better (in theory at least) to extract it directly from the graph.

Todo: The python plotting script doesn't scale very well -- I need to replace with something better.  

USAGE
```
. venv/activate
pg-pathcomp -g graph.gfa -m path-comp.tsv
plotHeatmap.py path-comp.tsv path-comp.pdf
```

EXAMPLE (dependent on `sars.gfa` file created above)
```
pg-pathcomp -g sars.gfa -m sars-comp.tsv
plotHeatMap.py sars-comp.tsv sars-comp.pdf --log_scale
```

#### Plot SV hotspots with respect to given reference sample

This section shows how to plot a "pileup" over any path in the graph counting the number of other paths that contain an SV overlapping each position.  The SV size cutoff is a parameter.  This is fairly trivial to get from a VCF, but this graph approach will work for graphs that are not derived from VCF like the one in the example.  

Todo: Again, missing the plotting tool for now -- It's fairly trivial though.

USAGE
```
vg view -Fv graph.gfa | vg snarls - > graph.snarls
pg-pathcomp -g graph.gfa -r graph.snarls -p ref_path -u pileup.wig
```

EXAMPLE (dependent on `sars.gfa` file created above)
```
vg view -Fv sars.gfa | vg snarls - > sars.snarls
pg-pathcomp -g sars.gfa -r sars.snarls -p NC_045512 -u sars.NC_045512.wig -M 2

```
There's not much going on here, as this graph contains very little in the way of indels let alone SVs.  Hopefully this group gets something meatier! 

