

# print usage if not enough input!
usage() {
    echo; echo "Usage: bash simulate_reads.sh <reference file path> <output path>";
    echo; echo "Example: bash minimapper.sh contigs ./sarscov2_reference.fa"
          echo "contigs.fa outname_prefix output_dir 2 mac";
    echo; echo "sequencing type options: nanopore, illumina, pacbio, contigs";
    exit 1;
}

# getting the global variables set correctly
sequencing_type=$1;
ref_gen=$2;
read_seqs=$3;
out_name=$4;
out_directory=$5;
THREADS=$6;
os_type=$7;

# creating output directory if non-existant
if [[ ! -d $out_directory ]]
then
    mkdir $out_directory;
fi

# set up the output paths
OUTPATH="${out_directory}/${out_name}_minimap2.sam"
BAMOUTPATH="${out_directory}/${out_name}_minimap2.bam"
COVERAGEPATH="${out_directory}/${out_name}_coverage.txt"
SIMPCOVERAGEPATH="${out_directory}/${out_name}_coverage2.txt"

# function for simulating Illumina reads
function map_reads {
    echo "Mapping reads using minimap2..";

    ######
    # Creating the ARGS
    ######
    # Mapping illumina reads
    if [[ ${sequencing_type} == "illumina" ]] 
    then
        MINIMAP_ARGS="-a ${ref_gen} ${read_seqs} -o ${OUTPATH}";
    fi
    # Mapping pacbio reads                                                    
    if [[ ${sequencing_type} == "pacbio" ]]                                         
    then                                                                        
        MINIMAP_ARGS="-ax map-pb ${ref_gen} ${read_seqs} -o ${OUTPATH}";      
    fi
    # Mapping Nanopore reads                                                    
    if [[ ${sequencing_type} == "nanopore" ]]
    then                                                                        
        MINIMAP_ARGS="-ax map-ont ${ref_gen} ${read_seqs} -o ${OUTPATH}";      
    fi
    # Mapping contigs   
    # TODO: There may be better options available for mapping the contigs                                               
    if [[ ${sequencing_type} == "contigs" ]]                               
    then                                                                        
        MINIMAP_ARGS="-a ${ref_gen} ${read_seqs} -o ${OUTPATH}";
    fi    

    ######
    # Running minimap2 based on OS type
    ######
    # If using mac
    if [[ $os_type == "mac" ]]
    then
        minimap2 $MINIMAP_ARGS;
    fi
    # If using linux
    if [[ $os_type == "linux" ]]
    then
        command ./minimap2/minimap2 $MINIMAP_ARGS;
    fi
}

# Convert sam to bam
function convert_sam_to_bam {                                                            
    echo "Converting SAM to BAM..";                                                                                              
    # If sam exists, convert.  
    if [[ -f  ${OUTPATH} ]]                                   
    then                                                                        
        ./samtools/samtools view -bS ${OUTPATH} > ${BAMOUTPATH};
    fi                                                                          
} 

# Calculate coverage from mapped reads
function calculate_coverage {                                                            
    echo "Converting SAM to BAM..";                                                                                              
    # If sam exists, convert.  
    if [[ -f  ${BAMOUTPATH} ]]                                   
    then                                                                        
        ./samtools/samtools coverage -A -w 30 ${BAMOUTPATH} -o ${COVERAGEPATH};
        ./samtools/samtools coverage ${BAMOUTPATH} -o ${SIMPCOVERAGEPATH};
    fi                                                                          
} 

# main function for controlling the workflow
function main {
    map_reads;
    convert_sam_to_bam;
    calculate_coverage;
}
main;
