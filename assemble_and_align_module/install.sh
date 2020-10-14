# download and build wtdbg2 for super-fast assembling of fasta sequences
function download_wtdbg2 {
         git clone https://github.com/ruanjue/wtdbg2
         cd wtdbg2
         make
}

function main {
    download_wtdbg2;

    echo '# run the following to update your environment'
    echo ''
    echo 'export PATH=$(pwd)/wtdbg2:$PATH'
}
main;
