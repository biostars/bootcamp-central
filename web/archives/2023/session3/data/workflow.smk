"""
This file is a SnakeMake Script to automate the ATAC-seq analysis workflow

Usage:
    snakemake --cores 8 -s workflow.smk 
"""

## Import Python standard libraries
import os, sys

## Define Some Global Variables
CURRENT_PATH = os.getcwd()
ADAPTER1 = "CTGTCTCTTATACACATCTCCGAGCCCACGAGAC"
ADAPTER2 = "CTGTCTCTTATACACATCTGACGCTGCCGACGA"

## Create Required Folders
if not os.path.exists(os.path.join(CURRENT_PATH, "data")):
    os.makedirs(os.path.join(CURRENT_PATH, "data"))
if not os.path.exists(os.path.join(CURRENT_PATH, "trim_and_fastqc")):
    os.makedirs(os.path.join(CURRENT_PATH, "trim_and_fastqc"))
if not os.path.exists(os.path.join(CURRENT_PATH, "alignment_peak")):
    os.makedirs(os.path.join(CURRENT_PATH, "alignment_peak"))
if not os.path.exists(os.path.join(CURRENT_PATH, "visualization")):
    os.makedirs(os.path.join(CURRENT_PATH, "visualization"))

## Build Rules
rule targets:
    input:
        os.path.join(CURRENT_PATH, "data", "ENCFF933NTR.bed.gz"),
        os.path.join(CURRENT_PATH, "data", "SRR891268_chr22_enriched_R1.fastq.gz"),
        os.path.join(CURRENT_PATH, "data", "SRR891268_chr22_enriched_R2.fastq.gz"),
        os.path.join(CURRENT_PATH, "data", "chr22_genes.bed"),
        os.path.join(CURRENT_PATH, "alignment_peak", "chr22.fa.gz"),
        os.path.join(CURRENT_PATH, "alignment_peak", "chr22.fa"),
        os.path.join(CURRENT_PATH, "visualization", "bedGraphToBigWig"),
        os.path.join(CURRENT_PATH, "visualization", "hg38.chrom.sizes"),
        os.path.join(CURRENT_PATH, "data", "intergenic_CTCF_peaks_chr22.bed"),
        os.path.join(CURRENT_PATH, "trim_and_fastqc", "trimmed_r1.fastq"),
        os.path.join(CURRENT_PATH, "trim_and_fastqc", "trimmed_r2.fastq"),
        os.path.join(CURRENT_PATH, "trim_and_fastqc", "output_cutadapt_PE_trimlog.txt"),
        os.path.join(CURRENT_PATH, "alignment_peak", "aligned_sorted.bam"),
        os.path.join(CURRENT_PATH, "alignment_peak", "filtered_sorted.bam"),
        os.path.join(CURRENT_PATH, "alignment_peak", "dedup_filtered.bam"),
        os.path.join(CURRENT_PATH, "alignment_peak", "insert_size_metrics.txt"),
        os.path.join(CURRENT_PATH, "alignment_peak", "insert_size_histogram.pdf"),
        os.path.join(CURRENT_PATH, "alignment_peak", "output.bed"),
        os.path.join(CURRENT_PATH, "alignment_peak", "macs2_out_treat_pileup.bdg"),
        os.path.join(CURRENT_PATH, "visualization", "heatmap_matrix.gz"),
        os.path.join(CURRENT_PATH, "visualization", "heatmap_macs2_peak_on_chr22_genes.png"),
        os.path.join(CURRENT_PATH, "visualization", "ctcf_heatmap_matrix.gz"),
        os.path.join(CURRENT_PATH, "visualization", "heatmap_macs2_peak_on_ctcf_peaks.png")

# step1: download samples，and all required tools
# chr22 genes can be obtained here: https://genome.ucsc.edu/cgi-bin/hgTables
# thanks to UCSC: https://hgdownload.soe.ucsc.edu/goldenPath/hg38/chromosomes/
rule step1_download:
    output:
        os.path.join(CURRENT_PATH, "data", "ENCFF933NTR.bed.gz"),
        os.path.join(CURRENT_PATH, "data", "SRR891268_chr22_enriched_R1.fastq.gz"),
        os.path.join(CURRENT_PATH, "data", "SRR891268_chr22_enriched_R2.fastq.gz"),
        os.path.join(CURRENT_PATH, "data", "chr22_genes.bed"),
        os.path.join(CURRENT_PATH, "alignment_peak", "chr22.fa.gz"),
        os.path.join(CURRENT_PATH, "alignment_peak", "chr22.fa"),
        os.path.join(CURRENT_PATH, "visualization", "bedGraphToBigWig"),
        os.path.join(CURRENT_PATH, "visualization", "hg38.chrom.sizes"),
        os.path.join(CURRENT_PATH, "data", "intergenic_CTCF_peaks_chr22.bed")
    params:
        sample_zendo_link_prefix = "https://zenodo.org/record/3862793/files/",
        hg38_chr22_gene_link_prefix = "https://raw.githubusercontent.com/biostars/bootcamp-central/master/web/archives/2023/session3/data/",
        hg38_chr22_chrom_link_prefix = "https://hgdownload.soe.ucsc.edu/goldenPath/hg38/chromosomes/",
        bedgrapht0bigwig_link_prefix = "https://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64.v369/",
        hg38_chrom_sizes_link_prefix = "https://hgdownload.cse.ucsc.edu/goldenpath/hg38/bigZips/"
    run:
        shell(f"wget {params.sample_zendo_link_prefix}ENCFF933NTR.bed.gz -O {output[0]}")
        shell(f"wget {params.sample_zendo_link_prefix}SRR891268_chr22_enriched_R1.fastq.gz -O {output[1]}")
        shell(f"wget {params.sample_zendo_link_prefix}SRR891268_chr22_enriched_R2.fastq.gz -O {output[2]}")
        shell(f"wget {params.hg38_chr22_gene_link_prefix}chr22_genes.bed -O {output[3]}")
        shell(f"wget {params.hg38_chr22_chrom_link_prefix}chr22.fa.gz -O {output[4]}")
        shell(f"gunzip -c {output[4]} > {output[5]}")
        shell(f"wget {params.bedgrapht0bigwig_link_prefix}bedGraphToBigWig -O {output[6]}")
        shell(f"chmod +x {output[6]}")
        shell(f"wget {params.hg38_chrom_sizes_link_prefix}hg38.chrom.sizes -O {output[7]}")
        # intersect of CTCF peak and chr22 genes
        shell(f"less {output[0]} | grep chr22 | intersectBed -a - -b {output[3]} -wa -u > {output[8]}")


# step2: trim and fastqc
rule step2_trim_and_fastqc:
    input:
        os.path.join(CURRENT_PATH, "data", "SRR891268_chr22_enriched_R1.fastq.gz"),
        os.path.join(CURRENT_PATH, "data", "SRR891268_chr22_enriched_R2.fastq.gz")
    output:
        os.path.join(CURRENT_PATH, "trim_and_fastqc", "trimmed_r1.fastq"),
        os.path.join(CURRENT_PATH, "trim_and_fastqc", "trimmed_r2.fastq"),
        os.path.join(CURRENT_PATH, "trim_and_fastqc", "output_cutadapt_PE_trimlog.txt")
    params:
        working_path = os.path.join(CURRENT_PATH, "trim_and_fastqc"),
        adapter1 = ADAPTER1,
        adapter2 = ADAPTER2
    run:
        # adapter for ATAC-seq is known, why?
        shell(f"cd {params.working_path}; cutadapt -a {params.adapter1} -A {params.adapter2} --quality-cutoff=15,10 --minimum-length=20 -o {output[0]} -p {output[1]} {input[0]} {input[1]} > {output[2]}")
        shell(f"cd {params.working_path}; fastqc {output[0]} {output[1]} -o {params.working_path}/.")


# step3: alignment and peak call
rule step3_alignment_and_peakcall:
    input:
        os.path.join(CURRENT_PATH, "alignment_peak", "chr22.fa"),
        os.path.join(CURRENT_PATH, "trim_and_fastqc", "trimmed_r1.fastq"),
        os.path.join(CURRENT_PATH, "trim_and_fastqc", "trimmed_r2.fastq")
    output:
        os.path.join(CURRENT_PATH, "alignment_peak", "aligned_sorted.bam"),
        os.path.join(CURRENT_PATH, "alignment_peak", "filtered_sorted.bam"),
        os.path.join(CURRENT_PATH, "alignment_peak", "dedup_filtered.bam"),
        os.path.join(CURRENT_PATH, "alignment_peak", "insert_size_metrics.txt"),
        os.path.join(CURRENT_PATH, "alignment_peak", "insert_size_histogram.pdf"),
        os.path.join(CURRENT_PATH, "alignment_peak", "output.bed"),
        os.path.join(CURRENT_PATH, "alignment_peak", "macs2_out_treat_pileup.bdg")
    params:
        working_path = os.path.join(CURRENT_PATH, "alignment_peak"),
        samtool_q = 30,
        samtool_f = 2,
        mac2_q = 0.01,
        mac2_shift = 100,
        mac2_extsize = 200,
        mac2_keepdup = 1000
    run:
        shell(f"cd {params.working_path}; bwa index -p index_chr22 {input[0]}")
        shell(f"cd {params.working_path}; bwa mem index_chr22 {input[1]} {input[2]} | samtools view -bS - | samtools sort - -O 'bam' -o {output[0]} -T temp_aln")
        shell(f"cd {params.working_path}; samtools flagstat {output[0]} > flagstat.log1")
        shell(f"cd {params.working_path}; samtools view -b -q {params.samtool_q} -f {params.samtool_f} -o {output[1]} {output[0]}")
        shell(f"cd {params.working_path}; samtools flagstat {output[1]} > flagstat.log2 ")
        shell(f"cd {params.working_path}; samtools rmdup {output[1]} {output[2]}")
        shell(f"cd {params.working_path}; samtools flagstat {output[2]} > flagstat.log3")
        shell(f"cd {params.working_path}; picard CollectInsertSizeMetrics I={output[2]} O={output[3]} H={output[4]}")
        shell(f"cd {params.working_path}; bedtools bamtobed -i {output[2]} > {output[5]}")
        shell(f"cd {params.working_path}; macs2 callpeak -t {output[5]} -g hs -q {params.mac2_q} --nomodel --shift {params.mac2_shift} --extsize {params.mac2_extsize} --keep-dup {params.mac2_keepdup} -n macs2_out -B")


# step4: visualization
rule step4_visualization:
    input:
        os.path.join(CURRENT_PATH, "alignment_peak", "macs2_out_treat_pileup.bdg"),
        os.path.join(CURRENT_PATH, "data", "chr22_genes.bed"),
        os.path.join(CURRENT_PATH, "data", "intergenic_CTCF_peaks_chr22.bed")
    output:
        temp(os.path.join(CURRENT_PATH, "visualization", "temp_bed_region.bed")),
        os.path.join(CURRENT_PATH, "visualization", "heatmap_matrix.gz"),
        os.path.join(CURRENT_PATH, "visualization", "heatmap_macs2_peak_on_chr22_genes.png"),
        os.path.join(CURRENT_PATH, "visualization", "ctcf_heatmap_matrix.gz"),
        os.path.join(CURRENT_PATH, "visualization", "heatmap_macs2_peak_on_ctcf_peaks.png")
    params:
        working_path = os.path.join(CURRENT_PATH, "visualization")
    run:
        shell(f"cd {params.working_path}; {os.path.join(params.working_path, 'bedGraphToBigWig')} {input[0]} {os.path.join(params.working_path, 'hg38.chrom.sizes')} {os.path.join(params.working_path, 'macs2_out_treat.bw')}")
        shell(f"cd {params.working_path}; sed '1d' {input[1]} > {output[0]}")
        shell(f"cd {params.working_path}; computeMatrix reference-point -S {os.path.join(params.working_path, 'macs2_out_treat.bw')} -R {output[0]} -o {output[1]}")
        shell(f"cd {params.working_path}; plotHeatmap -m {output[1]} -o {output[2]}")
        shell(f"cd {params.working_path}; computeMatrix reference-point -S {os.path.join(params.working_path, 'macs2_out_treat.bw')} -R {input[2]} -o {output[3]}")
        shell(f"cd {params.working_path}; plotHeatmap -m {output[3]} -o {output[4]}")
