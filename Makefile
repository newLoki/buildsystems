CSS_FILES = $(filter-out %.min.css, $(wildcard *.css))
CSS_MINIFIED = $(CSS_FILES:.css=.min.css)

all: minifycss

create: $(CSS_FILES)
	touch $(CSS_MINIFIED)

minifycss: $(CSS_FILES) create
%.css: %.min.css
	cleancss $@ > $<

