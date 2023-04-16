#!/bin/bash
#SBATCH --job-name=G4_Pro6
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --ntasks-per-node=1
#SBATCH --mem=30g
#SBATCH --time=24:00:00
#SBATCH --output=/shared/Project1_Resources/Group4/OandE/%Pro6.out
#SBATCH --error=/shared/Project1_Resources/Group4/OandE/%Pro6.out

#Activate Conda
source $HOME/.bash_profile
conda activate /shared/Project1_Resources/Group4/prokka

#use prokka to identify genes and regions in the genome assembly
prokka --outdir /shared/Project1_Resources/Group4/Prokka_Comparison/Prokka_Sample6/Long \
--prefix Long_S6 --genus Haloferax --species volcanii \
/shared/Project1_Resources/Group4/P6_Assembly/P6_assembly.fasta

prokka --outdir /shared/Project1_Resources/Group4/Prokka_Comparison/Prokka_Sample6/Short \
--prefix Short_S6 --genus Haloferax --species volcanii \
/shared/Project1_Resources/Group4/S6_Assemble/S6_assembly.fasta

prokka --outdir /shared/Project1_Resources/Group4/Prokka_Comparison/Prokka_Sample6/Hybrid \
--prefix Hybrid_S6 --genus Haloferax --species volcanii \
/shared/Project1_Resources/Group4/HA6V2/H6_assembly.fasta
