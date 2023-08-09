## Bioinformatics Resources
\
 In part, we will acquaint you with widely-used bionformatics public data and computational tools essential for genomic analysis. It's not necessary (and you don't need to) use all of them, but you may consider this as a foundation to create your personalized tool map for future research endeavors. Additionally, some of these resources will be employed in the upcoming pipeline examples, providing practical insights into their application.

### 1. Common Bioinformatics Public Data Resources

In our research journey here, working with genomic datasets will be a frequent and essential aspect. Genomic datasets serve as foundational elements for numerous analyses and investigations. For example:

  1. Genome Annotation: references necessary for analysis
  2. Algorithm Validation: Benchmark datasets are essential for validating the accuracy and performance of new algorithms
  3. Comparative Studies: When comparing different bioinformatics tools or pipelines, benchmark datasets provide a standardized reference
  4. Reproducibility and standardization: well-curated benchmark datasets for specific computational tasks (e.g. <a href="https://www.microbiome-cosi.org/cami/cami/cami2" target="_blank">CAMI</a>, <a href="https://proceedings.mlr.press/v176/lance22a.html" target="_blank">Multiome</a>)
  5. Meta-analysis: data mining from accumulated genomic datasets

Here we list some widely used data sources:

| Database | Contents | When you might need it | Similar resources |
| ---  |   ----  | ----  |  --- |
| **Reference data** | | | |
| <a href="http://useast.ensembl.org/index.html" target="_blank">Ensemble</a>             | Model organisms: assembly and annotation              | Analysis of human or mouse sequencing data        | <a href="https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_000001405.40/" target="_blank">RefSeq</a> |
| <a href="https://www.ebi.ac.uk/interpro/" target="_blank">InterPro</a>                | Protein families                                      | Annotate amino acid sequences of unknown function |                                                              |
| <a href="https://www.kegg.jp/" target="_blank">KEGG</a>                                | Hierarchical gene functions                           | Functional analysis                               |                                                              |
| <a href="https://gtdb.ecogenomic.org/" target="_blank">GTDB</a>                         | Microbiome reference genomes                          | Metagenomic analysis                              | <a href="https://www.ncbi.nlm.nih.gov/genome/microbes/" target="_blank">RefSeq</a>     |
| <a href="https://www.bv-brc.org/" target="_blank">BV-BRC</a>                           | Pathogen database                                     |                                                   |                                                              |
| **Genomic sequencing data**                                  |                                                       |                                                   |                                                              |
| <a href="https://www.ncbi.nlm.nih.gov/" target="_blank">NCBI</a>                       | Almost everything                                     | Search for specific data                          | <a href="https://www.ebi.ac.uk/" target="_blank">EBI</a>, <a href="https://www.ncbi.nlm.nih.gov/geo/" target="_blank">GEO</a>, <a href="https://www.ncbi.nlm.nih.gov/sra/" target="_blank">SRA</a> |
| <a href="https://www.cancer.gov/ccg/research/genome-sequencing/tcga" target="_blank">TCGA</a> | Cancer genomic data                                   |                                                   |                                                              |
| <a href="https://www.encodeproject.org/" target="_blank">ENCODE</a>                    | Functional genomic data                               |                                                   |                                                              |
| <a href="https://hmpdacc.org/" target="_blank">HMP</a>                                 | Real microbial data                                   |                                                   |                                                              |
| <a href="https://www.microbiome-cosi.org/cami/cami/cami2" target="_blank">CAMI</a>      | Simulated microbial data for computational challenges |                                                   |                                                              |
| <a href="https://www.10xgenomics.com/cn/resources/datasets?query=&page=1&configure%5BhitsPerPage%5D=50&configure%5BmaxValuesPerFacet%5D=1000" target="_blank">10X Genomics</a> | Single cell                                           |                                                   |                                                              |
| **For data mining**                                          |                                                       |                                                   |                                                              |
| <a href="https://www.kaggle.com/competitions/open-problems-multimodal" target="_blank">Kaggle</a> | Cleaned data for data science community               |                                                   |                                                              |


</br>

### 2. Bioinformatic tools  <a name="3.1.2"></a>

The majority of tools are compatible with Linux, Python, or R. However, it is not uncommon to find yourself in situations where you may need to switch between these platforms. Therefore, it is essential to remain adaptable and flexible in your approach. The initial lesson I learned in Bioinformatics, which resolves over 95% of my challenges, is simple: when in doubt, **Google it** (now you can ChatGPT it). 


| Task                  | Software                                                     | Comments                                                     |
| --------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| Comprehensive         | <a href="https://usegalaxy.org/" target="_blank">Galaxy</a>                            | A web-based platform that provides a user-friendly interface for running bioinformatics tools and workflows. |
| Sequence search       | <a href="https://blast.ncbi.nlm.nih.gov/Blast.cgi" target="_blank">BLAST</a>            |                                                              |
| Aligner               | <a href="https://janis.readthedocs.io/en/latest/tools/bioinformatics/bwa/bwamem.html" target="_blank">BWA</a>, <a href="https://bowtie-bio.sourceforge.net/bowtie2/index.shtml" target="_blank">Bowtie2</a>, <a href="https://physiology.med.cornell.edu/faculty/skrabanek/lab/angsd/lecture_notes/STARmanual.pdf" target="_blank">STAR</a>, <a href="https://lh3.github.io/minimap2/minimap2.html" target="_blank">Minimap2</a> |                                                              |
| Trim adapter          | Cutadapt, Trimmomatic                                        |                                                              |
| Sequence analysis     | FastQC, Samtools, Bedtools, Picard                           |                                                              |
| Genome analysis       | GATK, IGV                                                    |                                                              |
| NCBI interaction      | SRA-Toolkit, NCBI Entrez Utilities, NCBI Datasets            | A set of tools for accessing and retrieving biological data from the NCBI databases. |
| Genome browser        | <a href="https://genome.ucsc.edu/" target="_blank">UCSC genome browser</a>, <a href="http://epigenomegateway.wustl.edu/browser/" target="_blank">WashU Epigenome Browser</a> | Visualize your data with genome annotations                  |
| Differential analysis | DESeq2, EdgeR                                                |                                                              |
| Enrichment analysis   | <a href="http://geneontology.org/docs/go-enrichment-analysis/" target="_blank">GO enrichment analysis</a>, <a href="https://david.ncifcrf.gov/" target="_blank">DAVID</a> |                                                              |
| Metagenomics          | Sourmash, Kraken, QIIME                                      |                                                              |

</br>

### 3. Examples of some useful tools

#### Help resources:

1. Package: Conda, R Bioconductor, Github
2. Forum: Biostars
3. Coding: Stack Overflow, ChatGPT, etc.


</br>

#### <a href="https://www.biostars.org/p/63816/" target="_blank">GNU parallel</a>: process data in parallel
1. Why do you need it: efficiency
   1. when you have tons of fastq files to process
   2. when you have tons of repetitive tasks
2. How-to:
   1. install by conda
   2. usage: help documents or check the examples in the link
</br>

```
conda activate bootcamp
# conda install -y -c conda-forge parallel

mkdir -p test_parallel
cd test_parallel



######## example1: when you have tons of scripts
for i in {1..100}; do
 echo -e "sleep 1\necho done script ${i}" > temp_script_${i}.sh
done

# a usual way if I want to run all of them
for script in $(ls *.sh); do
 echo "Processing ${script} now"
 bash ${script}
done

# you can press Ctrl+C to terminate the process
# it can be crazy when a script is long, such as seq alignment

# a parallel way 
ls *.sh | parallel -j 10 bash {}

# clean folder
rm *.sh



######## example2: when you need to process tons of files
for i in {1..100}; do
 echo "This is file ${i}" > temp_file_${i}.txt
done

# let's define some function
process_some_file ()
{
 input_file=$1
 some_other_parameter=$2
 
 # whatever functions you like
 sleep 1
 echo "We have a second parameter ${some_other_parameter}"
 cat ${input_file}
}

export -f process_some_file

# now let's run it in parallel
ls temp*txt | parallel -j 10 process_some_file {} 100

# clean dir
rm temp*txt



######## example3: when you want to use same file but loop through tons of parameters
loop_parameters ()
{
 input_file=$1
 para1=$2
 para2=$3
 para3=$4
 
 # whatever functions you like
 sleep 1
 echo "Running command for ${input_file} with para1 ${para1}, para2 ${para2}, para3 ${para3}"
}

export -f loop_parameters

touch assume_im_test_file.fastq
# ::: is used to separate the command from the argument list.
# check here: parallel -h
parallel -j 10 loop_parameters assume_im_test_file.fastq {1} {2} {3} ::: {1..10} ::: M F ::: {1..22} 

# sometimes your parameters are complex
echo -e "a1\nb1\nc1\nd1" > para1_list.txt
echo -e "a2\nb2\nc2\nd2\ne2" > para2_list.txt
echo -e "a3\nb3\nc3\nd3\ne3\nf3" > para3_list.txt

# solution1: 
parallel -j 10 loop_parameters assume_im_test_file.fastq {1} {2} {3} ::: $(cat para1_list.txt) ::: $(cat para2_list.txt) ::: $(cat para3_list.txt)

# solution 2: merge everything together first
while IFS= read -r line1; do
    while IFS= read -r line2; do
        while IFS= read -r line3; do
            echo "$line1 $line2 $line3" >> merged_parameters.txt
        done < para1_list.txt
    done < para2_list.txt
done < para3_list.txt

cat merged_parameters.txt | parallel --colsep " " -j 10 loop_parameters assume_im_test_file.fastq {1} {2} {3}

# clean folder
rm *txt assume_im_test_file.fastq
```

</br>

#### Get fluent with Shell script
As bioinformaticians, we consistently handle complex datasets. Ensuring these datasets are cleaned according to our requirements is a challenging task that requires careful attention.

```
######## Example 4: partition fasta file of KEGG KOs
echo ">aaa:Acav_0001|dnaA; chromosomal replication initiator protein|K02313
MTEEPSRSPDFDT
>aaa:Acav_0002|dnaN; DNA polymerase III subunit beta [EC:2.7.7.7]|K02338
MIVLKATQDKVL
>aaa:Acav_0003|gyrB; DNA gyrase subunit B [EC:5.6.2.2]|K02470
MTAENTLPEPTLP
>aaa:Acav_0005|hsdM; type I restriction enzyme M protein [EC:2.1.1.72]|K03427
MLDAQQQYAIRSAL
>aaa:Acav_0007|hsdM; type I restriction enzyme M protein [EC:2.1.1.72]|K03427
MSLTLDTLESWLWE
>aaa:Acav_0008|hsdS; type I restriction enzyme, S subunit [EC:3.1.21.3]|K02470
MKSMGTAEQVTPKA
>aaa:Acav_0014|TROVE2, SSA2; 60 kDa SS-A/Ro ribonucleoprotein|K02338
MVNTQLFQTLKAR
>aac:Aaci_2089|hemE, UROD; uroporphyrinogen decarboxylase [EC:4.1.1.37]|K02313
MRNGDFAVNNRFLR"  > pseudo_ko_seq.faa

# if we need a collection of all KOs
grep '>' pseudo_ko_seq.faa | rev | cut -d'|' -f1 | rev | sort -u 

# grep '>': get all lines start with ">"
# rev: reverse line back to front
# cut -d'|' -f1: pick the 1st field
# rev: reverse back to normal order
# sort -u: deduplicate

# if we want group sequences by every single KO
grep '>' pseudo_ko_seq.faa | rev | cut -d'|' -f1 | rev | sort -u  > pseudo_ko_list.txt

for ko in $(cat pseudo_ko_list.txt); do
 echo ${ko}
 grep -A 1 --no-group-separator -Fw ${ko} pseudo_ko_seq.faa
 echo " "
done

# Question: can we do parallel?
cat pseudo_ko_list.txt | parallel -j 4 'ko={}; grep -A 1 --no-group-separator -Fw ${ko} pseudo_ko_seq.faa > pseudo_out_${ko}.txt'

# clean dir
rm pseudo_*
```

</br>

Gradually get fimilar with them, and then enjoy playing with them.
| Tools      | Function                              |
| ---------- | ------------------------------------- |
| awk, sed   | text manipulation and extraction      |
| grep       | search in file                        |
| cut        | select section/field                  |
| sort       | sort                                  |
| find       | search in dir                         |
| uniq       | dedup                                 |
| echo       | print                                 |
| xargs      | command after stdout                  |
| head, tail | show begin/end of file                |
| tr         | translate character (often delimiter) |
| wget, curl | download                              |
| pwd, cd    | dir operation                         |
