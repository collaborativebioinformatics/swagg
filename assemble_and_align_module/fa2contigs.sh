#!/usr/bin/env bash

# use reads fasta as input for wtdbg2 to generate assembled contig fasta sequences
# WARNING:  only input reads longer than 1024bp are used

# requires: wtdbg2, samtools & picard-tools
usage() {
    # Print usage to stderr
    exec 1>&2
    printf "\nAssemble fasta reads into contigs using wtdbg2\n"
    printf "Requires: wtdbg2, samtools and picard-tools\n\n"
    printf "Usage: $0 <READ_FASTA> <OUTPUT_CONTIG_FASTA>\n\n"
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

FASTA="${1}"
shift
OUTFILE="${1}"
shift

set -ex

# assemble fasta reads into contigs
# use "30k" as the SARS-COVID-2 vrial genome size
# WARNING:  only input reads longer than 1024bp are used

wtdbg2 -g 30k -o dbg -i ${FASTA}
wtpoa-cns -i dbg.ctg.lay.gz -fo ${OUTFILE}

# clean up
rm -rf dbg.*
sleep 5
# ======Assembled contigs:======
echo
grep ">" ${OUTFILE}
