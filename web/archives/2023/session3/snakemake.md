## Snakemake
<br/>
`Snakemake` is a powerful, python-based workflow management tool that aims to improve **reproducibility and scalability** of creating workflows across different systems. It allows users to define customized rules for deriving output from input files, making it easier to build a workflow.
<br/><br/>
In this part of module 3, we will first introduce the basic syntax in Snakemake, and then utilize a ATAC-seq pipeline as an example to show how to create it using Snakemake. 

### Prerequisite
Basic knowledge about Python and Bash is required.

### Basic Usage
To build a workflow via Snakemake, you will need to create a so-called `Snakefile` which is commonly end with a suffix `.smk` (e.g., "workflow.smk"). Adding this suffix to the file name will help people better identify it as a snakefile. But the Snakemake can still read the file even if the suffix is not present. A snakefile is a collection of different rules. 

A rule is composed of a few directives `input` , `params`, `output` and `shell/run`. 
Here is a basic framework of a rule:
```snakemake
rule <a rule name>:
	input:
		<your input files>
	params:
		<some required parameters>
	output:
		<your output files>
	shell/run:
		<your command lines>
```
A Snakemake rule has to start with a keyword `rule` followed by a given name (e.g., "download_data"). The `input` and `output` directives are followed by lists of files (separated by `,`) that are expected to be used or created by the rule. However, both of them are optional directives that we will talk later when we need them. The `params` is also an optional directive where you can put some required parameters used in the command lines. A last and required directive is `shell` or `run` , followed by a Python string or a few simple python lines to execute the commands. 

We will use [an ATAC-seq pipeline](https://colab.research.google.com/drive/1K_QcazNpwtM8TdkdiLrI8UlsHhQ4Ri0L?usp=sharing) as an example to further demonstrate how to use these directives.

To run a workflow described in a snakefile, we can execute:
```bash
snakemake -c <number of cores to use> -s <path to snakemake file> 
```
The `-c` (or `--cores`) flag is required and used to specify the number of cores to use. It tells Snakemake to use a specified number of cores in the machine to run the workflow in parallel according to the dependence. If `-c` is given without a number, all available cores are used. 

It is always a good habit to use `dry run` to examine whether there are any syntax errors or something missing in the snakefile via:
```bash
snakemake -np -s <path to snakemake file> 
``` 
Using `-n` (or `--dry-run`) flag, Snakemake will only show the execution plan instead of actually performing the steps. The `-p` flag instructs Snakemake to also print the resulting shell command for illustration. 

### Reference
[Snakemake Official Tutorial ](https://snakemake.readthedocs.io/en/stable/tutorial/tutorial.html)