#!/bin/bash
#SBATCH --job-name=Group4_ShortAssembly
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --ntasks-per-node=1
#SBATCH --mem=15g
#SBATCH --time=24:00:00
#SBATCH --output=/shared/home/alyxq8/OandE/G4_Ass_Long.out
#SBATCH --error=/shared/home/alyxq8/OandE/G4_Ass_Short.err

#Activate Conda
source $HOME/.bash_profile
conda activate /shared/Project1_Resources/Group4/unicycler

#Assemble short read data using unicycler
unicycler \
-1 /shared/Project1_Resources/Group4/Shortreads/R1S1merged.fastq.gz \
-2 /shared/Project1_Resources/Group4/Shortreads/R2S1merged.fastq.gz \
-o S1_Assemble

unicycler \
-1 /shared/Project1_Resources/Group4/Shortreads/R1S6merged.fastq.gz \
-2 /shared/Project1_Resources/Group4/Shortreads/R2S6merged.fastq.gz \
-o S6_Assemble

unicycler \
-1 /shared/Project1_Resources/Group4/Shortreads/R1S7merged.fastq.gz \
-2 /shared/Project1_Resources/Group4/Shortreads/R2S7merged.fastq.gz \
-o S7_Assemble
