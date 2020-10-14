

os_type=$1; # mac or linux

# "Downloading SPAdes Linux binaries"
function download_SPAdes {
    # if mac
    if [[ ${os_type} == "mac" && ! -d SPAdes-3.14.1-Darwin/ ]]
    then
        echo "downloading SPAdes for mac";
        wget http://cab.spbu.ru/files/release3.14.1/SPAdes-3.14.1-Darwin.tar.gz;
        tar -xzf SPAdes-3.14.1-Darwin.tar.gz;
        rm SPAdes-3.14.1-Darwin.tar.gz;
    fi
    # if linux
    if [[ ${os_type} == "linux" && ! -d SPAdes-3.14.1-Linux/ ]]
    then
        echo "downloading Spades for linux";
        wget http://cab.spbu.ru/files/release3.14.1/SPAdes-3.14.1-Linux.tar.gz;
        tar -xzf SPAdes-3.14.1-Linux.tar.gz;
        rm SPAdes-3.14.1-Linux.tar.gz;
    fi
}

# main script
function main {
    download_SPAdes;
    echo "done installing..";
}
main;
