# Bioinformatics Group Project 1: Genome Assembly
# Group4(Team member:Zeynep Durak, Jordan Tang, Xiuzhiping Quan)
## This repository was created and edited by Xiuzhiping Quan
##  1.Description
- All scripts are written in miniconda environment using Git bash and submitted to run on HPC.
- The whole project is mainly divided into three parts: **acquiring data, assembling data, testing assembly quality, annotating assembly, comparing experimental sample and wild-type sample genome, and further analysis**.
- All the specific processes of the project will be shown in the method section below **（Include the ‘tools’ and their versions used in each step)**.
##  2.Prepare the environment for related tools

- Our group created separate environments for each tool.
like this example：
conda create  --prefix /shared/Project1_Resources/Group4 prokka

conda activate shared/Project1_Resources/Group4/prokka

conda install -c bioconda prokka
## 3.Methods
 **3.1 Organization data**

- Scripts used: 
>Integrate_data.sh
- Use the **"cat" command** to transfer the data files required by the project from the shared folder to the team's project folder. 

**3.2 Assemble different kinds of datasets**
- Scripts used: 
>Longread_Assembly.sh 
>Shortread_Assembly.sh
>Hybrid_1_Assembly.sh
>Hybrid_6_Assembly.sh
>Hybrid_7_Assembly.sh
- We chose unicycler to **assemble short-read data files(Unicycler v0.4.8)**, **long-read data files(Unicycler v0.4.8)**, and **hybrid data files(Unicycler v0.5.0)** respectively. Due to the limitations of the HPC computing unit, we use a later version of the unicycler(faster performance and better memory efficiency) to assemble the hybrid.

**3.3 Visualize assembled files**

- We downloaded each assembled assembly (.gfa file) from the HPC to the local disk of the laptop, and then used ‘Bandage.exe’ to visualize them separately and save the picture.

**3.4 Test the quality of assembled files**
- Scripts used: 
>Quast_everything.sh
- To check the quality of the assemblies we assembled we used the **'quast' tool(QUAST v5.0.2)**. Create a local area network through the 'python -m http.server' command, and then view the quality report generated by the 'quast' tool on the website.

**3.5 Annotate the gene file**
- Scripts used: 
>Prokka1.sh
>Prokka6.sh
>Prokka7.sh
- We utilize the **'prokka' tool(prokka 1.14.6)** to identify genes and regions in the genome assembly. In this way, we can identify the gene name corresponding to the abnormal fragment in the next step of comparison.

**3.6 Generate files required for gene alignment**
- Scripts used: 
>Blast_Hybrid.sh
- A custom sequence database was created by reading the .fasta-format sequence files of hybrid assembly 1 using the **'makeblastdb' command in the 'blast' tool(blast 2.13.0)**. The purpose of this is to compare hybrid datasets 6 and 7 with this database.

**3.7 Compare to find abnormal genes**

- We used the **'act.jar' software** to visualize the alignment results of the two by utilizing the alignment files obtained in the previous step and the .fasta format sequence files of hybrid assemblies 1 and 6. Set an appropriate score cutoff(20000) to exclude invalid contrast abnormal bands. Then mark the end position of the previous segment and the start position of the next segment one by one to find the position with a larger gap.

- And then Use the **'artemis.jar' software** to check whether there are complete gene fragments on all the gap fragments found in the previous step on hybrid assembly 1 and 6, and record the name of the missing gene fragment.

- Finally, the complete sequence of the missing gene fragment was found in the .faa format files of hybrid assemblies 1 and 6.  The same process was used to analyze the difference between hybrid assemblies 1 and 7.

**3.8 Further analysis**

Use the full sequence to obtain more information (such as description, scientific name, etc.) of the differential gene through the BLAST  website(https://blast.ncbi.nlm.nih.gov). Then, further analysis of the differential genes was carried out by consulting the literature.
