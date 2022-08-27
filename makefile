
all: clean build minify

clean:
	@echo Removing build directory...
	@rm -rf ./build
	@echo Build directory was sucessfully removed!

build:
	@echo Compiling sass sources...
	@sass ./sass/:./build
	@echo Sources were sucessfully compiled to ./build/a.css

minify:
	@echo Minifying and optimizing ./build/a.css file
	@cleancss -O2 ./build/a.css > ./build/a.min.css
	@echo Done! Minified file is ./build/a.min.css

publish:
	git commit -am "New build"
	git push origin master
