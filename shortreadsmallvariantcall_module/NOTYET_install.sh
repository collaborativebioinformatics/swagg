

#os_type=$1; # mac or linux
#note gatk doesn't have different installs. Only works with linux..

# gatk dependencies include: Java 8,
function download_java {
    if [[ ! -d jdk-8u261-linux-x64.tar.gz/ ]]
    then
        echo "downloading Linux x64 Compressed Archive..";
        wget https://www.oracle.com/webapps/redirect/signon?nexturl=https://download.oracle.com/otn/java/jdk/8u261-b12/a4634525489241b9a9e1aa73d9e118e6/jdk-8u261-linux-x64.tar.gz;
        tar -xzf jdk-8u261-linux-x64.tar.gz;
        rm jdk-8u261-linux-x64.tar.gz;
    fi

# "Downloading gatk Linux binaries"
function download_gatk {
    # if mac
#    if [[ ${os_type} == "mac" && ! -d gatk_4.1.9.0/ ]]
    if [[ ! -d gatk_4.1.9.0/ ]]
    then
#        echo "downloading gatk for mac";
        echo "downloading gatk..";
        git clone https://github.com/broadinstitute/gatk/archive/4.1.9.0.tar.gz;
        tar -xzf gatk_4.1.9.0.tar.gz;
        rm 4.1.9.0.tar.gz;
    fi

#    # if linux
#    if [[ ${os_type} == "linux" && ! -d SPAdes-3.14.1-Linux/ ]]
#    then
#        echo "downloading Spades for linux";
#        wget http://cab.spbu.ru/files/release3.14.1/SPAdes-3.14.1-Linux.tar.gz;
#        tar -xzf SPAdes-3.14.1-Linux.tar.gz;
#        rm SPAdes-3.14.1-Linux.tar.gz;
#    fi

}

function main {
    download_java;
    download_gatk;

    #creates conda environment
    conda env create -f gatkcondaenv.yml;

    #activates conda environment
    source activate gatk;

    #install full build gatk
    ./gradlew;
    # main script
    echo "done installing.";
}
main;
