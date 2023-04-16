#!/bin/bash
#SBATCH --job-name=G4_QUAST
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --ntasks-per-node=1
#SBATCH --mem=30g
#SBATCH --time=24:00:00
#SBATCH --output=/shared/Project1_Resources/Group4/OandE/%q_E.out
#SBATCH --error=/shared/Project1_Resources/Group4/OandE/%q_E.err

#Activate Conda
source $HOME/.bash_profile
conda activate /shared/Project1_Resources/Group4/QUAST

#Use quast to test the quality of all assemblies
quast \
-o /shared/Project1_Resources/Group4/Q_everything \
-r /shared/Project1_Resources/Group4/H_volcanii_everything.fasta \
/shared/Project1_Resources/Group4/P1_Assembly/P1_assembly.fasta \
/shared/Project1_Resources/Group4/S1_Assemble/S1_assembly.fasta \
/shared/Project1_Resources/Group4/HA1V2/H1_assembly.fasta \
/shared/Project1_Resources/Group4/P6_Assembly/P6_assembly.fasta \
/shared/Project1_Resources/Group4/S6_Assemble/S6_assembly.fasta \
/shared/Project1_Resources/Group4/HA6V2/H6_assembly.fasta \
/shared/Project1_Resources/Group4/P7_Assembly/P7_assembly.fasta \
/shared/Project1_Resources/Group4/S7_Assemble/S7_assembly.fasta \
/shared/Project1_Resources/Group4/HA7V2/H7_assembly.fasta
