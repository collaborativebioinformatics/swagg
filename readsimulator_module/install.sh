

function download_art {
    echo "Downloading ART for short read simulation..";
    #wget https://www.niehs.nih.gov/research/resources/assets/docs/artbinmountrainier2016.06.05linux64.tgz
    #artbinmountrainier2016.06.05linux64.tgz;
    wget https://www.niehs.nih.gov/research/resources/assets/docs/artbinmountrainier2016.06.05macos64.tgz;
    tar -zxvf artbinmountrainier2016.06.05macos64.tgz;
}

function download_nanosim {
    echo "Downloading NanoSim for Nanopore read simulation..";
    git clone https://github.com/bcgsc/NanoSim.git;
}

function download_pass {                                                     
    echo "Downloading PaSS for PacBio read simulation..";                  
    wget http://cgm.sjtu.edu.cn/PaSS/src/PaSS.tar.gz;
    tar -zxvf PaSS.tar.gz;
} 

function create_directory_structure {                                                     
    echo "Creating the correct directory structure..";                  
} 


function main {
    download_art;
    download_nanosim;
    download_pass;
    create_directory_structure;
}
main;
