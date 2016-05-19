all:

	pyblue -r 2016

push:
	pyblue -r 2016 -o ~/temp/bootcamp
	rsync -avz ~/temp/bootcamp/ www@biostars.io:/home/www/sites/bootcamp2016/
