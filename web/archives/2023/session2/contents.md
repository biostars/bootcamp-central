# Cluster Resources

## What is a Cluster?
A group of loosely connected/linked computers that can work together as a single highly available system
### Advantages of using the Cluster 
1. Storage / Manageability: 
You are able to store a large amount of data across many different machines which can be accessed via any computer with access (much like a cloud).
2. Availability/Computing Resources: 
 A single computer is limited in the amount of processing power it has. Multiple computers expand this computational limit. This translates to greater capability to download, store, and process data

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
## What is a Command Line Interface (CLI)?
A CLI is a text-based user interface used to interact with a computer or software by entering commands as text input instead of using graphical elements like windows, buttons, and icons. 

## Why use UNIX/Linux for Bioinformatics?
- Many Bioinformatics tools are written for UNIX/Linux and cannot be easily adapted to Windows
- GUI tools like Notepad and Excel have a size limit
- The compute cluster runs on a Linux-based OS
- More precise control and automation capabilities make it easier to string together a pipeline for analysis (more in Session 3!)

Reference:
- Justifying Learning Linux For Bioinformatics.Retrieved August 9, 2023, from https://www.biostars.org/p/11085/
- Why should Biologists learn Unix for Bioinformatics? Retrieved August 9, 2023, from https://bioinformatics.ccr.cancer.gov/btep/why-should-biologists-learn-unix-for-bioinformatics/


## How to access the CLI
- On Mac: Dock/Finder
- On Windows: WSL/Ubuntu from Microsoft Store (easiest option)
- On Linux: Ctrl + Alt + T or right-click the Desktop/Directory

## Regarding Paths 
In Linux, a path is the address of a file or directory in the file system. These are essential for navigating and working with files and directories on a Linux system.

There are two types of paths:
- Absolute paths:  Provides the complete and unambiguous location of a file or directory starting from the root directory. It includes all the necessary directory names to reach the desired location. An absolute path always begins with a forward slash ("/") which represents the root directory.
Example: `/home/user/documents/file.txt` is an absolute path to a file named `file.txt` located in the `documents` directory of the `user` directory, which is within the `home` directory.
- Relative paths: Specifies the location of a file or directory relative to the current working directory. It does not start from the root directory but describes the path from the current location. Relative paths are useful when you are already in a specific directory and want to reference other files or directories within or adjacent to it.
Example: If you are currently in the `/home/user` directory, then `documents/file.txt` is a relative path to the same file mentioned above.

How to find your way in Linux:
- If you want to know where you are currently in the file system, use the command `pwd` (present working directory):
```bash
pwd
```
gives
```bash
/home/venitha
```
on my computer. 

Some important symbols and notations used while constructing a path:

   - . (dot): Represents the current directory.
   - .. (dot-dot): Represents the parent directory.
   - ~ (tilde): Represents the home directory of the current user.

## Regarding Commands
A command, like `pwd`, is a specific instruction or action that you can give to the operating system through the CLI. Most commands in Linux have parameters or options that can be used to modify the behaviour of the command, called flags. For example, the `ls` command can be used to display the contents of a directory. You can use the flags `-l', `-a` and other flags to change what contents are read and how.

Usually, shorter, single-letter flags use a single hyphen (`-a`) whilst longer commands use two (`--all`) but this may not apply to every tool/software you may come across. Always read the manual!


## Basic Linux Commands
1. Creating/Deleting a directory and viewing its contents
   
To create a directory we can use the `mkdir` command followed by the name of the directory:
```bash
mkdir test1
```
You can check if the directory has been created by using the `ls` command:

```bash
ls
```
should output the directory `test1` along with other directories that are present.

```bash
quals  stat55  test1
```
To delete an empty directory, like the one we just created, we can use `rmdir`.

Word of advice: Be very careful while deleting files/directories on the CLI! You will not be able to recover your data after deleting them.

```bash
mkdir test2
ls
#Output
#quals  stat55  test1  test2
rmdir test2
ls
#Output
#quals  stat55  test1
```

2. Creating a file

Let's create a quick script
```bash
vim hello_world.sh
```
Press the insert button or Esc+i to start editing.  Enter/Copy the following code in your script:
```bash
#!/bin/bash
echo "Hello World!"
```
To save your script, press Esc followed by `:wq`.

To run your script, type:
```bash
bash hello_world.sh
```
You should be able to see the following message printed on the command line:
```bash
Hello World!
```
3. Moving, copying and renaming files

Let's create a copy of our script and move it to the directory we just created:

```bash
cp hello_world.sh hello_world_copy.sh 
mv hello_world_copy.sh test1
```
To move into another directory, we can use `cd`. Let's rename the copy we just moved:

```bash
pwd
cd test1
pwd
mv hello_world_copy.sh hello_world_new_name.sh
ls
```
As you can see, you can use `mv` to both move and rename a file.

Now let's navigate back to the parent folder and delete test1 along with its contents.

```bash
cd .. #Remember, .. represents the parent directory
rm -r test1 
ls
```
Here, `rm` is the command to delete or remove a file while the `-r` flag modifies rm to remove files recursively, that is delete the contents of the directory first followed by the directory itself. Once again, be careful when you use this command as there is no way to recover your data once deleted.

4. Manipulating Files

File types and file extensions in Linux:
  In Linux, file extensions are not as critical as they are in some other operating systems, like Windows. While file extensions can provide useful information about the type of a file, Linux primarily determines a file's type based on its content and metadata rather than solely relying on the extension. However, it is good practice to give your files an extension just so the user (either you or someone else) has an idea of the contents. Using common file extensions can also help ensure compatibility when you move your files between operating systems.

Some common tools to read files are `cat` and `less`:

```bash
cat hello_world.sh
```
`cat` outputs the entire contents of the file onto the terminal all at once; it's useful if you have a very small file and you want to quickly view the contents. For larger files, `less` is more useful:

```bash
less hello_world.sh
```
`less` displays one page at a time on a separate screen. You can also scroll through the file using the up and down arrow keys.

### Tips and Tricks

Save yourself from hours of endless frustration by 
- Using auto-complete: Up and down arrow keys, Tab
- Following the same naming conventions for files and directories
- Copying and pasting paths
- Using text editors for coding
- Consulting the manual 
  Eg. `man less`, `man cat`, `man man`
- Making yourself familiar with special characters/hidden characters like whitespaces

## Useful Linux commands for Everyday Bioinformatics
- Command piping using `|` and I/O operators
```bash
ls -1 | wc -l
ls -1 | wc -l >result.txt
```
- Links: Symlinks and hardlinks
``` bash
ln -s /path/to/target /path/to/link #To create a symlink
ln /path/to/target /path/to/link #To create a hardlink
```
- Manipulating text using `sed` and `awk`
```bash
sed -e 's/!/?/' -e 's/echo//' -e 's/\s//' hello_world.sh
awk '{ gsub("!", "?"); sub("echo ", ""); print }' hello_world.sh
```
- Checking available storage
`bash
find . -type f -exec du -hs {} \; | sort -rh | head -n 5`
```
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

# Requesting resources and submitting a job

Let's submit a job to run our `hello_world.sh` script using cluster resources. For more information, refer to https://slurm.schedmd.com/documentation.html.

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
```
   JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
           4957989      open bootcamp  vab5299 CF       0:00      1 (Priority)
```
4. Two files `run.err` and `run.out` will be created in the directory where you run your job. `run.out` contains the output of your script while `run.err` contains a log of any errors that may have occurred.

Let's look at the output for our script.

```bash
 cat run.out
```
This should print

```bash
Hello World!
``` 
5. When the job is completed successfully, you will receive an e-mail. 

# Github - storing and sharing scripts with Git

1. Make sure you have the GitHub CLI installed
```bash
gh --version
```
2. Logging in to your GitHub account via the CLI
 
Type the following command and follow the interactive prompts.
```bash
gh auth login
```

3. Creating a repository
Navigate to the directory where you want to create a new repository and follow the interactive prompts.

4. Uploading a file
Let's upload our `hello_world.sh` script to the new GitHub repository.

First, copy the script to the local repository
```bash
cp /path/to/hello_world.sh /path/to/local/repository
```

After navigating to your local repository, stage the file for commit
``` bash
cd /path/to/local/repository
git add hello_world.sh
```
Time to commit the changes! You can add a short comment on the changes made.

```bash
git commit -m "Added hello_world.sh"
```
Finally, we push the changes to the remote repository on GitHub
``` bash
git push
```
You will be able to see `hello_world.sh` on your GitHub repository online.

5. Editing and updating a file

Every time you edit the file locally, you need to commit the changes and push the file to the remote repository.

Let's edit `hello_world.sh`

```bash
vim hello_world.sh
```
Now we need to stage the changes to commit.

```bash
git add hello_world.sh
```
To commit the changes, type:

```bash
git commit -m "Updated hello_world.sh"
```
Don't forget to push the changes!

```bash
git push
```
Now you will be able to see an updated version of `hello_world.sh` online.

# Interacting with the Cluster from your local computer

1. Downloading/copying a file from the cluster via CLI
```bash
scp username@submit.hpc.psu.edu:path/to/hello_world.sh .
```
2. Uploading/copying a file to the cluster via CLI
```bash
scp path/to/hello_world.sh username@submit.hpc.psu.edu:path/to/desired/directory
```
Remember, you can do either of these via the portal as well!

# Where to go for help
