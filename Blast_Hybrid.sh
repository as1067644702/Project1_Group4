#!/bin/bash
#SBATCH --job-name=G4_Blast 
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --ntasks-per-node=1
#SBATCH --mem=30g
#SBATCH --time=24:00:00
#SBATCH --output=/shared/Project1_Resources/Group4/OandE/%G4_Blast.out
#SBATCH --error=/shared/Project1_Resources/Group4/OandE/%G4_Blast.err

#Activate Conda
source $HOME/.bash_profile
conda activate /shared/Project1_Resources/Group4/blast

# Hybrid fasta file
hybrid_fasta_1=/shared/Project1_Resources/Group4/HA1V2/H1_assembly.fasta

#Format blast database
makeblastdb -in $hybrid_fasta_1 -dbtype nucl -out reference_fasta_genome_db

# Perform a blastn search between the reference and hybrid fastas

blastn \
-query /shared/Project1_Resources/Group4/HA6V2/H6_assembly.fasta \
-db reference_fasta_genome_db  \
-out /shared/Project1_Resources/Group4/blast1_6_out.txt -outfmt 6

blastn \
-query /shared/Project1_Resources/Group4/HA7V2/H7_assembly.fasta \
-db reference_fasta_genome_db  \
-out /shared/Project1_Resources/Group4/blast1_7_out.txt -outfmt 6
