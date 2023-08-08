# Cluster and Computational Resources
## Accessing the Cluster via Portal
## Accessing the Cluster via Terminal 
You can follow the steps below to step up your environment on the ACI server.

1. Make sure you have registered the ICDS-ACI Account (See more details in above ICDS-ACI Account Section). Once you have the ACI account, you should be able to log in using command:
```bash
ssh <your user account>@submit.hpc.psu.edu ## you need to enter psu password. If you want to login without password, please refer to http://www.linuxproblem.org/art_9.html.
```
# Navigating Linux systems
## Why use UNIX/Linux?
## Basic Linux Commands
### Tips and Tricks
## Useful Linux commands for Everyday Bioinformatics

# Package management and software installation
## Creating a conda environment

[Conda](https://docs.conda.io/en/latest/) is a commonly used open-source package management and environment management system that allows you to install, run, and update packages while managing their dependencies on Windows, macOS, and Linux operating system. 

Once you login, run the following commands to download [conda installer](https://docs.conda.io/en/latest/miniconda.html).
```bash
cd /storage/work/<your user account>
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh ## when you run this line, please follow:
# You will see "Please, press ENTER to continue", then click the "ENTER" button to continue and then keep clicking the "Space" button.
# Then you will see a question "Do you accept the license terms? [yes|no]", enter "yes" and then "ENTER" button
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
vim hello_world.sh```

Press the insert button or Esc+i to start editing.  Enter/Copy the following code in your script:
```bash
#!/bin/bash
echo "Hello World!"```

# Requesting resources and submitting a job

# Github - storing and sharing scripts with Git

# Where to go for help
