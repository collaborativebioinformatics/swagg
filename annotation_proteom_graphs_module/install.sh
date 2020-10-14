#!/bin/bash

function get_snpeff {
	printf "Getting snpEff..."
	wget https://snpeff.blob.core.windows.net/versions/snpEff_latest_core.zip
	printf "Unzipping snpEff..."
	unzip snpEff_latest_core.zip
	printf "Done!"
}


function get_VAPiD {
	printf "Getting VAPiD"
	git clone https://github.com/rcs333/VAPiD.git
	printf "Done!"
}


function get_msa_to_gfa {
	printf "Getting MSA to GFA"
	git clone https://github.com/fawaz-dabbaghieh/msa_to_gfa.git
	print "Done!"
}

function main {
	get_snpeff;
	get_VAPiD;
	get_msa_to_gfa;	
}

main;
