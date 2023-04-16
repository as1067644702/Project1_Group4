#!/bin/bash
#SBATCH --job-name=G4_H7V2
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --ntasks-per-node=1
#SBATCH --mem=30g
#SBATCH --time=48:00:00
#SBATCH --output=/shared/Project1_Resources/Group4/OandE/%H7V2.out
#SBATCH --error=/shared/Project1_Resources/Group4/OandE/%H7V2.err

#Activate Conda
source $HOME/.bash_profile
conda activate /shared/Project1_Resources/Group4/unicyclerV2

#Assembling hybrid 7 using unicycler
unicycler --kmers 21,33,55 -t 8 \
-1 /shared/Project1_Resources/Group4/Shortreads/R1S7merged.fastq.gz \
-2 /shared/Project1_Resources/Group4/Shortreads/R2S7merged.fastq.gz \
-l /shared/Project1_Resources/Group4/Longreads/P7merged.fastq.gz \
-o /shared/Project1_Resources/Group4/HA7V2
