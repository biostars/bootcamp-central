# Cluster Resources
## What is a Cluster?
### Advantages of using the Cluster 

## Accessing the Cluster via Portal

You can access the Roar Collab Portal using https://rcportal.hpc.psu.edu.

## Accessing the Cluster via Terminal 
You can follow the steps below to step up your environment on the ACI server.

1. You can log in via the Terminal using the following command:
   
```bash
ssh <your user account>@submit.hpc.psu.edu ## you need to enter psu password. 
```
Assuming you have already set up 2FA on Duo, you will be prompted to accept the login request on your Duo mobile app.

# Navigating Linux systems
## Why use UNIX/Linux?
## Basic Linux Commands
### Tips and Tricks
## Useful Linux commands for Everyday Bioinformatics
`find . -type f -exec du -hs {} \; | sort -rh | head -n 5`

# Package management and software installation

## Creating a conda environment

[Conda](https://docs.conda.io/en/latest/) is a commonly used open-source package management and environment management system that allows you to install, run, and update packages while managing their dependencies on Windows, macOS, and Linux operating system. 

Once you login, run the following commands to download [conda installer](https://docs.conda.io/en/latest/miniconda.html).
```bash
cd /storage/work/<your user account>
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh ## when you run this line, please follow:
# You will see "Please, press ENTER to continue", then click the "ENTER" button to continue and then keep clicking the "Space" button.
# Then you will see the question "Do you accept the license terms? [yes|no]", enter "yes" and then "ENTER" button
# Then click "ENTER" button again and wait for its done.
# Then you will see another question "Do you wish the installer to initialize Miniconda3 by running conda init? [yes|no]", enter "yes" and then "ENTER" button.
mv ~/miniconda3 . # This step will wait a while
cd 
ln -s /storage/work/<your user account>/miniconda3
```

3. After installing conda, run the following command to install `mamba` (`mamba` provides conda parallel functionality, which significantly speeds up downloading and installing large bundle of packages):
```bash
conda install -c conda-forge mamba ## when you run this line, you will see a question 
# "Proceed ([y]/n)?", enter "y" to proceed.
```
If the above command finishes successfully, `mamba --version` should return you the installed version.

4. Create `bootcamp` environment (replace the below parameter of `-n` with the name you like if need):
```bash
wget https://raw.githubusercontent.com/biostars/bootcamp-central/master/web/archives/2023/setup/bootcamp.yaml
mamba env create -f bootcamp.yaml -n bootcamp
```
5. If succeed, the following commands should return you the version of `snakemake`
```bash
conda activate bootcamp
snakemake --version
```
6. Let's create a quick script
```bash
vim hello_world.sh
```
Press the insert button or Esc+i to start editing.  Enter/Copy the following code in your script:
```bash
#!/bin/bash
echo "Hello World!"
```
To save your script, press Esc followed by 
```bash
:wq
```
To run your script, type:
```bash
bash hello_world.sh
```
You should be able to see the following message printed on the command line:
```bash
Hello World!
```
# Requesting resources and submitting a job

Let's submit a job to run our script using cluster resources. For more information, refer to https://slurm.schedmd.com/documentation.html.

1. Create a new script that includes details on requesting resources from Roar Collab.

```bash
vim submit_job.sh
```

```bash
#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1 
#SBATCH --mem=250GB 
#SBATCH --time=48:00:00 
#SBATCH -A open
#SBATCH --output=run.out
#SBATCH --error=run.err
#SBATCH --export=ALL
#SBATCH --mail-type=END
#SBATCH --mail-user=username@psu.edu
#SBATCH --job-name=giveitanynameofchoice
```
Make sure to include the name of your script in your job submission script.

```bash
sh hello_world.sh
```
2. Now that we have created our script, let's submit our job.
``` bash
sbatch submit_job.sh
```
You will get a confirmation saying the job has been submitted, along with a job ID. 
For example, `Submitted batch job 4957984`. Make a note of your job ID for reference.

3. Now that we have submitted our job, let's make sure that it's queued.
 ```bash
squeue  --job 4957984
```
You should be able to see the status of your job. For example:
```
   JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
           4957989      open bootcamp  vab5299 PD       0:00      1 (Priority)
```

When your job is completed, the status changes:
```   JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
           4957989      open bootcamp  vab5299 CF       0:00      1 (Priority)
```
4. Two files `run.err` and `run.out` will be created in the directory where you run your job. `run.out` contains the output of your script while `run.err` contains a log of any errors that may have occurred.
```bash
 cat run.out
```
prints
```bash
Hello World!
``` 
5. When the job is completed successfully, you will receive an e-mail. 

# Github - storing and sharing scripts with Git

# Where to go for help
