CSS_FILES = $(filter-out %.min.css, $(wildcard *.css))
CSS_MINIFIED = $(CSS_FILES:.css=.min.css)

all: create minifycss

create: $(CSS_FILES)
	touch $(CSS_MINIFIED)

minifycss: create $(CSS_FILES) $(CSS_MINIFIED)
%.css: %.min.css
	cleancss $@ > $<
