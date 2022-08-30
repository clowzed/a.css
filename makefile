
all: clean build minify 

clean:
	@echo Removing build directory...
	@rm -rf ./build
	@echo Build directory was sucessfully removed!

build:
	@echo Compiling sass sources...
	@sass ./sass/:./
	@rm ./a.css.map
	@echo Sources were sucessfully compiled to ./a.css

minify:
	@echo Minifying and optimizing ./a.css file
	@cleancss -O2 ./a.css > ./a.min.css
	@echo Done! Minified file is ./a.min.css

publish: clean build minify
	git commit -am "New build"
	git push origin master
	surge
