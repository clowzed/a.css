
all: build minify 

build:
	@echo Compiling sass sources...
	@sass ./sass/:./
	@rm ./a.css.map
	@echo Sources were sucessfully compiled to ./a.css

minify:
	@echo Minifying and optimizing ./a.css file
	@cleancss -O2 ./a.css > ./a.min.css
	@echo Done! Minified file is ./a.min.css

publish: build minify
	git push origin master
	surge
