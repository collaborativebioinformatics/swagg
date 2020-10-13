#!/usr/bin/env bash

# make a pan-genome graph from a VCF
# the graph construction is trivial, but making ure the haplotypes turn up as paths takes a few extra commands...
# requires: the vg binary and bgzip

usage() {
    # Print usage to stderr
    exec 1>&2
    printf "Usage: $0 <VCF> <FASTA> <OUTPUT-NAME}\n"
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

VCF="${1}"
shift
FASTA="${1}"
shift
OUTNAME="${1}"
shift

set -ex

# make the graph, storing phasing information in temprary paths
vg construct -v ${VCF} -r ${FASTA} -a -f > ${OUTNAME}.vg

# make the GBWT, which is a very efficient represenation of the phased haplotypes in the VCF
vg index ${OUTNAME}.vg -G ${OUTNAME}.gbwt -v ${VCF}

# extract the paths back out of the GBWT so we can view them in GFA
# todo: there may be some name munging to do here
vg paths -x ${OUTNAME}.vg -g ${OUTNAME}.gbwt -A | bgzip > ${OUTNAME}.paths.gaf.gz

# remove the paths
vg paths -v ${OUTNAME}.vg -d > ${OUTNAME}.nopaths.vg

# add the paths
vg augment ${OUTNAME}.nopaths.vg -F ${OUTNAME}.paths.gaf.gz -i > ${OUTNAME}.allpaths.vg

# print the GFA
vg view ${OUTNAME}.allpaths.vg

# keep the paths as FASTA in case we want to align to make MSA graph
vg paths -v ${OUTNAME}.allpaths.vg -F ${OUTNAME}.fasta

# clean up

# rm -f  ${OUTNAME}.vg ${OUTNAME}.gbwt ${OUTNAME}.paths.gaf.gz ${OUTNAME}.nopaths.vg ${OUTNAME}.allpaths.vg
