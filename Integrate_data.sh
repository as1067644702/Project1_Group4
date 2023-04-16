#!/bin/bash
#SBATCH --job-name=G4_Integrate_data
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=1g
#SBATCH --time=05:00:00
#SBATCH --output=/shared/Project1_Resources/Group4/OandE/%G4_Integrate.out
#SBATCH --error=/shared/Project1_Resources/Group4/OandE/%G4_Integrate.err

# These steps are required to activate Conda
source $HOME/.bash_profile


# copy and paste Longread data sets ınto our group (Pass)
cat /shared/Project1_Resources/source_data/ds989matt/ds989/DS989_1_M1/20211124_1546_X3_FAQ09231_45399ec3/fastq_pass/barcode06/*.fastq.gz > /shared/Project1_Resources/Group4/Longreads/P6merged.fastq.gz
cat /shared/Project1_Resources/source_data/ds989matt/ds989/DS989_1_M1/20211124_1546_X3_FAQ09231_45399ec3/fastq_pass/barcode01/*.fastq.gz > /shared/Project1_Resources/Group4/Longreads/P1merged.fastq.gz
cat /shared/Project1_Resources/source_data/ds989matt/ds989/DS989_1_M1/20211124_1546_X3_FAQ09231_45399ec3/fastq_pass/barcode07/*.fastq.gz > /shared/Project1_Resources/Group4/Longreads/P7merged.fastq.gz

# copy and paste Longread data sets into our group (Faıl)
cat /shared/Project1_Resources/source_data/ds989matt/ds989/DS989_1_M1/20211124_1546_X3_FAQ09231_45399ec3/fastq_fail/barcode06/*.fastq.gz > /shared/Project1_Resources/Group4/Longreads/F6merged.fastq.gz
cat /shared/Project1_Resources/source_data/ds989matt/ds989/DS989_1_M1/20211124_1546_X3_FAQ09231_45399ec3/fastq_fail/barcode01/*.fastq.gz > /shared/Project1_Resources/Group4/Longreads/F1merged.fastq.gz
cat /shared/Project1_Resources/source_data/ds989matt/ds989/DS989_1_M1/20211124_1546_X3_FAQ09231_45399ec3/fastq_fail/barcode07/*.fastq.gz > /shared/Project1_Resources/Group4/Longreads/F7merged.fastq.gz

# copy and paste Shortread data sets into our group
cat /shared/Project1_Resources/source_data/ds989matt/20211022_045448/Fastq/*_S1_L00*_R1*_*.fastq.gz > /shared/Project1_Resources/Group4/Shortreads/R1S1merged.fastq.gz
cat /shared/Project1_Resources/source_data/ds989matt/20211022_045448/Fastq/*_S6_L00*_R1*_*.fastq.gz > /shared/Project1_Resources/Group4/Shortreads/R1S6merged.fastq.gz
cat /shared/Project1_Resources/source_data/ds989matt/20211022_045448/Fastq/*_S7_L00*_R1*_*.fastq.gz > /shared/Project1_Resources/Group4/Shortreads/R1S7merged.fastq.gz

cat /shared/Project1_Resources/source_data/ds989matt/20211022_045448/Fastq/*_S1_L00*_R2*_*.fastq.gz > /shared/Project1_Resources/Group4/Shortreads/R2S1merged.fastq.gz
cat /shared/Project1_Resources/source_data/ds989matt/20211022_045448/Fastq/*_S6_L00*_R2*_*.fastq.gz > /shared/Project1_Resources/Group4/Shortreads/R2S6merged.fastq.gz
cat /shared/Project1_Resources/source_data/ds989matt/20211022_045448/Fastq/*_S7_L00*_R2*_*.fastq.gz > /shared/Project1_Resources/Group4/Shortreads/R2S7merged.fastq.gz
