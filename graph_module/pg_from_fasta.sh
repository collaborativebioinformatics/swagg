#!/usr/bin/env bash

# make a pan-genome graph from a fasta by running the sequences through a multiple aligner
# requires: abPOA

usage() {
    # Print usage to stderr
    exec 1>&2
    printf "Usage: $0 <FASTA>\n"
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

FASTA="${1}"
shift

set -ex

# make the graph, printing the GFA to stdout
abpoa ${FASTA} -m 0 -r 3
