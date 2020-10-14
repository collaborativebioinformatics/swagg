#!/bin/bash

usage() {
    # Print usage to stderr
    exec 1>&2
    printf "Generate GFA files with paths from MSA files in fasta format"
    printf "Usage: $0 <msa.{fasta,aln}> <output_graph.gfa>\n\n"
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

IN_ALN="${1}"
shift
OUT_GFA="${1}"
shift

if [ ! -f "$IN_ALN" ]; then
	echo "$IN_ALN does not exist."
	exit 1
fi

python3 msa_to_gfa/main.py -f $IN_ALN -o $OUT_GFA -c ${OUT_GFA}_colors.json