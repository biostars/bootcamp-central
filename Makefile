

# The source of the html files.
HTML_DIR=web/2016

# Temporary directory to store the output in.
TEMP_DIR=~/temp/bootcamp

# Remote directory that contains the public site.
WEB_DIR=www@biostars.io:/home/www/sites/bootcamp2016/

all:
	pyblue -r ${HTML_DIR}


# Publish to the public site
site:
	mkdir -p ${TEMP_DIR}
	pyblue -r ${HTML_DIR} -o ${TEMP_DIR} -n
	rsync -avz ${TEMP_DIR}/* ${WEB_DIR}
