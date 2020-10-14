import os
import sys
from Bio import SeqIO



if len(sys.argv) < 2:
    print("You need to give the gene bank file as input to separate the proteins")
    sys.exit()

# don't want to spend time doing a proper argparser
gene_bank_file = sys.argv[1]

if not os.path.exists(gene_bank_file):
    print("The gene bank file {} does not exist".format(gene_bank_file))
    sys.exit()


proteins = dict()
for rec in SeqIO.parse(gene_bank_file, "genbank"):
    for f in rec.features:
        # yes, this is bad, I know, but it works for VAPiD output
        try:
            strain = f.qualifiers["strain"][0]
        except:
            pass

        try:
            proteins[f.qualifiers["product"][0]] = f.qualifiers["translation"][0]
        except:
            pass

for key, value in proteins.items():
    out_file = open(key, "a")
    if not strain:
        strain = gene_bank_file.split(".")[0]
    out_file.write(">" + strain + "\n")
    out_file.write(value + "\n")
    out_file.close()
