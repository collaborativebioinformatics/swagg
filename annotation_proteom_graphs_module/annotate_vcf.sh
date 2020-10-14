#!/bin/bash

usage() {
    # Print usage to stderr
    exec 1>&2
    printf "Annotate the VCF with snpEff\n"
    printf "Usage: $0 <VARIANTS.vcf.gz> <OUTPUT.vcf.gz>\n\n"
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

IN_VCF="${1}"
shift
OUT_VCF="${1}"
shift

if [ ! -f "$IN_VCF" ]; then
	echo "$IN_VCF does not exist."
	exit 1
fi

java -Xmx8g -jar snpEff/snpEff.jar NC_045512.2 $IN_VCF | gzip > $OUT_VCF
