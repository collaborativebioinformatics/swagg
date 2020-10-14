






## USAGE

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

```


### minimap2 with Illumina

```
minimap2 -a example_input_data/sarscov2_reference.fa example_input_data test_output_prefix_illumina.fq > illumina_output.sam
```

### Pacbio Mapping
```
minimap2 
-ax map-pb example_input_data/sarscov2_reference.fa example_input_datatest_output_prefix_pacbio.fq > pacbio_output.sam
```

### Nanopore
```
minimap2 -ax map-ont example_input_data/sarscov2_reference.fa example_input_data/test_output_prefix_aligned_reads.fasta > nanopore_output.sam
```



### obtianing and compiling same tools
```
git clone https://github.com/samtools/samtools
```
```
git clone https://github.com/samtools/htslib.git
```
```
cd samtools;
Make;
Cd ..;
```

* creating the bam file from the sam file
```
./samtools/samtools view -bS illumina_output.sam > file.bam
```
* finding the coverage - histogram
```
./samtools/samtools coverage -A -w 30 file.bam
```

* finding the coverage - collect data
```
./samtools/samtools coverage file.bam
```

./samtool
s/samtools coverage -A -w 30 file.bam -o output_coverage_hist


