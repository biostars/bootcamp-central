## Bootcamp Central

Materials and data for the [Penn State Data Analysis Bootcamp](https://bootcamp.biostars.io) deployed at <https://bootcamp.biostars.io>

The bootcamp is about reproducible research. 

Let's see if we can reproduce the site that is about reproducible research... Hmmm...

### How to generate the site

First of all note that you don't actually need to fully generate this site yourself during
the bootcamp. These instructions are here just to explain the process. 

The website is generated from the files in the  [web](web) directory of the [bootcamp-central](https://github.com/biostars/bootcamp-central) repository via the [pyblue][pyblue] python package.

The `pyblue` program is written in Python. It is best if you use `conda` to create different Python environments, but using `conda` is not a strict requirement.

### Installation

    # Create a new Python environment.
    conda create --name bootcamp python=3.8 -y

    # Activate the environment.
    conda activate bootcamp

    # Install the pyblue package.
    pip install pyblue --upgrade

    # Clone the website content.
    git clone https://github.com/biostars/bootcamp-central

    # Switch to the repository.
    cd bootcamp-central
        
    # The default action is to run the server   
    make
 
the `make` command above invokes:

    pyblue -r web
    
The above commands will start a web server on your computer and you can use the browser
to view the contents of the site:

    http://localhost:8000

To generate a published version of the site add the `-o` parameter
with a directory name that is meant to store the output destination

    pyblue -r web -o /final/directory

[pyblue]: https://github.com/ialbert/pyblue
[pip]: http://pip.readthedocs.org/en/latest/installing.html#install-pip


