#!/usr/bin/env bash

# use minimap 2 to align reads/contigs to a reference genome to generate a bam file
# requires: minimap2 and samtools

usage() {
    # Print usage to stderr
    exec 1>&2
    printf "\nUse minimap2 to align reads/contigs to ref to generate a BAM file\n"
    printf "Requires: minimap2 and samtools\n\n" 
    printf "Usage: $0 <REF> <READ_FASTA> <OUTPUT_CONTIG_FASTA>\n\n"
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

if [[ "$#" -lt "3" ]]; then
    # Too few arguments
    usage
fi

REF="${1}"
shift
FASTA="${1}"
shift
OUTFILE="${1}"
shift

set -ex

# align contigs/reads to the COVID19 reference to generate a BAM file
minimap2 -ax map-pb ${REF} ${FASTA} > ${OUTFILE}.tmp.bam
samtools sort ${OUTFILE}.tmp.bam -o ${OUTFILE}
samtools index ${OUTFILE}

# clean up 
rm -rf ${OUTFILE}.tmp.bam
