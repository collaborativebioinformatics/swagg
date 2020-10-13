
# download and build hacky tool I made for the hackathon to look at GFA paths
function download_pg_pathcomp {
	 sudo apt-get install build-essential git protobuf-compiler libprotoc-dev libhts-dev libjansson-dev
	 git clone https://github.com/glennhickey/pg-pathcomp.git --recursive
	 cd pg-pathcomp
	 make
}

# download vg standalone linux binary
function download_vg {
	 wget https://github.com/vgteam/vg/releases/download/v1.27.1/vg
	 chmod +x ./vg
}

# download and build seqwish, which can turn pairwise alignments into pangenome graphs
function download_seqwish {
	 sudo apt install build-essential cmake zlib1g-dev
	 git clone --recursive https://github.com/ekg/seqwish.git
	 cd seqwish
	 cmake -H. -Bbuild && cmake --build build -- -j 3
}

# download and build abpoa
function download_abpoa {
	 git clone --recursive https://github.com/yangao07/abPOA.git
	 cd abPOA
	 make
}

function main {
    download_pg_pathcomp;
    download_vg;
	 download_seqwish;
	 download_abpoa

	 echo '# run the following to update your environment before running commands from README'
	 echo ''
	 echo 'export PATH=$(pwd)/pg-pathcomp/bin:$(pwd):$(pwd)/seqwish/bin:$(pwd)/abPOA/bin:$PATH'
	 echo '. pg-pathcomp/venv/activate'	 
}
main;
