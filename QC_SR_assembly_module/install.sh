
# "Downloading SPAdes Linux binaries"
function download_SPAdes {
	wget http://cab.spbu.ru/files/release3.14.1/SPAdes-3.14.1-Linux.tar.gz
	tar -xzf SPAdes-3.14.1-Linux.tar.gz
	cd SPAdes-3.14.1-Linux/bin/
}

function main {
    download_SPAdes;

	 echo '# run the following to update your environment'
	 echo ''
	 echo 'export PATH=$(pwd)/SPAdes-3.14.1-Linux/bin/:$PATH'
	 echo '. pg-pathcomp/venv/activate'
}
main;
