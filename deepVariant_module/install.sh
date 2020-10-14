# download dockerized deepVariant version 1.0

function download_deepvariant {

	BIN_VERSION="1.0.0"
	sudo docker pull google/deepvariant:"${BIN_VERSION}"
}

funcion main {
	
	download_deepvariant;

	echo 'module is ready to call variants from long-read PacBio / ONT reads'

}
main;
