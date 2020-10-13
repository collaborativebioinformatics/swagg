# General idea
One of the ideas I wanted to explore is the effect of the variants on the proteins (basically annotating the variants).
Some tools can be used such as [snpEff](https://pcingola.github.io/SnpEff/). The basic command for that is:
```
java -Xmx8g -jar snpEff.jar NC_045512.2 variants.vcf.gz | gzip > annotated_variants.vcf.gz
```
Unfortunately, this did not work, the annotated variant file output did not have any annotations and had the error `ERROR_CHROMOSOME_NOT_FOUND`. But it might be a problem with the files I used (need to check this again once we produce some VCF files).

Second idea is to take the VCF file and the reference and run bcftools consensus to get a consensus fasta file, command:
```
cat reference.fasta | bcftools consensus variants.vcf.gz > consesnus_sequences.fasta
```
Then taking this output, I can annotate it using a viral annotation tool like [VAPiD](https://github.com/rcs333/VAPiD), and instead of using a big database, we know that we're working with covid-19 genome, so we can give VAPiD the argument `--r NC_045512.2` to use this as reference. VAPiD will produce several files and one of theme is a gene bank file, this can easily then be parsed and the proteins separated. We can also add an identifier to each protein to know from which consesus file it came from. Next step would be running an MSA algorithm on the same protein (using clustalo or clustalw for examle). Then using my MSA to GFA tool, we can generate graphs with bubbles representing the amino acids that were affecteced. 
Command for clustalo:
```
clustalo -i proteins.fasta -o msa_proteins.aln --threads 10 --distmat-out=distance_matrix.mat --force --full --percent-id
```
![Exampole graph of covid protein QHD43422.1 affected by several variants](fig1.png)