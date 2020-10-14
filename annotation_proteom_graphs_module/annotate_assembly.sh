#!/bin/bash

VAPID="VAPiD/vapid3.py"

usage() {
    # Print usage to stderr
    exec 1>&2
    printf "Annotate assembly using VAPiD\n"
    printf "Usage: $0 <ASSEMBLY.fasta>\n\n"
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

python3 VAPID --r NC_045512.2 $IN_FASTA example.sbt
