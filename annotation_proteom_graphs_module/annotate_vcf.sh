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

