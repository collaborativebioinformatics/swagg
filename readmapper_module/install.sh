
# setting up global vars
os_type=$1;

# download minimap2 - for mapping reads back to the reference
function download_minimap {
    echo "Downloading minimap2 for mapping reads to the reference";

    if [ ! -d "minimap2" ]
    then
        # for Linux
        if [[ $os_type == "linux" ]]
        then
            git clone https://github.com/lh3/minimap2;
            cd minimap2; make; cd ../;
        fi
        # for mac OS
        if [[ $os_type == "mac" ]]                                            
        then                                                                    
            conda install -c bioconda minimap2 
        fi    
    fi
}

git clone https://github.com/samtools/htslib.git

# download minimap2 - for mapping reads back to the reference                   
function download_samtools {                                                     
    echo "Downloading samtools for evaluating the mapped reads";  
           
    # Download samtools                
    if [[ ! -d "samtools" ]]                                                      
    then                                                                        
        git clone https://github.com/samtools/samtools
    fi
    # Download the tool needed for building samtools from source
    if [[ ! -d "htslib" ]]                                                      
    then                                                                        
        git clone https://github.com/samtools/htslib.git
    fi
    # build the samtools tool
    if [[ ! -f "./samtools/samtools" ]]
    then
        cd samtools; make; cd ../;
    fi
} 

# MAIN function for controlling the install script
function main {
    download_minimap;
    download_samtools;
}
main;
