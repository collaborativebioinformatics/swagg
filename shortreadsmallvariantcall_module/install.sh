

os_type=$1; # mac or linux

# "Downloading lofreq binaries"
function download_lofreq {
    # if mac
    if [[ ${os_type} == "mac" && ! -d lofreq_star-2.1.0/ ]]
    then
        echo "downloading lofreq for mac";
        git clone https://github.com/CSB5/lofreq;
        tar -zxf lofreq/dist/lofreq_star-2.1.0_macosx.tgz;
        rm -rf lofreq/;
    fi

    # if linux
    if [[ ${os_type} == "linux" && ! -d lofreq_star-2.1.4_linux-x86-64/ ]]
    then
        echo "downloading LoFreq for Linux";
        git clone https://github.com/CSB5/lofreq;
        tar -zxf lofreq/dist/lofreq_star-2.1.4_linux-x86-64.tgz;
        rm -rf lofreq/;
    fi

}

function main {
    # downloading lofreq
    download_lofreq;
    # main script
    echo "done installing.";
}
main;
