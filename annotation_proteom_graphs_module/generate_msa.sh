#!/bin/bash

usage() {
    # Print usage to stderr
    exec 1>&2
    printf "Generate MSA from fasta file"
    printf "Usage: $0 <SEQUENCES.fasta> \n\n"
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

if [[ "$#" -lt "1" ]]; then
    # Too few arguments
    usage
fi

IN_FASTA="${1}"
shift


if [ ! -f "$IN_FASTA" ]; then
	echo "$IN_FASTA does not exist."
	exit 1
fi

clustalo -i $IN_FASTA -o ${IN_FASTA}_msa.aln --threads 10 --distmat-out=${IN_FASTA}_dist_matrix.mat --force --full --percent-id