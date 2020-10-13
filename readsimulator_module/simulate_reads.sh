
# print usage if not enough input!
usage() {
    echo; echo "Usage: bash simulate_reads.sh <reference file path> <output path>";
    echo; echo "Example: bash simulate_reads.sh ./sarscov2_reference.fa output";
    exit 1;
}

# getting the global variables set correctly
ref_gen=$1;
out_name=$2;
out_directory=$3;
THREADS=$4;

# function for simulating Illumina reads
function simulate_illumina {
    echo "Downloading ART for short read simulation..";
    if [ ! -f ${out_name}_illumina.fq ] 
    then
        ART_CMD_ARGS="-ss MSv3 -sam -i ${ref_gen} -l 100 -f 30 -o
${out_name}_illumina";
        command ./art_bin_MountRainier/art_illumina $ART_CMD_ARGS;
    fi
}

function simulate_nanopore {
    echo "Simulating NanoPore reads..";
    if [ ! -f ${out_name}_aligned_reads.fasta ]
    then
        TRAINING="human_NA12878_DNA_FAB49712_albacore/training"
        NANO_CMD_ARGS="-rg sarscov2_reference.fa -c ${TRAINING} -o ${out_name} -t ${THREADS}"
        python3 NanoSim/src/simulator.py genome $NANO_CMD_ARGS
    fi
}

function simulate_pacbio {
    echo "Simulating Pacbio reads..";
    if [ ! -f ${out_name}_pacbio.fq ]
    then
        # create the index
        perl PaSS/pacbio_mkindex.pl ${ref_gen} ${out_name}; 
        # use these files to simulate the pacbio reads
        ./PaSS/PaSS -list percentage.txt -index index -m pacbio_RS  -c PaSS/sim.config -r 2000 -t ${THREADS} -o ${out_name}_pacbio -d; 
    fi
}



# main function for controlling the workflow
function main {
    simulate_illumina;
    simulate_nanopore;
    simulate_pacbio;
}
main;
