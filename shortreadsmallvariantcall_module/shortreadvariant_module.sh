
####
# command line input
####
ref_genome=$1;                                                                         
BAMFILE=$2;
THREADS=$3                                                                    
OUTFILE=$4                                                                    
OUTDIR=$5           

# specify output path
OUTPUTPATH=${OUTDIR}/${OUTFILE}

###
# CODE BELOW
###
# This function uses lofreq to call variants on nextgen reads
function callvar_lofreq {                                                                          
    LOFREQ_ARGS1="call-parallel --pp-threads ${THREADS} -f ${ref_genome}";
    LOFREQ_ARGS2="-o ${OUTPUTPATH}.vcf ${BAMFILE}";
    ./lofreq_star-2.1.*/bin/lofreq $LOFREQ_ARGS1 $LOFREQ_ARGS2; 
}

# control the scipt
function main {
    callvar_lofreq;
}
main;
