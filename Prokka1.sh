#!/bin/bash
#SBATCH --job-name=G4_Pro1
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --ntasks-per-node=1
#SBATCH --mem=30g
#SBATCH --time=24:00:00
#SBATCH --output=/shared/Project1_Resources/Group4/OandE/%Pro1.out
#SBATCH --error=/shared/Project1_Resources/Group4/OandE/%Pro1.err

#Activate Conda
source $HOME/.bash_profile
conda activate /shared/Project1_Resources/Group4/prokka

#use prokka to identify genes and regions in the genome assembly
prokka --outdir /shared/Project1_Resources/Group4/Prokka_Comparison/Prokka_Sample1/Long \
--prefix Long_S1 --genus Haloferax --species volcanii \
/shared/Project1_Resources/Group4/P1_Assembly/P1_assembly.fasta

prokka --outdir /shared/Project1_Resources/Group4/Prokka_Comparison/Prokka_Sample1/Short \
--prefix Short_S1 --genus Haloferax --species volcanii \
/shared/Project1_Resources/Group4/S1_Assemble/S1_assembly.fasta

prokka --outdir /shared/Project1_Resources/Group4/Prokka_Comparison/Prokka_Sample1/Hybrid \
--prefix Hybrid_S1 --genus Haloferax --species volcanii \
/shared/Project1_Resources/Group4/HA1V2/H1_assembly.fasta 
