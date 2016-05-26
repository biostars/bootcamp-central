# Bootcamp Central

Materials and data for the Penn State Data Analysis bootcamp.

Web: https://bootcamp.biostars.io

## How to generate the site

First of all note that you don't actually need to generate this site yourself during
the bootcamp. These instructions are here to explain the process.

The website itself is generated from the files in the 
web directory via the [pyblue][pyblue] python package. 
For it work you would need to have both `Python` 
and the `pip` package manager installed.

    pip install pyblue
    
You can now view the site as HTML with:

    pyblue -r web/2016 
    
This will start a webserver on your computer and you can use the browser
to view the contents of the site. This is used while developing the site.

    http://localhost:8080

To generate a publisshed version of the site add the `-o` parameter 
with a directory name that is meant to store the output destination

    pyblue -r web/2016 -o /final/directory

Other readings:

- [How to install `pip`][pip] 

[pyblue]: https://github.com/ialbert/pyblue
[pip]: http://pip.readthedocs.org/en/latest/installing.html#install-pip
