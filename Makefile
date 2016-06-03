

# The source of the html files.
HTML_DIR=web/2016

# Temporary directory to store the output in.
TEMP_DIR=~/temp/bootcamp

# Remote directory that contains the public site.
WEB_DIR=www@biostars.io:sites/bootcamp2016/

all:
	pyblue -r ${HTML_DIR}

clean:
	rm -rf ${TEMP_DIR}

remoteclean:
	ssh root@server2 "sync; sync; /sbin/shutdown -h now"

# Generates the site into a temporary directory
generate:
	mkdir -p ${TEMP_DIR}
	pyblue -r ${HTML_DIR} -o ${TEMP_DIR}

# Publish to the public site via rsync
site: generate
	rsync -avz ${TEMP_DIR}/* ${WEB_DIR}

