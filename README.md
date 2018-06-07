Materials and data for the [Penn State Data Analysis Bootcamp](https://bootcamp.biostars.io)

The bootcamp is about reproducible research. Let's see if we can reproduce the site that is about reproducible research... Hmmm...

* [How to generate the site][how]

First of all note that you don't actually need to fully generate this site yourself during
the bootcamp. These instructions are here just to
explain the process. But even if you don't generate the
site itself you may still **contribute** to it
via the GitHub web interface or after cloning locally.

The website
is generated from the files in the  web directory of the [bootcamp-central](https://github.com/biostars/bootcamp-central) repository
via the [pyblue][pyblue] python package.
For it work you would need to have both `Python` and the [pip package manager][pip] installed.

Clone the repository:

    git clone https://github.com/biostars/bootcamp-central

Install [pyblue][pyblue] of a specific version. It is best if you use a virtual enviroment, for example conda.

    conda create --name bootcamp python=2

Install pyblue:

    pip install pyblue==2016.6.2

You can now view the site as HTML with:

    cd bootcamp-central

the default `Makefile` action is to run the server:

    make

or

    pyblue -r web

This will start a web server on your computer and you can use the browser
to view the contents of the site. This is used while developing the site.

    http://localhost:8080

To generate a published version of the site add the `-o` parameter
with a directory name that is meant to store the output destination

    pyblue -r web -o /final/directory

[pyblue]: https://github.com/ialbert/pyblue
[pip]: http://pip.readthedocs.org/en/latest/installing.html#install-pip


