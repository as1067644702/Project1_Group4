#!/bin/bash
#SBATCH --job-name=Group4_LongAssembly
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

#Assemble Long read data using unicycler
unicycler -l /shared/Project1_Resources/Group4/Longreads/P1merged.fastq.gz -o P1_Assembly
unicycler -l /shared/Project1_Resources/Group4/Longreads/P6merged.fastq.gz -o P6_Assembly
unicycler -l /shared/Project1_Resources/Group4/Longreads/P7merged.fastq.gz -o P7_Assembly
