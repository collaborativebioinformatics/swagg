
# print usage if not enough input!

function deepvariant {


	OUTPUT_DIR="${PWD}/covid-output"
	mkdir -p "${OUTPUT_DIR}"
	bam=$1;
	ref_fa=$2;

	echo; echo "output dir created";
	echo; echo "calling varaints now";

	sudo docker run -v "${INPUT_DIR}":"/input" -v "${OUTPUT_DIR}":"/output" google/deepvariant:'1.0.0' /opt/deepvariant/bin/run_deepvariant --model_type=PACBIO \
	--ref=${bam} --reads=${ref_fa} --output_vcf=/output/${ref_fa}".vcf.gz" --intermediate_results_dir /output/intermediate_results_dir --num_shards=4


}

deepvariant;