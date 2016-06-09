#
# Makefile to build the bootcamp website.
#

# The source of the html files.
HTML_DIR=web/2016

# Temporary directory to store the output in.
TEMP_DIR=~/temp/bootcamp

# Remote host and directory that contains the site.
WEB_HOST=www@biostars.io
WEB_DIR=sites/bootcamp2016/
WEB_PATH=${WEB_HOST}:${WEB_DIR}

# Default action is to serve the directory.
all:
	pyblue -r ${HTML_DIR}

pull:
	# Bring this repository in sync with master.
	git pull https://github.com/biostars/bootcamp-central.git

# Removes the temporary directory.
clean:
	rm -rf ${TEMP_DIR}

# Wipes the remote web path.
remoteclean:
	ssh ${WEB_HOST} "rm -rf  ${WEB_DIR}/*"

# Generates the site into a temporary directory.
generate:
	# Makes the temporary directory
	mkdir -p ${TEMP_DIR}

	# We need this since html files may include other markdown files.
	find . -type f -name "*.html" -exec  touch '{}' \;

	# Genereate the static site.
	pyblue -r ${HTML_DIR} -o ${TEMP_DIR}

# Publish to the public site via rsync.
site: generate
	# Synchronize the changed files
	rsync -avz ${TEMP_DIR}/* ${WEB_PATH}

