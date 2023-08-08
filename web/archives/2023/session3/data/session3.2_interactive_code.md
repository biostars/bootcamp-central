## ATAC-seq analysis workflow

This example is based on the example from Galaxy training (ref 1 below) with some modifications.  



### Reference:

1. [Example from Galaxy training](https://training.galaxyproject.org/training-material/topics/epigenetics/tutorials/atac-seq/tutorial.html#filtering-mapped-reads)
2. [Shaopeng's ATAC-seq pipeline](https://github.com/Zhang-lab/ATAC-seq_QC_analysis/blob/master/pipe_code/ATAC_IAP_v1.1.sh)
3. [Conda env file](https://github.com/biostars/bootcamp-central/blob/master/web/archives/2023/setup/bootcamp.yaml)



### Interactive pipeline

#### Env setup

```
# go to your working dir
# cd /storage/work/<your user account>
mkdir -p interactive_session3.2
cd interactive_session3.2

# PWD is a default environmental variable that points to the current location, you may also use command 'pwd' to get the dir
work_dir=$PWD   
# activate conda and load other tools
conda activate bootcamp  
```



#### 1. download samples

```
# step1: download samples
mkdir -p data
cd data
# use wget to download files
# note: the peak file is hg38: https://www.encodeproject.org/files/ENCFF933NTR/
wget https://zenodo.org/record/3862793/files/ENCFF933NTR.bed.gz
wget https://zenodo.org/record/3862793/files/SRR891268_chr22_enriched_R1.fastq.gz
wget https://zenodo.org/record/3862793/files/SRR891268_chr22_enriched_R2.fastq.gz
# we store paths in a variable for future usage:
r1=$(realpath SRR891268_chr22_enriched_R1.fastq.gz)
r2=$(realpath SRR891268_chr22_enriched_R2.fastq.gz)
ctcf_region=$(realpath ENCFF933NTR.bed.gz)

# chr22 genes can be obtained here: https://genome.ucsc.edu/cgi-bin/hgTables
# I already cleaned them: can be downloaded from 
wget https://raw.githubusercontent.com/biostars/bootcamp-central/master/web/archives/2023/session3/data/chr22_genes.bed

# intersect of CTCF peak and chr22 genes
less $ctcf_region | grep chr22 | intersectBed -a - -b chr22_genes.bed -wa -u > intergenic_CTCF_peaks_chr22.bed

chr22_genes=$(realpath chr22_genes.bed)
ctcf_chr22=$(realpath intergenic_CTCF_peaks_chr22.bed)
```



#### 2. trim data and get quality

```
# step2: trim reads and seq quality
cd ${work_dir}
mkdir -p trim_and_fastqc
cd trim_and_fastqc

# adapter for ATAC-seq is known, why?
adapter_1=CTGTCTCTTATACACATCTCCGAGCCCACGAGAC
adapter_2=CTGTCTCTTATACACATCTGACGCTGCCGACGA
cutadapt -a $adapter_1  -A $adapter_2  --quality-cutoff=15,10 --minimum-length=20 -o trimmed_r1.fastq -p trimmed_r2.fastq ${r1} ${r2}  > output_cutadapt_PE_trimlog.txt

# check reads quality, note the * here for wild match.
# we may download the html files first to show some screenshots
fastqc trimmed_*.fastq -o .
trimed_r1=$(realpath trimmed_r1.fastq)
trimed_r2=$(realpath trimmed_r2.fastq)
```





#### 3. alignment and peak call

```
# step3: alignment and peak call
cd ${work_dir}
mkdir -p alignment_peak
cd alignment_peak

# download chr22 and build index:
# thanks to UCSC: https://hgdownload.soe.ucsc.edu/goldenPath/hg38/chromosomes/
wget https://hgdownload.soe.ucsc.edu/goldenPath/hg38/chromosomes/chr22.fa.gz
gunzip chr22.fa.gz
bwa index -p index_chr22 chr22.fa
bwa mem index_chr22 ${trimed_r1} ${trimed_r2} | samtools view -bS - | samtools sort - -O 'bam' -o aligned_sorted.bam -T temp_aln

# check the reads status, why the number differ a lot with the Galaxy example? (hint: chr22 enrichmed fastq)
samtools flagstat aligned_sorted.bam

# filter reads: low quality, dup, chrM (not here as we only use chr22 ref)
# q 20 for quality filter: what does 20 mean?
# f 2 is flag for unpaired reads
samtools view -b -q 30 -f 2 -o filtered_sorted.bam aligned_sorted.bam

# check the status now
samtools flagstat filtered_sorted.bam

# dedup
samtools rmdup filtered_sorted.bam dedup_filtered.bam
samtools flagstat dedup_filtered.bam

# get fragment size dist. (why we are interested in this?)
picard CollectInsertSizeMetrics I=dedup_filtered.bam O=insert_size_metrics.txt H=insert_size_histogram.pdf



### now we can call ATAC peaks (do we need bedpe, why?)
bedtools bamtobed -i dedup_filtered.bam > output.bed
# macs2
macs2 callpeak -t output.bed -g hs -q 0.01 --nomodel --shift 100 --extsize 200 --keep-dup 1000 -n macs2_out -B
bdg_file=$(realpath macs2_out_treat_pileup.bdg)
```





#### 4. visualization

```
# step4: visualization
cd ${work_dir}
mkdir -p visualization
cd visualization

# get bigwig
wget https://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64.v369/bedGraphToBigWig
chmod +x bedGraphToBigWig
wget https://hgdownload.cse.ucsc.edu/goldenpath/hg38/bigZips/hg38.chrom.sizes
./bedGraphToBigWig ${bdg_file}  hg38.chrom.sizes macs2_out_treat.bw


# generate heatmap for macs2 peaks
## computeMatrix can't correctly recognize the header, so need to remove it
sed '1d' ${chr22_genes} > temp_bed_region.bed
computeMatrix reference-point -S macs2_out_treat.bw -R temp_bed_region.bed -o heatmap_matrix.gz
# plot heatmap
plotHeatmap -m heatmap_matrix.gz -o heatmap_macs2_peak_on_chr22_genes.png


# generate heatmap for ctcf peaks

computeMatrix reference-point -S macs2_out_treat.bw -R ${ctcf_chr22} -o ctcf_heatmap_matrix.gz
plotHeatmap -m ctcf_heatmap_matrix.gz -o heatmap_macs2_peak_on_ctcf_peaks.png


# on genome browser: use WashU epigenome
```



