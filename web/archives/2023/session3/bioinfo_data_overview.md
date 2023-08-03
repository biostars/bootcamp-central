## Bioinformatics Resources

 In part, we will acquaint you with widely-used bionformatics public data and computational tools essential for genomic analysis. It's not necessary (and you don't need to) use all of them, but you may consider this as a foundation to create your personalized tool map for future research endeavors. Additionally, some of these resources will be employed in the upcoming pipeline examples, providing practical insights into their application.

### 1. Common Bioinformatics Public Data Resources

In our research journey here, working with genomic datasets will be a frequent and essential aspect. Genomic datasets serve as foundational elements for numerous analyses and investigations. For example:

  1. Genome Annotation: references necessary for analysis
  2. Algorithm Validation: Benchmark datasets are essential for validating the accuracy and performance of new algorithms
  3. Comparative Studies: When comparing different bioinformatics tools or pipelines, benchmark datasets provide a standardized reference
  4. Reproducibility and standardization: well-curated benchmark datasets for specific computational tasks (e.g. [CAMI](https://www.microbiome-cosi.org/cami/cami/cami2), [Multiome](https://proceedings.mlr.press/v176/lance22a.html))
  5. Meta-analysis: data mining from accumulated genomic datasets


Here we list some widely used data sources:

| Database | Contents | When you might need it | Similar resources |
| ---  |   ----  | ----  |  --- |
| **Reference data** | | | |
| [Ensemble](http://useast.ensembl.org/index.html)             | Model organisms: assembly and annotation              | Analysis of human or mouse sequencing data        | [RefSeq](https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_000001405.40/) |
| [InterPro](https://www.ebi.ac.uk/interpro/)                  | Protein families                                      | Annotate amino acid sequences of unknown function |                                                              |
| [KEGG](https://www.kegg.jp/)                                 | Hierarchical gene functions                           | Functional analysis                               |                                                              |
| [GTDB](https://gtdb.ecogenomic.org/)                         | Microbiome reference genomes                          | Metagenomic analysis                              | [RefSeq](https://www.ncbi.nlm.nih.gov/genome/microbes/)      |
| [BV-BRC](https://www.bv-brc.org/)                            | Pathogen database                                     |                                                   |                                                              |
| **Genomic sequencing data**                                  |                                                       |                                                   |                                                              |
| [NCBI](https://www.ncbi.nlm.nih.gov/)                        | Almost everything                                     | Search for specific data                          | [EBI](https://www.ebi.ac.uk/), [GEO](https://www.ncbi.nlm.nih.gov/geo/), [SRA](https://www.ncbi.nlm.nih.gov/sra/) |
| [TCGA](https://www.cancer.gov/ccg/research/genome-sequencing/tcga) | Cancer genomic data                                   |                                                   |                                                              |
| [ENCODE](https://www.encodeproject.org/)                     | Functional genomic data                               |                                                   |                                                              |
| [HMP](https://hmpdacc.org/)                                  | Real microbial data                                   |                                                   |                                                              |
| [CAMI](https://www.microbiome-cosi.org/cami/cami/cami2)      | Simulated microbial data for computational challenges |                                                   |                                                              |
| [10X Genomics](https://www.10xgenomics.com/cn/resources/datasets?query=&page=1&configure%5BhitsPerPage%5D=50&configure%5BmaxValuesPerFacet%5D=1000) | Single cell                                           |                                                   |                                                              |
| **For data mining**                                          |                                                       |                                                   |                                                              |
| [Kaggle](https://www.kaggle.com/competitions/open-problems-multimodal) | Cleaned data for data science community               |                                                   |                                                              |


### 2. Bioinformatic tools  <a name="3.1.2"></a>

The majority of tools are compatible with Linux, Python, or R. However, it is not uncommon to find yourself in situations where you may need to switch between these platforms. Therefore, it is essential to remain adaptable and flexible in your approach. The initial lesson I learned in Bioinformatics, which resolves over 95% of my challenges, is simple: when in doubt, **Google it** (now you can ChatGPT it). 


| Task                  | Software                                                     | Comments                                                     |
| --------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| Comprehensive         | [Galaxy](https://usegalaxy.org/)                             | A web-based platform that provides a user-friendly interface for running bioinformatics tools and workflows. |
| Sequence search       | [BLAST](https://blast.ncbi.nlm.nih.gov/Blast.cgi)            |                                                              |
| Aligner               | [BWA](https://janis.readthedocs.io/en/latest/tools/bioinformatics/bwa/bwamem.html), [Bowtie2](https://bowtie-bio.sourceforge.net/bowtie2/index.shtml), [STAR](https://physiology.med.cornell.edu/faculty/skrabanek/lab/angsd/lecture_notes/STARmanual.pdf), [Minimap2](https://lh3.github.io/minimap2/minimap2.html) |                                                              |
| Trim adapter          | Cutadapt, Trimmomatic                                        |                                                              |
| Sequence analysis     | FastQC, Samtools, Bedtools, Picard                           |                                                              |
| Genome analysis       | GATK, IGV                                                    |                                                              |
| NCBI interaction      | SRA-Toolkit, NCBI Entrez Utilities, NCBI Datasets            | A set of tools for accessing and retrieving biological data from the NCBI databases. |
| Genome browser        | [UCSC genome browser](https://genome.ucsc.edu/), [WashU Epigenome Browser](http://epigenomegateway.wustl.edu/browser/) | Visualize your data with genome annotations                  |
| Differential analysis | DESeq2, EdgeR                                                |                                                              |
| Enrichment analysis   | [GO enrichment analysis](http://geneontology.org/docs/go-enrichment-analysis/), [DAVID](https://david.ncifcrf.gov/) |                                                              |
| Metagenomics          | Sourmash, Kraken, QIIME                                      |                                                              |


#### Example of some useful tools

Help resources:

1. Package: Conda, R Bioconductor, Github
2. Forum: Biostars
3. Coding: Stack Overflow, ChatGPT, etc.



Examples in daily work:

1. [GNU parallel](https://www.biostars.org/p/63816/): process data in parallel
2. Awk + seed: file manipulation
3. Bedtools: check overlap between 2 ATAC-seq peak files
