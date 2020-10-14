#!/usr/bin/env bash

# use seqtk to convert fastq to fasta as input for wtdbg2 assembler
# requires: seqtk

usage() {
    # Print usage to stderr
    exec 1>&2
    printf "\nConvert FASTQ to FASTA with seqtk\n"
    printf "Requires: seqtk\n\n"
    printf "Usage: $0 <READ_FASTQ> <OUTPUT_FASTA>\n\n"
    exit 1
}

while getopts "h:" o; do
    case "${o}" in
        *)
            usage
            ;;
    esac
done

shift $((OPTIND-1))

if [[ "$#" -lt "2" ]]; then
    # Too few arguments
    usage
fi

FASTQ="${1}"
shift
OUTFILE="${1}"
shift

set -ex

# now convert fastq to fasta

seqtk seq -A ${FASTQ} > ${OUTFILE}

# check the number of reads in the output
sleep 2
echo
echo "Total reads converted:"
grep ">" ${OUTFILE} | wc -l
