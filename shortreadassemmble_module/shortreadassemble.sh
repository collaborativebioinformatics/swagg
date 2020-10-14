
####
# command line input
####
assembly_type=$1;

# if paired
if [[ ${assembly_type} == "paired" ]]
then 
    echo "in";
    read_file_f=$2;
    read_file_r=$3;
    THREADS=$4
    OUTFILE=$5
    OUTDIR=$6
fi
# if single
if [[ ${assembly_type} == "single" ]]                                           
then                                                                            
    read_file=$2;
    THREADS=$3                                                                    
    OUTFILE=$4                                                                    
    OUTDIR=$5                                                               
fi

# specify output path
OUTPUTPATH=${OUTDIR}/${OUTFILE}

# Examples:
#bash filename.sh paired paired1.fa paired2.fa
#bash filename.sh single single.fa

###
# CODE BELOW
###
# This function impliment SPAdes
function shortreadassemble {
    # if paired
    if [[ ${assembly_type} == "single" ]]                                           
    then                                                                            
        SPADES_ARGS1="--disable-gzip-output --careful -t ${THREADS} -m 288 -k 21,33,55";
        SPADES_ARGS2="-s ${read_file} -o ${OUTPUTPATH}";
        ./SPAdes-3.14.1-*/bin/spades.py $SPADES_ARGS1 $SPADES_ARGS2; 
    fi
    # if single
    if [[ ${assembly_type} == "paired" ]]                                           
    then                                                                            
        SPADES_ARGS1="--disable-gzip-output --careful -t ${THREADS} -m 288 -k 21,33,55";
        SPADES_ARGS2="--pe1-fr --pe1-1 ${read_file_f} --pe1-2 ${read_file_r} -o ${OUTPUTPATH}";
        ./SPAdes-3.14.1-*/bin/spades.py $SPADES_ARGS1 $SPADES_ARGS2; 
    fi
}

# control the scipt
function main {
    shortreadassemble;
}
main;
